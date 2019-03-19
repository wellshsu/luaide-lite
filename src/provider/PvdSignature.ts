'use strict';
import { LParse } from '../parser/LParse'
import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT, LSymbol } from '../parser/LEntity'
import { languages, window, commands, SignatureHelpProvider, SignatureHelp, SignatureInformation, ParameterInformation, TextDocument, Position, Range, CancellationToken } from 'vscode'
import { LFile } from "./LFile"
import { LCItem } from './LCItem'
import { Helper } from '../context/Helper'
export class PvdSignature implements SignatureHelpProvider {

	public provideSignatureHelp(document: TextDocument, position: Position, token: CancellationToken): Promise<SignatureHelp> {
		let result: SignatureHelp = this.walkBackwardsToBeginningOfCall(document, position);
		return Promise.resolve(result)
	}

	private createSignatureInformation(symbol: LSymbol, cIdex: number, funName: string) {
		let result = new SignatureHelp();
		//拼接方法名字
		let si = new SignatureInformation(funName, symbol.containerName);
		si.parameters = []
		var pstr = "("
		symbol.args.forEach(arg => {
			si.parameters.push(new ParameterInformation(arg.label, arg.documentation))
			pstr += arg.label + ",";
		})
		if (pstr != "(") {
			pstr = pstr.substr(0, pstr.length - 1);
		}

		pstr += ")"
		si.label = si.label + pstr
		// console.log("si.label:" + si.label)
		result.signatures = [si];
		result.activeSignature = 0;
		result.activeParameter = cIdex
		return result
	}

	private walkBackwardsToBeginningOfCall(document: TextDocument, position: Position): SignatureHelp {
		var lp: LParse = LParse.ins;
		var tokens: Array<LToken> = Helper.GetTokens(document, position)
		var index: number = tokens.length - 1;
		var count: number = 0;
		var cIdex: number = 0;
		let signature: SignatureHelp = null;
		while (true) {

			if (index < 0) {
				break;
			}

			var token: LToken = tokens[index]
			if (lp.Compare(')', token, LTT.Punctuator)) {
				count++;
			} else if (lp.Compare('(', token, LTT.Punctuator)) {
				count--;
				if (count < 0) {
					index--;
					break;
				}
			}
			else if (lp.Compare('end', token, LTT.Keyword)) {
				count++;
				index--;
				while (true) {

					var ktoken: LToken = tokens[index]
					if (lp.Compare('then', ktoken, LTT.Keyword) ||
						lp.Compare('do', ktoken, LTT.Keyword)

					) {
						break;
					}
					index--;
					if (index < 0) break;
				}
				continue;
			}
			else if (lp.Compare(',', token, LTT.Punctuator)) {
				if (count == 0) {
					cIdex++;
				}
			}
			index--;
		}


		if (index >= 0) {
			var keys: Array<string> = new Array<string>();
			while (true) {

				var token: LToken = tokens[index];
				if (token.type == LTT.Identifier) {
					keys.push(token.value)
					index--;
					if (index < 0) {
						break;
					}
					var ptoken: LToken = tokens[index];
					if (
						lp.Compare(':', ptoken, LTT.Punctuator) ||
						lp.Compare('.', ptoken, LTT.Punctuator)
					) {
						index--;
						keys.push(ptoken.value)
					}
					else if (lp.Compare('function', ptoken, LTT.Keyword)) {
						keys = new Array<string>();
						break;
					}
					else {
						break;
					}
				} else {
					break;
				}
			}
			if (keys.length == 1) {
				//检查是不是内部方法
				var file: LFile = lp.fileMgr.getFileByPath(document.uri.path)
				var curFunFile: LSymbol = null
				for (var kindex = 0; kindex < file.symbols.length; kindex++) {
					var element = file.symbols[kindex];
					//找到当前所在方法
					if (element.location.range.start.line <= position.line &&
						element.location.range.end.line >= position.line) {
						curFunFile = element
					}
				}
				if (curFunFile != null) {
					for (var index = 0; index < file.symbols.length; index++) {
						var element = file.symbols[index];
						if (element.name.indexOf(curFunFile.name + "->" + keys[0]) > -1) {
							signature = this.createSignatureInformation(element, cIdex, keys[0])
							break
						}
					}
				}
			}
			if (signature != null) {
				return signature
			}
			var key: string = keys[keys.length - 1]
			if (key == "self") {
				var data = Helper.GetSelfToModuleName(tokens, lp)
				if (data == null) {
					return
				} else {
					var moduleName = data.moduleName
					keys[keys.length - 1] = moduleName
					key = moduleName;
				}
			}
			var funName: string = ""
			for (var kindex = keys.length - 1; kindex >= 0; kindex--) {

				funName += keys[kindex]
			}
			lp.fileMgr.files.forEach((v, k) => {
				for (var index = 0; index < v.symbols.length; index++) {
					var element = v.symbols[index];
					if (element.name == funName) {
						signature = this.createSignatureInformation(element, cIdex, element.name)
						return
					}

				}
			})
		}
		return signature
	}
}
