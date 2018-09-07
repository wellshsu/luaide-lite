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
import { LanguageClient, LanguageClientOptions, SettingMonitor, ServerOptions, TransportKind } from 'vscode-languageclient'
import { LParse } from './parser/LParse';
import { EXMgr } from "./context/EXMgr"
import { PvdComment } from "./provider/PvdComment"
import { LFileMgr } from './provider/LFileMgr'
import vscode = require('vscode')
import { Helper } from './context/Helper';
import { ToTypescript } from "./formater/ToTypescript";
import { PTokenMgr } from "./provider/PToken";
var fs = require("fs")
var path = require("path")

let diagnosticCollection: vscode.DiagnosticCollection

export function activate(context: vscode.ExtensionContext) {
	if (vscode.workspace == null || vscode.workspace.rootPath == null) {
		vscode.window.showInformationMessage(EXMgr.extensionName + " does't support single lua file, please use 'Open Folder' instead.")
	} else {
		EXMgr.initialize(context)
		// PTokenMgr.Initialize()
		diagnosticCollection = vscode.languages.createDiagnosticCollection('lua')
		let luaParse = new LParse(diagnosticCollection)
		context.subscriptions.push(vscode.languages.registerCompletionItemProvider(EXMgr.LUA_MODE,
			new PvdCompletion(), '.', ":", '"', "[", "@", "-"))
		context.subscriptions.push(vscode.languages.registerDefinitionProvider(EXMgr.LUA_MODE,
			new PvdDefinition()))
		context.subscriptions.push(vscode.languages.registerDocumentSymbolProvider(EXMgr.LUA_MODE,
			new PvdSymbol()))
		context.subscriptions.push(vscode.languages.registerSignatureHelpProvider(EXMgr.LUA_MODE,
			new PvdSignature(), '(', ','))
		if (EXMgr.enableFormat) {
			context.subscriptions.push(vscode.languages.registerDocumentFormattingEditProvider(EXMgr.LUA_MODE,
				new PvdFormat()))
			context.subscriptions.push(vscode.languages.registerDocumentRangeFormattingEditProvider(EXMgr.LUA_MODE,
				new PvdFormat()))
		}
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
					if (event.document.languageId == "lua" && !EXMgr.isFileExclude(event.document.uri.fsPath)) {
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
				if (showSlogan) {
					setTimeout(function () {
						EXMgr.Bar.text = EXMgr.extensionName + " ✔"
					}, 7000)
					EXMgr.Bar.text = "Join QQ Group: 621598820"
				} else {
					EXMgr.Bar.text = EXMgr.extensionName + " ✔"
				}
				// PTokenMgr.Save()
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
						// let tokens = PTokenMgr.Get(uri.fsPath)
						// if (tokens != null) {
						// 	luaParse.Parse2(uri, tokens)
						// } else {
						// 	luaParse.Parse(uri, doc.getText())
						// 	PTokenMgr.Update(uri.fsPath, luaParse.tokens)
						// }
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
			if (config.associations[key] == "lua") {
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
				let count = value.length;
				value.forEach(element => {
					uris.push(element);
				});
				parseLuaFileCount();
			})
		vscode.workspace.onDidSaveTextDocument(event => {
			if (event.languageId == "lua") {
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
			// if (PvdComment.checkComment(event)) {
			// }
			if (event.contentChanges.length > 0) {
				var change = event.contentChanges[0]
				var content = change.text
				if (event.document.languageId == "typescript" && change.range.start != change.range.end) {
					// var isLua = content.indexOf("local") >= 0 || content.indexOf("nil") >= 0 || content.indexOf("elseif") >= 0 || content.indexOf("pairs") >= 0
					// content.indexOf("then") >= 0 || content.indexOf("not") >= 0 || content.indexOf("and") >= 0 || content.indexOf("~=") >= 0
					// if (isLua) {
					// 	setTimeout(() => {
					// 		var editor = vscode.window.activeTextEditor;
					// 		editor.edit(function (edit) {
					// 			var to = new ToTypescript(content)
					// 			content = to.formatContent
					// 			EXMgr.typescriptDefine.forEach((v, k) => {
					// 				content = content.replace(new RegExp(k, "gm"), v)
					// 			})
					// 			edit.replace(change.range, content);
					// 		});
					// 	}, 100)
					// }
				} else if (event.document.languageId == "lua") {
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
					if (event.document.languageId == "lua" && !EXMgr.isFileExclude(event.document.uri.fsPath)) {
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
					if (document.languageId == "lua" && !EXMgr.isFileExclude(document.uri.fsPath)) {
						luaParse.Parse(document.uri, document.getText(), true)
					}
				}
			}
		})
		vscode.workspace.onDidChangeConfiguration((listener) => {
			EXMgr.parseConfig()
		})
	}
}