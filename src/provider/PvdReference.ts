import vscode = require('vscode');
import cp = require('child_process');
import { LParse } from '../parser/LParse'
import { LFileMgr } from './LFileMgr'
import { LCItem } from "../provider/LCItem"
import { LFile } from "./LFile"
import { LFItem } from "./LFItem"
import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from '../parser/LEntity'
import { Helper } from '../context/Helper'
import { LGItem } from './LGItem'
import { Uri } from "vscode"
import { ExtMgr } from '../context/ExtMgr'

export class PvdReference implements vscode.ReferenceProvider {

	public provideReferences(document: vscode.TextDocument, position: vscode.Position, options: { includeDeclaration: boolean }, token: vscode.CancellationToken): Thenable<vscode.Location[]> {
		return vscode.workspace.saveAll(false).then(() => {
			return this.parse(document, position, options);
		});
	}

	private parse(document: vscode.TextDocument, position: vscode.Position, options: { includeDeclaration: boolean }): Thenable<vscode.Location[]> {
		var lineText = document.lineAt(position.line).text;
		if (lineText.trim().substring(0, 4) == "---@") {
			// 注解
			return null;
		}
		var tempStr = lineText.substring(position.character)
		var endIndex = tempStr.indexOf('"')
		if (endIndex > -1) {
			var startStr = lineText.substring(0, position.character)
			var findex = startStr.lastIndexOf('"')
			if (findex > -1) {
				var moduleName = lineText.substring(findex + 1, endIndex + position.character)
				if (moduleName.length > 0) {
					var uri = LFItem.instance().getUriCompletionByModuleName(moduleName)
					if (uri) {
						// 路径
						return null;
					}
				}
			}
		}
		let offset = document.offsetAt(position);
		let text = document.getText();
		let byteOffset = 0;
		var isFun: boolean = false;
		var nameChats: Array<string> = new Array<string>();
		var luaManager: LFileMgr = LParse.ins.fileMgr;
		var lp: LParse = LParse.ins;
		var tokens: Array<LToken> = Helper.GetTokens(document, position)
		var isFun: boolean = false
		var i: number = 0;
		var lashToken: LToken = null
		if (tokens) {
			i = tokens.length - 1;
		}
		try {
			while (i >= 0) {
				var token: LToken = tokens[i];
				i--;
				if (lp.Compare('function', token, LTT.Keyword)) {
					return null;
				}
				if (token.type == LTT.Keyword || lp.Compare('(', token, LTT.Punctuator)
					|| lp.Compare(')', token, LTT.Punctuator)
				) {
					isFun = true
					break;
				} else if (
					lp.Compare('+', token, LTT.Punctuator)
					|| lp.Compare('-', token, LTT.Punctuator)
					|| lp.Compare('*', token, LTT.Punctuator)
					|| lp.Compare('/', token, LTT.Punctuator)
					|| lp.Compare('>', token, LTT.Punctuator)
					|| lp.Compare('<', token, LTT.Punctuator)
					|| lp.Compare('>=', token, LTT.Punctuator)
					|| lp.Compare('<=', token, LTT.Punctuator)
					|| lp.Compare('==', token, LTT.Punctuator)
					|| lp.Compare('~=', token, LTT.Punctuator)
					|| lp.Compare('=', token, LTT.Punctuator)
					|| lp.Compare('#', token, LTT.Punctuator)
					|| lp.Compare('}', token, LTT.Punctuator)
					|| lp.Compare('{', token, LTT.Punctuator)
					|| lp.Compare(']', token, LTT.Punctuator)
					|| lp.Compare('[', token, LTT.Punctuator)
					|| lp.Compare(',', token, LTT.Punctuator)
					|| lp.Compare(';', token, LTT.Punctuator)
					|| lp.Compare('else', token, LTT.Punctuator)
					|| lp.Compare('elseif', token, LTT.Punctuator)
					|| lp.Compare('do', token, LTT.Keyword)
				) {
					break;
				}
				nameChats.push(token.value);
				lashToken = token;
				if (i >= 0) {
					var nextToken: LToken = tokens[i];
					if (token.type == LTT.Identifier && (
						nextToken.type == LTT.Identifier ||
						nextToken.type == LTT.NumericLiteral ||
						nextToken.type == LTT.Keyword ||
						nextToken.type == LTT.StringLiteral ||
						nextToken.type == LTT.NilLiteral ||
						nextToken.type == LTT.BooleanLiteral)) {
						break;
					}
				}
			}
		} catch (err) {
			Helper.Log(err)
		}
		nameChats = nameChats.reverse()
		for (let i = offset; i < text.length; i++) {
			var chat = text.charCodeAt(i)
			if (Helper.IsIdentifierPart(chat)) {
				nameChats.push(text[i])
			}
			else if (text[i] == '=' ||
				text[i] == '==' ||
				text[i] == '~=' ||
				text[i] == ')' ||
				text[i] == ']' ||
				text[i] == '[' ||
				text[i] == '}' ||
				text[i] == '+' ||
				text[i] == '-' ||
				text[i] == '*' ||
				text[i] == '/' ||
				text[i] == '>' ||
				text[i] == '<' ||
				text[i] == '>=' ||
				text[i] == '<='
			) {
				break;
			}
			else {
				if (chat == 40) {
					isFun = true;
				}
				break;
			}
		}
		var n = ""
		nameChats.forEach(c => {
			n += c;
		});
		var keyNames: Array<string> = new Array<string>();
		var tempNames: Array<string> = n.split('.')
		for (var i = 0; i < tempNames.length; i++) {
			if (i == tempNames.length - 1) {
				var tempNames1 = tempNames[tempNames.length - 1].split(':')
				for (var j = 0; j < tempNames1.length; j++) {
					keyNames.push(tempNames1[j])
				}
			} else {
				keyNames.push(tempNames[i])
			}
		}
		var isSelf: boolean = false;
		if (keyNames[0] == 'self') {
			var data = Helper.GetSelfToModuleName(tokens, lp)
			keyNames[0] = data.moduleName
			isSelf = true
		}
		var locs = this.find(document, keyNames, tokens, isSelf)
		return new Promise((resolve, reject) => {
			return resolve(locs);
		});
	}

	private find(document: vscode.TextDocument, keyNames: Array<string>, tokens: Array<LToken>, isSelf: boolean):
		Array<vscode.Location> {
		var locs = new Array<vscode.Location>()
		var fileMgr = LParse.ins.fileMgr
		var functionNames: Array<string> = Helper.GetCurrentFunctionName(tokens)
		var isLocal = false
		if (functionNames != null && functionNames.length > 0) {
			var rootFuncName = functionNames[0]
			var file = fileMgr.getFile(document.uri)
			if (keyNames.length == 1) {
				var varName = keyNames[0]
				var fRoot = file.funcFields.get(rootFuncName)
				if (fRoot) {
					fRoot.items.forEach((item) => {
						if (item.label == varName) {
							isLocal = true
						}
					})
				}
				if (!isLocal) {
					var symbol = file.getSymbol(rootFuncName)
					if (symbol == null) {
						symbol = file.getSymbol(Helper.GetFunctionName(tokens, 0))
					}
					// args
					if (symbol && symbol.args) {
						symbol.args.forEach((arg) => {
							if (arg.label == varName) {
								isLocal = true
							}
						})
					}
				}
				if (isLocal) {
					var symbol = file.getSymbol(rootFuncName)
					if (symbol == null) {
						symbol = file.getSymbol(Helper.GetFunctionName(tokens, 0))
					}
					if (symbol) {
						for (var j = 0; j < file.tokens.length; j++) {
							var token = file.tokens[j]
							var useful = false
							if (token.line >= symbol.range.start.line) {
								useful = true
							}
							if (useful && token.value == varName && token.last && token.last.value != "." && token.last.value != ":") {
								var loc: vscode.Location =
									new vscode.Location(document.uri,
										new vscode.Range(document.positionAt(token.range.start), document.positionAt(token.range.end)))
								locs.push(loc)
							}
							if (token.line > symbol.range.end.line) {
								break
							}
						}
					}
				}
			}
		}
		if (!isLocal) {
			var files = fileMgr.files
			if (files && files.size > 0) {
				files.forEach((file) => {
					if (file) {
						vscode.workspace.openTextDocument(file.uri).then(fileDoc => {
							var newKV = keyNames
							if (isSelf && file.uri == vscode.window.activeTextEditor.document.uri) {
								newKV = new Array<string>()
								for (var i = 0; i < keyNames.length; i++) {
									newKV.push(keyNames[i])
								}
								newKV[0] = "self"
							}
							for (var i = 0; i < file.tokens.length; i++) {
								var token = file.tokens[i]
								if (token.type == LTT.Identifier) {
									var fToken = this.findToken(file.tokens, i, newKV, 0)
									if (fToken) {
										var loc: vscode.Location =
											new vscode.Location(fileDoc.uri,
												new vscode.Range(fileDoc.positionAt(fToken.range.start), fileDoc.positionAt(fToken.range.end)))
										locs.push(loc)
									}
								}
							}
						});
					}
				})
			} else {
				return null
			}
		}
		return locs
	}

	private findToken(tokens: Array<LToken>, tokenIdx: number, keys: Array<string>, keyIdx: number): LToken {
		var token = tokens[tokenIdx]
		var nextToken = tokens[tokenIdx + 1]
		if (token == null) return null
		if (token.value == keys[keyIdx]) {
			if (keyIdx == keys.length - 1) {
				return token
			} else if (nextToken) {
				if (nextToken.value == "." || nextToken.value == ":") {
					return this.findToken(tokens, tokenIdx + 2, keys, keyIdx + 1);
				} else {
					return null
				}
			}
		}
		else {
			return null
		}
	}

	private findItem(rootItem: LCItem, keys: Array<string>, index: number) {
		if (rootItem == null) return null
		rootItem = rootItem.getItemByKey(keys[index])
		if (index == keys.length - 1) {
			return rootItem
		} else {
			if (rootItem != null) {
				index++;
				rootItem = this.findItem(rootItem, keys, index)
				return rootItem
			} else {
				return null
			}
		}
	}

}