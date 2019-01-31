/* --------------------------------------------------------------------------------------------
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import { PvdCompletion } from "./provider/PvdCompletion"
import { PvdDefinition } from "./provider/PvdDefinition"
import { PvdSymbol } from "./provider/PvdSymbol"
import { PvdSignature } from "./provider/PvdSignature"
import { PvdReference } from "./provider/PvdReference"
import { PvdRefactor } from "./provider/PvdRefactor"
import { PvdFormat } from "./provider/PvdFormat"
import { LFItem } from "./provider/LFItem"
import { LParse } from './parser/LParse';
import { EXMgr } from "./context/EXMgr"
import vscode = require('vscode')
import { Helper } from './context/Helper';
import { EMMgr } from "./context/EMMgr";
const fs = require("fs")
const path = require("path")

let diagnosticCollection: vscode.DiagnosticCollection

export function activate(context: vscode.ExtensionContext) {
	if (vscode.workspace == null || vscode.workspace.rootPath == null) {
		vscode.window.showInformationMessage(EXMgr.extensionName + " does't support single lua file, please use 'Open Folder' instead.")
	} else {
		EXMgr.initialize(context)
		if (EXMgr.enableFormat) {
			context.subscriptions.push(vscode.languages.registerDocumentFormattingEditProvider(EXMgr.LUA_MODE,
				new PvdFormat()))
			context.subscriptions.push(vscode.languages.registerDocumentRangeFormattingEditProvider(EXMgr.LUA_MODE,
				new PvdFormat()))
		}
		if (EXMgr.isLegacy) {
			diagnosticCollection = vscode.languages.createDiagnosticCollection(EXMgr.LANGUAGE_ID)
			let luaParse = new LParse(diagnosticCollection)
			context.subscriptions.push(vscode.languages.registerCompletionItemProvider(EXMgr.LUA_MODE,
				new PvdCompletion(), '.', ":", '"', "[", "@", "-"))
			context.subscriptions.push(vscode.languages.registerDefinitionProvider(EXMgr.LUA_MODE,
				new PvdDefinition()))
			context.subscriptions.push(vscode.languages.registerDocumentSymbolProvider(EXMgr.LUA_MODE,
				new PvdSymbol()))
			context.subscriptions.push(vscode.languages.registerSignatureHelpProvider(EXMgr.LUA_MODE,
				new PvdSignature(), '(', ','))
			context.subscriptions.push(vscode.languages.registerReferenceProvider(EXMgr.LUA_MODE,
				new PvdReference))
			context.subscriptions.push(vscode.languages.registerRenameProvider(EXMgr.LUA_MODE,
				new PvdRefactor))
			context.subscriptions.push(diagnosticCollection)
			var uris: Array<vscode.Uri> = new Array<vscode.Uri>()
			var index: number = 0
			const parseLuaFile = function () {
				if (index >= uris.length) {
					var event = vscode.window.activeTextEditor
					if (event && EXMgr.changeTextCheck) {
						if (event.document.languageId == EXMgr.LANGUAGE_ID && !EXMgr.isFileExclude(event.document.uri.fsPath)) {
							luaParse.Parse(event.document.uri, event.document.getText(), true)
						}
					}
					var yesterdayFile = path.join(EXMgr.extensionPath, "res/yesterday")
					var showSlogan = false
					var todayStr = Helper.FormatDate(new Date(), "yyyy-MM-dd")
					if (fs.existsSync(yesterdayFile)) {
						var yesterdayStr = fs.readFileSync(yesterdayFile)
						if (yesterdayStr != todayStr) {
							showSlogan = true
							fs.writeFileSync(yesterdayFile, todayStr)
						}
						else {
							showSlogan = false
						}
					} else {
						showSlogan = true
						fs.writeFileSync(yesterdayFile, todayStr)
					}
					// if (showSlogan) {
					// 	setTimeout(function () {
					// 		EXMgr.Bar.text = EXMgr.extensionName + " ✔"
					// 	}, 7000)
					// 	EXMgr.Bar.text = "Join QQ Group: 621598820"
					// } else {
					// 	EXMgr.Bar.text = EXMgr.extensionName + " ✔"
					// }
					EXMgr.Bar.text = EXMgr.extensionName + " ✔"
					return
				}
				var uri: vscode.Uri = uris[index];
				var fileInfo = fs.statSync(uri.fsPath)
				var size = fileInfo.size / 1024
				if (size > EXMgr.maxFileSize) {
					index++
					parseLuaFile()
					return;
				}
				if (!EXMgr.isFileExclude(uri.fsPath)) {
					vscode.workspace.openTextDocument(uri).then(
						doc => {
							var barText = "Parsing(" + (index + 1) + "/" + uris.length + "): " + uri.fsPath
							EXMgr.Bar.text = barText
							LFItem.instance().addCompletion(uri, false)
							luaParse.Parse(uri, doc.getText())
							index++;
							parseLuaFile()
						}
					).then(function (event) {
					}, function (reason) {
						index++;
						parseLuaFile()
					})
				} else {
					index++;
					parseLuaFile()
				}
			}
			var count = 0
			var maxCount = 1
			function parseLuaFileCount() {
				count++;
				if (maxCount == count) {
					parseLuaFile();
				}
			}
			var config = vscode.workspace.getConfiguration("files")
			for (var key in config.associations) {
				console.log(key)
				console.log(config.associations[key])
				if (config.associations[key] == EXMgr.LANGUAGE_ID) {
					maxCount++;
					var keys = key.split(".")
					if (keys.length >= 1) {
						LFItem.instance().fileExtnames.push("." + keys[keys.length - 1])
					}
					vscode.workspace.findFiles("**/" + key, "", 10000).then(
						value => {
							if (value == null) return
							let count = value.length;
							value.forEach(element => {
								uris.push(element);
							});
							parseLuaFileCount()
						})
				}
			}
			vscode.workspace.findFiles("**/*.lua", "", 10000).then(
				value => {
					if (value == null) return
					value.forEach(element => {
						uris.push(element);
					});
					parseLuaFileCount();
				})
			vscode.workspace.onDidSaveTextDocument(event => {
				if (event.languageId == EXMgr.LANGUAGE_ID) {
					var fileInfo = fs.statSync(event.uri.fsPath)
					var size = fileInfo.size / 1024
					if (size > EXMgr.maxFileSize) {
						return
					}
					if (EXMgr.isFileExclude(event.uri.fsPath)) {
						return
					}
					LFItem.instance().addCompletion(event.uri, false)
					luaParse.Parse(event.uri, event.getText())
				}
			})
			vscode.workspace.onDidChangeTextDocument(event => {
				var fileInfo = fs.statSync(event.document.uri.fsPath)
				var size = fileInfo.size / 1024
				if (size > EXMgr.maxFileSize) {
					return;
				}
				if (event.contentChanges.length > 0) {
					var change = event.contentChanges[0]
					var content = change.text
					if (event.document.languageId == "typescript" && change.range.start != change.range.end) {
					} else if (event.document.languageId == EXMgr.LANGUAGE_ID) {
						content.trim()
						var triggerParse = content.indexOf('\n') == 0 || content.endsWith(')') ||
							content.endsWith('}') || content.endsWith(';') ||
							content.endsWith("then") || content.endsWith("and") ||
							content.endsWith("or") || content.endsWith("not") ||
							content.endsWith("end") || EXMgr.focused == false
						if (triggerParse) {
							triggerParse = content.length < event.document.getText().length
						}
						if (triggerParse) {
							if (EXMgr.changeTextCheck) {
								if (!EXMgr.isFileExclude(event.document.uri.fsPath)) {
									luaParse.Parse(event.document.uri, event.document.getText(), true)
								}
							}
						}
					}
				}
			})
			vscode.window.onDidChangeActiveTextEditor(event => {
				if (event) {
					if (EXMgr.changeTextCheck) {
						if (event.document.languageId == EXMgr.LANGUAGE_ID && !EXMgr.isFileExclude(event.document.uri.fsPath)) {
							luaParse.Parse(event.document.uri, event.document.getText(), true)
						}
					}
				}
			}, null, context.subscriptions)
			vscode.window.onDidChangeWindowState((event) => {
				EXMgr.focused = event.focused
				if (EXMgr.focused == true) {
					if (EXMgr.changeTextCheck && vscode.window.activeTextEditor && vscode.window.activeTextEditor.document) {
						var document = vscode.window.activeTextEditor.document
						if (document.languageId == EXMgr.LANGUAGE_ID && !EXMgr.isFileExclude(document.uri.fsPath)) {
							luaParse.Parse(document.uri, document.getText(), true)
						}
					}
				}
			})
		}
		else {
			EMMgr.activate(context)
		}
		vscode.workspace.onDidChangeConfiguration((listener) => {
			EXMgr.parseConfig()
		})
	}
}

export function deactivate() {
	if (!EXMgr.isLegacy) {
		EMMgr.deactivate()
	}
}