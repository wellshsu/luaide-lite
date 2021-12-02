import * as vscode from "vscode"
import { LanguageClient, LanguageClientOptions, ServerOptions } from "vscode-languageclient"
import { ExtMgr } from "./ExtMgr"
import { LanguageConfiguration } from "vscode"
import * as path from "path"
import * as fs from "fs"

export interface AnnotatorParams {
    uri: string
}

export enum AnnotatorType {
    Param,
    Global,
    DocType,
    Upvalue,
}

export interface IAnnotator {
    uri: string
    ranges: vscode.Range[]
    type: AnnotatorType
}

export interface IProgressReport {
    text: string
    percent: number
}

export class LuaLanguageConfiguration implements LanguageConfiguration {
    public onEnterRules = [
        {
            action: { indentAction: vscode.IndentAction.None, appendText: "---" },
            beforeText: /^---/,
        }
    ]
}

export class EmmyMgr {
    private static savedContext: vscode.ExtensionContext
    private static client: LanguageClient
    private static activeEditor: vscode.TextEditor
    private static javaExecutablePath: string | null
    private static timeoutToReqAnn: NodeJS.Timer
    private static decorateParamter: vscode.TextEditorDecorationType
    private static decorateGlobal: vscode.TextEditorDecorationType
    private static decorateAnnotation: vscode.TextEditorDecorationType
    private static decorateUpvalue: vscode.TextEditorDecorationType

    public static activate(context: vscode.ExtensionContext) {
        try {
            let snippetsPath = path.join(ExtMgr.extensionPath, "res/snippets.json")
            let snippetsEmmyPath = path.join(ExtMgr.extensionPath, "res/snippets-emmy.json")
            let fo = fs.readFileSync(snippetsPath).toString()
            let fn = fs.readFileSync(snippetsEmmyPath).toString()
            if (fo != fn) {
                vscode.window.showInformationMessage("Snippets.json has been changed, please reload window to take effect.")
                fs.writeFileSync(snippetsPath, fn)
            }
        } catch (err) { }

        EmmyMgr.savedContext = context
        EmmyMgr.javaExecutablePath = ExtMgr.getJavaExe()
        EmmyMgr.startClient()
        EmmyMgr.savedContext.subscriptions.push(vscode.workspace.onDidChangeConfiguration(EmmyMgr.onDidChangeConfiguration, null, EmmyMgr.savedContext.subscriptions))
        EmmyMgr.savedContext.subscriptions.push(vscode.workspace.onDidChangeTextDocument(EmmyMgr.onDidChangeTextDocument, null, EmmyMgr.savedContext.subscriptions))
        EmmyMgr.savedContext.subscriptions.push(vscode.window.onDidChangeActiveTextEditor(EmmyMgr.onDidChangeActiveTextEditor, null, EmmyMgr.savedContext.subscriptions))
        EmmyMgr.savedContext.subscriptions.push(vscode.commands.registerCommand("emmy.restartServer", EmmyMgr.restartServer))
        EmmyMgr.savedContext.subscriptions.push(vscode.commands.registerCommand("emmy.showReferences", EmmyMgr.showReferences))
        EmmyMgr.savedContext.subscriptions.push(vscode.languages.setLanguageConfiguration(ExtMgr.LANGUAGE_ID, new LuaLanguageConfiguration()))
    }

    public static deactivate() {
        EmmyMgr.stopServer()
    }

    private static onDidChangeTextDocument(event: vscode.TextDocumentChangeEvent) {
        if (EmmyMgr.activeEditor && EmmyMgr.activeEditor.document === event.document) {
            EmmyMgr.requestAnnotators(EmmyMgr.activeEditor, EmmyMgr.client)
        }
        try {
            // NOTICE[20211202]: 该补丁是否会严重影响性能（每逢'.'和' '字符就会触发检测），有待观察
            if (event.contentChanges.length == 1) {
                let change = event.contentChanges[0]
                if (change.text == " " || change.text.indexOf(".") >= 0) { // 优化注解补全逻辑---@...
                    let lstart = change.rangeOffset - 40 // 匹配行（回溯）
                    lstart = lstart < 0 ? 0 : lstart
                    let lend = change.rangeOffset - 1
                    let line = event.document.getText(new vscode.Range(event.document.positionAt(lstart), event.document.positionAt(lend)))
                    if (line.indexOf("---@") >= 0) { // 注解逻辑
                        if (change.text == " ") { // 弹出提示
                            vscode.commands.executeCommand("editor.action.triggerSuggest")
                        } else { // 回删多余的命名空间
                            let fstart = change.rangeOffset - 1
                            let fend = change.rangeOffset
                            let left = event.document.getText(new vscode.Range(event.document.positionAt(fstart), event.document.positionAt(fend)))
                            if (left == ".") { // 左侧首字符为.，则判断为有前缀，剔除之
                                let strs = line.split(" ")
                                if (strs.length > 1) {
                                    let prefix = strs[strs.length - 1]
                                    let rstart = change.rangeOffset - 1 - prefix.length
                                    let rend = rstart + change.text.length + prefix.length + 1
                                    let editor = vscode.window.activeTextEditor
                                    editor.edit((edit) => {
                                        edit.replace(new vscode.Range(event.document.positionAt(rstart), event.document.positionAt(rend)), change.text)
                                    })
                                }
                            }
                        }
                    }
                }
            }
        } catch (err) { }
    }

    private static onDidChangeActiveTextEditor(editor: vscode.TextEditor | undefined) {
        if (editor === undefined) {
            return
        }
        EmmyMgr.activeEditor = editor as vscode.TextEditor
        EmmyMgr.requestAnnotators(EmmyMgr.activeEditor, EmmyMgr.client)
    }

    private static onDidChangeConfiguration(event: vscode.ConfigurationChangeEvent) {
        let shouldRestart = false
        let newJavaExecutablePath = ExtMgr.getJavaExe()
        if (newJavaExecutablePath !== EmmyMgr.javaExecutablePath) {
            EmmyMgr.javaExecutablePath = newJavaExecutablePath
            shouldRestart = true
        }
        EmmyMgr.updateDecorations()
        if (shouldRestart) {
            EmmyMgr.restartServer()
        }
    }

    private static startClient() {
        let folders = vscode.workspace.workspaceFolders ? vscode.workspace.workspaceFolders.map(f => f.uri.toString()) : []
        if (ExtMgr.apiFolders && ExtMgr.apiFolders.length > 0) {
            for (let i = 0; i < ExtMgr.apiFolders.length; i++) {
                let folder = ExtMgr.apiFolders[i]
                folder = vscode.Uri.file(folder).toString()
                folders.push(folder)
            }
        }

        const clientOptions: LanguageClientOptions = {
            documentSelector: [{ scheme: "file", language: ExtMgr.LANGUAGE_ID }],
            synchronize: {
                configurationSection: "luaide-lite",
                fileEvents: [
                    vscode.workspace.createFileSystemWatcher("**/*.lua")
                ]
            },
            initializationOptions: {
                stdFolder: vscode.Uri.file(path.resolve(EmmyMgr.savedContext.extensionPath, "res/emmy/std")).toString(),
                apiFolders: [],
                workspaceFolders: folders,
                client: "vsc",
                exclude: ExtMgr.excludes
            }
        }

        let serverOptions: ServerOptions
        const cp = path.resolve(EmmyMgr.savedContext.extensionPath, "res/emmy/", "*")
        const exePath = EmmyMgr.javaExecutablePath || "java"
        if (ExtMgr.debugLanguageServer) {
            serverOptions = {
                command: exePath,
                args: ["-Xdebug", "-Xrunjdwp:transport=dt_socket,server=n,suspend=y,address=5005", "-cp", cp, "com.tang.vscode.MainKt"]
            }
        } else {
            serverOptions = {
                command: exePath,
                args: ["-cp", cp, "com.tang.vscode.MainKt"]
            }
        }
        EmmyMgr.client = new LanguageClient(ExtMgr.LANGUAGE_ID, ExtMgr.extensionName, serverOptions, clientOptions)
        EmmyMgr.client.onReady().then(() => {
            EmmyMgr.client.onNotification("emmy/progressReport", (d: IProgressReport) => {
                let barText = "Parsing(" + (d.percent * 100).toFixed(0) + "%): " + d.text
                ExtMgr.bar.text = barText
                if (d.percent >= 1) {
                    ExtMgr.onReady()
                }
            })
            EmmyMgr.onDidChangeActiveTextEditor(vscode.window.activeTextEditor)
        }).catch(reason => {
            vscode.window.showErrorMessage("Failed to start language server!\n" + reason, "Try again").then(item => {
                EmmyMgr.startClient()
            })
        })
        const disposable = EmmyMgr.client.start()
        EmmyMgr.savedContext.subscriptions.push(disposable)
    }

    private static restartServer() {
        if (!EmmyMgr.client) {
            EmmyMgr.startClient()
        } else {
            EmmyMgr.client.stop().then(() => {
                EmmyMgr.startClient()
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
        if (EmmyMgr.client) {
            EmmyMgr.client.stop()
        }
    }

    private static updateDecorations() {
        let config: vscode.DecorationRenderOptions = {}
        config.light = { color: ExtMgr.lightParameter }
        config.dark = { color: ExtMgr.darkParameter }
        EmmyMgr.decorateParamter = vscode.window.createTextEditorDecorationType(config)

        config = {}
        config.light = { color: ExtMgr.lightGlobal }
        config.dark = { color: ExtMgr.darkGlobal }
        EmmyMgr.decorateGlobal = vscode.window.createTextEditorDecorationType(config)

        config = {}
        config.light = { color: ExtMgr.lightAnnotation }
        config.dark = { color: ExtMgr.darkAnnotation }
        EmmyMgr.decorateAnnotation = vscode.window.createTextEditorDecorationType(config)

        config = {}
        config.textDecoration = "underline"
        EmmyMgr.decorateUpvalue = vscode.window.createTextEditorDecorationType(config)
    }

    private static requestAnnotators(editor: vscode.TextEditor, client: LanguageClient) {
        if (!ExtMgr.isFileExclude(editor.document.uri.fsPath)) {
            clearTimeout(EmmyMgr.timeoutToReqAnn)
            EmmyMgr.timeoutToReqAnn = setTimeout(() => {
                EmmyMgr.requestAnnotatorsImpl(editor, client)
            }, 300)
        }
    }

    private static requestAnnotatorsImpl(editor: vscode.TextEditor, client: LanguageClient) {
        if (!EmmyMgr.decorateParamter) {
            EmmyMgr.updateDecorations()
        }
        let params: AnnotatorParams = { uri: editor.document.uri.toString() }
        client.sendRequest<IAnnotator[]>("emmy/annotator", params).then(list => {
            let map: Map<AnnotatorType, vscode.Range[]> = new Map()
            map.set(AnnotatorType.DocType, [])
            map.set(AnnotatorType.Param, [])
            map.set(AnnotatorType.Global, [])
            map.set(AnnotatorType.Upvalue, [])
            list.forEach(data => {
                let uri = vscode.Uri.parse(data.uri)
                vscode.window.visibleTextEditors.forEach((editor) => {
                    let docUri = editor.document.uri
                    if (uri.path.toLowerCase() === docUri.path.toLowerCase()) {
                        let list = map.get(data.type)
                        if (list === undefined) {
                            list = data.ranges
                        } else {
                            list = list.concat(data.ranges)
                        }
                        map.set(data.type, list)
                    }
                })
            })
            map.forEach((v, k) => {
                EmmyMgr.updateAnnotators(editor, k, v)
            })
        })
    }

    private static updateAnnotators(editor: vscode.TextEditor, type: AnnotatorType, ranges: vscode.Range[]) {
        switch (type) {
            case AnnotatorType.Param:
                editor.setDecorations(EmmyMgr.decorateParamter, ranges)
                break
            case AnnotatorType.Global:
                editor.setDecorations(EmmyMgr.decorateGlobal, ranges)
                break
            case AnnotatorType.DocType:
                editor.setDecorations(EmmyMgr.decorateAnnotation, ranges)
                break
            case AnnotatorType.Upvalue:
                editor.setDecorations(EmmyMgr.decorateUpvalue, ranges)
                break
        }
    }
}