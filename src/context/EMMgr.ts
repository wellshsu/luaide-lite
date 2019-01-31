"use strict"

import * as vscode from "vscode"
import * as path from "path"
import { LanguageClient, LanguageClientOptions, ServerOptions } from "vscode-languageclient"
import { EXMgr } from "./EXMgr"
import { LanguageConfiguration } from "vscode";

export interface AnnotatorParams {
    uri: string;
}

export enum AnnotatorType {
    Param,
    Global,
    DocType,
    Upvalue,
}

export interface IAnnotator {
    uri: string;
    ranges: vscode.Range[];
    type: AnnotatorType;
}

export interface IProgressReport {
    text: string;
    percent: number;
}

export class LuaLanguageConfiguration implements LanguageConfiguration {
    public onEnterRules = [
        {
            action: { indentAction: vscode.IndentAction.None, appendText: "---" },
            beforeText: /^---/,
        }
    ];
}

export class EMMgr {
    private static savedContext: vscode.ExtensionContext
    private static client: LanguageClient
    private static activeEditor: vscode.TextEditor
    private static javaExecutablePath: string | null
    private static timeoutToReqAnn: NodeJS.Timer;
    private static decorateParamter: vscode.TextEditorDecorationType;
    private static decorateGlobal: vscode.TextEditorDecorationType;
    private static decorateAnnotation: vscode.TextEditorDecorationType;
    private static decorateUpvalue: vscode.TextEditorDecorationType;

    public static activate(context: vscode.ExtensionContext) {
        EMMgr.savedContext = context
        EMMgr.javaExecutablePath = EXMgr.getJavaExe()
        EMMgr.startClient()
        EMMgr.savedContext.subscriptions.push(vscode.workspace.onDidChangeConfiguration(EMMgr.onDidChangeConfiguration, null, EMMgr.savedContext.subscriptions))
        EMMgr.savedContext.subscriptions.push(vscode.workspace.onDidChangeTextDocument(EMMgr.onDidChangeTextDocument, null, EMMgr.savedContext.subscriptions))
        EMMgr.savedContext.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(EMMgr.onDidChangeActiveTextEditor, null, EMMgr.savedContext.subscriptions))
        EMMgr.savedContext.subscriptions.push(vscode.commands.registerCommand("emmy.restartServer", EMMgr.restartServer))
        EMMgr.savedContext.subscriptions.push(vscode.commands.registerCommand("emmy.showReferences", EMMgr.showReferences))
        EMMgr.savedContext.subscriptions.push(vscode.languages.setLanguageConfiguration(EXMgr.LANGUAGE_ID, new LuaLanguageConfiguration()))
    }

    public static deactivate() {
        EMMgr.stopServer()
    }

    private static onDidChangeTextDocument(event: vscode.TextDocumentChangeEvent) {
        if (EMMgr.activeEditor && EMMgr.activeEditor.document === event.document) {
            EMMgr.requestAnnotators(EMMgr.activeEditor, EMMgr.client)
        }
    }

    private static onDidChangeActiveTextEditor(editor: vscode.TextEditor | undefined) {
        if (editor === undefined) {
            return
        }
        EMMgr.activeEditor = editor as vscode.TextEditor
        EMMgr.requestAnnotators(EMMgr.activeEditor, EMMgr.client)
    }

    private static onDidChangeConfiguration(event: vscode.ConfigurationChangeEvent) {
        let shouldRestart = false
        let newJavaExecutablePath = EXMgr.getJavaExe()
        if (newJavaExecutablePath !== EMMgr.javaExecutablePath) {
            EMMgr.javaExecutablePath = newJavaExecutablePath
            shouldRestart = true
        }
        EMMgr.updateDecorations();
        if (shouldRestart) {
            EMMgr.restartServer()
        }
    }

    private static startClient() {
        const clientOptions: LanguageClientOptions = {
            documentSelector: [{ scheme: "file", language: EXMgr.LANGUAGE_ID }],
            synchronize: {
                configurationSection: "luaide-lite",
                fileEvents: [
                    vscode.workspace.createFileSystemWatcher("**/*.lua")
                ]
            },
            initializationOptions: {
                stdFolder: vscode.Uri.file(path.resolve(EMMgr.savedContext.extensionPath, "res/emmy/std")).toString(),
                apiFolders: [],
                workspaceFolders: vscode.workspace.workspaceFolders ? vscode.workspace.workspaceFolders.map(f => f.uri.toString()) : null,
            }
        }

        let serverOptions: ServerOptions
        const cp = path.resolve(EMMgr.savedContext.extensionPath, "res/emmy/", "*")
        const exePath = EMMgr.javaExecutablePath || "java"
        serverOptions = {
            command: exePath,
            args: ["-cp", cp, "com.tang.vscode.MainKt"]
        }

        EMMgr.client = new LanguageClient(EXMgr.LANGUAGE_ID, EXMgr.extensionName, serverOptions, clientOptions)
        EMMgr.client.onReady().then(() => {
            EMMgr.client.onNotification("emmy/progressReport", (d: IProgressReport) => {
                if (d.text.indexOf("Emmy load file: ") >= 0) {
                    let barText = "Parsing(" + (d.percent * 100).toFixed(0) + "%): " + d.text.replace("Emmy load file: ", "")
                    EXMgr.Bar.text = barText
                    if (d.percent >= 1) {
                        EXMgr.Bar.text = EXMgr.extensionName + " ✔"
                    }
                }
            })
            EMMgr.onDidChangeActiveTextEditor(vscode.window.activeTextEditor)
        }).catch(reson => {
            vscode.window.showErrorMessage("Failed to start EmmyLua server!\n${reson}", "Try again").then(item => {
                EMMgr.startClient()
            })
        })
        const disposable = EMMgr.client.start()
        EMMgr.savedContext.subscriptions.push(disposable)
    }

    private static restartServer() {
        if (!EMMgr.client) {
            EMMgr.startClient()
        } else {
            EMMgr.client.stop().then(() => {
                EMMgr.startClient()
            })
        }
    }

    private static showReferences(uri: string, pos: vscode.Position) {
        const u = vscode.Uri.parse(uri)
        const p = new vscode.Position(pos.line, pos.character)
        vscode.commands.executeCommand("vscode.executeReferenceProvider", u, p).then(locations => {
            vscode.commands.executeCommand("editor.action.showReferences", u, p, locations)
        })
    }

    private static stopServer() {
        if (EMMgr.client) {
            EMMgr.client.stop()
        }
    }

    private static updateDecorations() {
        let config: vscode.DecorationRenderOptions = {}
        config.light = { color: EXMgr.lightParameter };
        config.dark = { color: EXMgr.darkParameter };
        EMMgr.decorateParamter = vscode.window.createTextEditorDecorationType(config)

        config = {}
        config.light = { color: EXMgr.lightGlobal };
        config.dark = { color: EXMgr.darkGlobal };
        EMMgr.decorateGlobal = vscode.window.createTextEditorDecorationType(config)

        config = {}
        config.light = { color: EXMgr.lightAnnotation };
        config.dark = { color: EXMgr.darkAnnotation };
        EMMgr.decorateAnnotation = vscode.window.createTextEditorDecorationType(config)

        config = {}
        config.textDecoration = "underline"
        EMMgr.decorateUpvalue = vscode.window.createTextEditorDecorationType(config)
    }

    private static requestAnnotators(editor: vscode.TextEditor, client: LanguageClient) {
        clearTimeout(EMMgr.timeoutToReqAnn);
        EMMgr.timeoutToReqAnn = setTimeout(() => {
            EMMgr.requestAnnotatorsImpl(editor, client);
        }, 300);
    }

    private static requestAnnotatorsImpl(editor: vscode.TextEditor, client: LanguageClient) {
        if (!EMMgr.decorateParamter) {
            EMMgr.updateDecorations();
        }
        let params: AnnotatorParams = { uri: editor.document.uri.toString() };
        client.sendRequest<IAnnotator[]>("emmy/annotator", params).then(list => {
            let map: Map<AnnotatorType, vscode.Range[]> = new Map();
            map.set(AnnotatorType.DocType, []);
            map.set(AnnotatorType.Param, []);
            map.set(AnnotatorType.Global, []);
            map.set(AnnotatorType.Upvalue, []);
            list.forEach(data => {
                let uri = vscode.Uri.parse(data.uri);
                vscode.window.visibleTextEditors.forEach((editor) => {
                    let docUri = editor.document.uri;
                    if (uri.path.toLowerCase() === docUri.path.toLowerCase()) {
                        var list = map.get(data.type);
                        if (list === undefined) {
                            list = data.ranges;
                        } else {
                            list = list.concat(data.ranges);
                        }
                        map.set(data.type, list);
                    }
                });
            });
            map.forEach((v, k) => {
                EMMgr.updateAnnotators(editor, k, v);
            });
        });
    }

    private static updateAnnotators(editor: vscode.TextEditor, type: AnnotatorType, ranges: vscode.Range[]) {
        switch (type) {
            case AnnotatorType.Param:
                editor.setDecorations(EMMgr.decorateParamter, ranges);
                break;
            case AnnotatorType.Global:
                editor.setDecorations(EMMgr.decorateGlobal, ranges);
                break;
            case AnnotatorType.DocType:
                editor.setDecorations(EMMgr.decorateAnnotation, ranges);
                break;
            case AnnotatorType.Upvalue:
                editor.setDecorations(EMMgr.decorateUpvalue, ranges);
                break;
        }
    }
}