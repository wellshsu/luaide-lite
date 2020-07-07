import vscode = require('vscode')
import { LParse } from '../parser/LParse'
import { ExtMgr } from './ExtMgr'
import { PvdCompletion } from '../provider/PvdCompletion'
import { PvdDefinition } from '../provider/PvdDefinition'
import { PvdSymbol } from '../provider/PvdSymbol'
import { PvdSignature } from '../provider/PvdSignature'
import { PvdReference } from '../provider/PvdReference'
import { PvdRefactor } from '../provider/PvdRefactor'
import { LFItem } from '../provider/LFItem'
import * as path from "path"
import * as fs from "fs"

export class LegacyMgr {

    private static diagnosticCollection: vscode.DiagnosticCollection

    public static activate(context: vscode.ExtensionContext) {
        try {
            let snippetsPath = path.join(ExtMgr.extensionPath, "res/snippets.json")
            let snippetsLegacyPath = path.join(ExtMgr.extensionPath, "res/snippets-legacy.json")
            let fo = fs.readFileSync(snippetsPath).toString()
            let fn = fs.readFileSync(snippetsLegacyPath).toString()
            if (fo != fn) {
                vscode.window.showInformationMessage("Snippets.json has been changed, please reload window to take effect.")
                fs.writeFileSync(snippetsPath, fn)
            }
        } catch (err) { }

        LegacyMgr.diagnosticCollection = vscode.languages.createDiagnosticCollection(ExtMgr.LANGUAGE_ID)

        let luaParse = new LParse(LegacyMgr.diagnosticCollection)
        context.subscriptions.push(vscode.languages.registerCompletionItemProvider(ExtMgr.LUA_MODE,
            new PvdCompletion(), '.', ":", '"', "[", "@", "-"))
        context.subscriptions.push(vscode.languages.registerDefinitionProvider(ExtMgr.LUA_MODE,
            new PvdDefinition()))
        context.subscriptions.push(vscode.languages.registerDocumentSymbolProvider(ExtMgr.LUA_MODE,
            new PvdSymbol()))
        context.subscriptions.push(vscode.languages.registerSignatureHelpProvider(ExtMgr.LUA_MODE,
            new PvdSignature(), '(', ','))
        context.subscriptions.push(vscode.languages.registerReferenceProvider(ExtMgr.LUA_MODE,
            new PvdReference))
        context.subscriptions.push(vscode.languages.registerRenameProvider(ExtMgr.LUA_MODE,
            new PvdRefactor))
        context.subscriptions.push(LegacyMgr.diagnosticCollection)
        var uris: Array<vscode.Uri> = new Array<vscode.Uri>()
        var index: number = 0
        const parseLuaFile = function () {
            if (index >= uris.length) {
                var event = vscode.window.activeTextEditor
                if (event && ExtMgr.changeTextCheck) {
                    if (event.document.languageId == ExtMgr.LANGUAGE_ID && !ExtMgr.isFileExclude(event.document.uri.fsPath)) {
                        luaParse.Parse(event.document.uri, event.document.getText(), true)
                    }
                }
                ExtMgr.onReady()
                return
            }
            var uri: vscode.Uri = uris[index]
            var fileInfo = fs.statSync(uri.fsPath)
            var size = fileInfo.size / 1024
            if (size > ExtMgr.maxFileSize) {
                index++
                parseLuaFile()
                return
            }
            if (!ExtMgr.isFileExclude(uri.fsPath)) {
                vscode.workspace.openTextDocument(uri).then(
                    doc => {
                        var barText = "Parsing(" + (index + 1) + "/" + uris.length + "): " + uri.fsPath
                        ExtMgr.bar.text = barText
                        LFItem.instance().addCompletion(uri, false)
                        luaParse.Parse(uri, doc.getText())
                        index++
                        parseLuaFile()
                    }
                ).then(function (event) {
                }, function (reason) {
                    index++
                    parseLuaFile()
                })
            } else {
                index++
                parseLuaFile()
            }
        }
        var count = 0
        var maxCount = 1
        function parseLuaFileCount() {
            count++
            if (maxCount == count) {
                parseLuaFile()
            }
        }
        var config = vscode.workspace.getConfiguration("files")
        for (var key in config.associations) {
            if (config.associations[key] == ExtMgr.LANGUAGE_ID) {
                maxCount++
                var keys = key.split(".")
                if (keys.length >= 1) {
                    LFItem.instance().fileExtnames.push("." + keys[keys.length - 1])
                }
                vscode.workspace.findFiles("**/" + key, "", 10000).then(
                    value => {
                        if (value == null) return
                        value.forEach(element => {
                            uris.push(element)
                        })
                        parseLuaFileCount()
                    })
            }
        }
        vscode.workspace.findFiles("**/*.lua", "", 10000).then(
            value => {
                if (value == null) return
                value.forEach(element => {
                    uris.push(element)
                })
                parseLuaFileCount()
            })
        vscode.workspace.onDidSaveTextDocument(event => {
            if (event.languageId == ExtMgr.LANGUAGE_ID) {
                var fileInfo = fs.statSync(event.uri.fsPath)
                var size = fileInfo.size / 1024
                if (size > ExtMgr.maxFileSize) {
                    return
                }
                if (ExtMgr.isFileExclude(event.uri.fsPath)) {
                    return
                }
                LFItem.instance().addCompletion(event.uri, false)
                luaParse.Parse(event.uri, event.getText())
            }
        })
        vscode.workspace.onDidChangeTextDocument(event => {
            var fileInfo = fs.statSync(event.document.uri.fsPath)
            var size = fileInfo.size / 1024
            if (size > ExtMgr.maxFileSize) {
                return
            }
            if (event.contentChanges.length > 0) {
                var change = event.contentChanges[0]
                var content = change.text
                if (event.document.languageId == "typescript" && change.range.start != change.range.end) {
                } else if (event.document.languageId == ExtMgr.LANGUAGE_ID) {
                    content.trim()
                    var triggerParse = content.indexOf('\n') == 0 || content.endsWith(')') ||
                        content.endsWith('}') || content.endsWith('') ||
                        content.endsWith("then") || content.endsWith("and") ||
                        content.endsWith("or") || content.endsWith("not") ||
                        content.endsWith("end") || ExtMgr.isFocused == false
                    if (triggerParse) {
                        triggerParse = content.length < event.document.getText().length
                    }
                    if (triggerParse) {
                        if (ExtMgr.changeTextCheck) {
                            if (!ExtMgr.isFileExclude(event.document.uri.fsPath)) {
                                luaParse.Parse(event.document.uri, event.document.getText(), true)
                            }
                        }
                    }
                }
            }
        })
        vscode.window.onDidChangeActiveTextEditor(event => {
            if (event) {
                if (ExtMgr.changeTextCheck) {
                    if (event.document.languageId == ExtMgr.LANGUAGE_ID && !ExtMgr.isFileExclude(event.document.uri.fsPath)) {
                        luaParse.Parse(event.document.uri, event.document.getText(), true)
                    }
                }
            }
        }, null, context.subscriptions)
        vscode.window.onDidChangeWindowState((event) => {
            ExtMgr.isFocused = event.focused
            if (ExtMgr.isFocused == true) {
                if (ExtMgr.changeTextCheck && vscode.window.activeTextEditor && vscode.window.activeTextEditor.document) {
                    var document = vscode.window.activeTextEditor.document
                    if (document.languageId == ExtMgr.LANGUAGE_ID && !ExtMgr.isFileExclude(document.uri.fsPath)) {
                        luaParse.Parse(document.uri, document.getText(), true)
                    }
                }
            }
        })
    }

    public static deactivate() { }
}