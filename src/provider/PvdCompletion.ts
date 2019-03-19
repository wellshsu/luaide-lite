
'use strict'

import vscode = require('vscode')
import { LParse } from '../parser/LParse'
import { LParseHelper } from '../parser/LParseHelper'
import { LCItem } from "../provider/LCItem"
import { LToken, LTT } from '../parser/LEntity'
import { Helper } from '../context/Helper'
import { PvdHelper } from '../provider/PvdHelper'
import { LFItem } from "./LFItem"
import { LuaCompletionItemControler } from "./LComplete"
import { LAItem } from "./LAItem"
import { CompletionItem, CompletionItemKind } from "vscode"
import { LICache } from "./LICache"

export class PvdCompletion implements vscode.CompletionItemProvider {

    public provideCompletionItems(document: vscode.TextDocument, position: vscode.Position,
        token: vscode.CancellationToken): Thenable<vscode.CompletionItem[]> {
        return this.parse(document, position, token);
    }

    public parse(document: vscode.TextDocument, position: vscode.Position, token: vscode.CancellationToken): Thenable<vscode.CompletionItem[]> {
        return new Promise<vscode.CompletionItem[]>((resolve, reject) => {
            let lineText = document.lineAt(position.line).text;
            var requireRuggestions: Array<LCItem> = new Array<LCItem>();
            var suggestions: Array<vscode.CompletionItem> = new Array<vscode.CompletionItem>();
            let lineTillCurrentPosition = lineText.substr(0, position.character);
            var triggerChar = lineText.substr(lineText.length - 1, 1)
            if (triggerChar == "@" || triggerChar == "-") {
                var returnValueCompletions: Array<vscode.CompletionItem> = this.checkCommenLuaCompletion(lineTillCurrentPosition, document, position)
                if (returnValueCompletions) {
                    return resolve(returnValueCompletions)
                }
            } else if (triggerChar == " ") {
                returnValueCompletions = this.checkFunReturnModule(lineTillCurrentPosition)
                if (returnValueCompletions) {
                    return resolve(returnValueCompletions)
                }
            }
            else {
                var infos = this.getCurrentStrInfo(document, position)
                var tokens: Array<LToken> = null
                if (infos != null && infos.length >= 2) {
                    tokens = infos[1]
                }
                if (tokens == null) return resolve([])
                if (lineTillCurrentPosition.indexOf("require") > -1) {
                    var rstr = lineTillCurrentPosition.trim();
                    var lastToken: LToken = tokens[tokens.length - 1]
                    if (tokens == null) {
                        tokens = PvdHelper.getTokens(document, position)
                    }
                    if (tokens.length >= 2) {
                        if (lastToken.value == "" || lastToken.value == '"') {
                            var rtoken: LToken = tokens[tokens.length - 2]
                            if (rtoken.type == LTT.Identifier &&
                                (rtoken.value == "require")
                            ) {
                                requireRuggestions = LFItem.instance().completions;
                            } else {
                                if (tokens.length >= 3) {
                                    var rtoken: LToken = tokens[tokens.length - 3]
                                    if (rtoken.type == LTT.Identifier &&
                                        (rtoken.value == "require")
                                    ) {
                                        requireRuggestions = LFItem.instance().completions;
                                    }
                                }
                            }
                        }
                    }
                }
                if (infos == null) return resolve(requireRuggestions);
                var functionNames: Array<string> = Helper.GetCurrentFunctionName(tokens)
                //进行推断处理
                var keys: Array<string> = infos[0]
                if (keys.length == 0) return resolve(requireRuggestions)
                var citems: Array<LCItem> = new Array<LCItem>();
                //  var keys = keys.reverse()
                LuaCompletionItemControler.instance().getCompletionsByKeysAndFuncNames(document.uri, keys, functionNames, citems, true)
                var currentItems = this.getCurrentFileItems(document.uri, keys)
                var funItems: Array<CompletionItem> = new Array<CompletionItem>();
                //清理一下 只保存一份 如果有方法优先方法
                var onlyItems: Map<string, CompletionItem> = new Map<string, CompletionItem>();
                currentItems.forEach(v => {
                    citems.push(v)
                })
                citems.forEach(v => {
                    if (onlyItems.has(v.label)) {
                        var oldItem = onlyItems.get(v.label)
                        if (v.kind == vscode.CompletionItemKind.Function && oldItem.kind != vscode.CompletionItemKind.Function) {
                            var newFun = LICache.getIns().getItem(v)
                            funItems.push(newFun)
                            onlyItems.set(v.label, newFun)

                        }
                    } else {
                        if (v.kind == vscode.CompletionItemKind.Function) {
                            var newFun = LICache.getIns().getItem(v)
                            funItems.push(newFun)
                            onlyItems.set(v.label, newFun)
                        } else {
                            onlyItems.set(v.label, v)
                        }
                    }
                })
                var argsItems: Array<LCItem>;
                if (infos[0].length == 1) {
                    argsItems = LParse.ins.fileMgr.getFuncArgs(infos[1], document.uri)
                }
                if (argsItems) {
                    argsItems.forEach(v => {
                        if (!onlyItems.has(v.label)) {
                            onlyItems.set(v.label, v)
                        }
                    });
                }
                onlyItems.forEach((v1, k) => {
                    suggestions.push(v1)
                })
                LICache.getIns().pushItems(funItems)
                funItems = null;
                return resolve(suggestions);
            }
        })
    }

    private checkFunReturnModule(line: string): Array<LCItem> {
        var line = line.trim()
        var commenstrs = ["---@type", "---@base", "---@return"]
        var commenstr = null;
        for (var index = 0; index < commenstrs.length; index++) {
            var cstr = commenstrs[index];
            var rindex = line.indexOf(cstr)
            if (rindex == 0) {
                return LFItem.instance().completions
            }
        }
        return null
    }

    public checkCommenLuaCompletion(line: string, document: vscode.TextDocument, position: vscode.Position): Array<vscode.CompletionItem> {
        var line = line.trim()
        if (line == "---@") {
            let lineText = document.lineAt(position.line).text;
            if (document.lineCount > position.line + 2) {
                var start: vscode.Position = new vscode.Position(position.line + 1, 0)
                var end: vscode.Position = new vscode.Position(document.lineCount, 200)
                var lp: LParse = LParse.ins;
                var lpt: LParseHelper = LParse.ins.lpt;
                var tokens: Array<LToken> = new Array<LToken>();
                lpt.reset(document.getText(new vscode.Range(start, end)))
                var isFun = false
                var isArgs = false
                var index = 0;
                while (true) {
                    var token: LToken = lpt.next();
                    if (token.error != null) {
                        break
                    }
                    if (token.type == LTT.EOF) {
                        break;
                    }
                    if (index == 0) {
                        if (token.value == "local" && token.type == LTT.Keyword) {
                            token = lpt.next();
                        }
                        if (token.value == "function" && token.type == LTT.Keyword) {
                            isFun = true;

                        } else {
                            isFun = false
                            break
                        }
                    }
                    if (token.value == "(" && token.type == LTT.Punctuator) {
                        isArgs = true
                        break
                    }
                    index++;
                }
            }
            var args: Array<string> = new Array<string>();
            if (isFun && isArgs) {
                while (true) {
                    var token: LToken = lpt.next();
                    if (token.error != null) {
                        break
                    }
                    if (token.value == ")" && token.type == LTT.Punctuator) {
                        break
                    }
                    if (token.type == LTT.Identifier) {
                        args.push(token.value)
                        token = lpt.next();
                        if (token.error != null) {
                            break
                        }
                        if (token.type == LTT.Punctuator && token.value == ",") {

                        } else {
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
            var items: Array<CompletionItem> = new Array<CompletionItem>();
            if (args.length > 0) {
                args.forEach(arg => {
                    var item: CompletionItem = new CompletionItem(arg + " ", CompletionItemKind.Variable)
                    item.documentation = "参数:" + arg
                    items.push(item)
                })
            }
            if (items.length > 0) {
                LAItem.Ins().getItems(line).forEach(v => {
                    items.push(v)
                })
                return items
            } else {
                return LAItem.Ins().getItems(line)
            }
        }
        return null
    }

    public getCurrentStrInfo(
        document: vscode.TextDocument,
        position: vscode.Position): any {
        var lp: LParse = LParse.ins;
        var start: vscode.Position = new vscode.Position(0, 0)
        var lpt: LParseHelper = LParse.ins.lpt;
        var tokens: Array<LToken> = new Array<LToken>();
        lpt.reset(document.getText(new vscode.Range(start, position)))
        while (true) {

            var token: LToken = lpt.next();
            if (token.error != null) {
                return;
            }
            if (token.type == LTT.EOF) {
                break;
            }
            token.index = tokens.length;
            tokens.push(token);
        }
        var index: number = tokens.length - 1;
        var _GNumber: number = 0;
        var _MNumber: number = 0;

        var keys: Array<string> = new Array<string>();

        var key: string = "";
        while (true) {

            if (index < 0) break;
            var token: LToken = tokens[index]
            if (
                lp.Compare('.', token, LTT.Punctuator) ||
                lp.Compare(':', token, LTT.Punctuator)
            ) {
                keys.push(token.value);
                key = "";
                index--;
                continue;
            }
            if (token.type == LTT.Identifier) {

                keys.push(token.value + key);
                key = "";
                index--;
            }

            if (index < 0) break
            var nextToken: LToken = tokens[index]
            if (lp.Compare(';', nextToken, LTT.Punctuator)) {
                break
            } else if (
                lp.Compare('.', nextToken, LTT.Punctuator) ||
                lp.Compare(':', nextToken, LTT.Punctuator)
            ) {
                keys.push(nextToken.value);
                key = "";
                index--;
                continue;
            }
            else if (lp.Compare(')', nextToken, LTT.Punctuator)) {
                if (token.type == LTT.Identifier) break;
                var m_number = 1;
                var beginIndex = index - 1;
                while (true) {

                    index--;
                    if (lp.Compare('(', tokens[index], LTT.Punctuator)) {
                        m_number--;
                        if (m_number == 0) {
                            var leng: number = beginIndex - index;
                            index--;
                            key = "()";
                            break;
                        }

                    } else if (lp.Compare(')', tokens[index], LTT.Punctuator)) {
                        g_number++;
                    }
                }

                continue;
            }
            else if (lp.Compare(']', nextToken, LTT.Punctuator)) {
                if (token.type == LTT.Identifier) break;
                var g_number = 1;
                var beginIndex = index - 1;
                while (true) {

                    index--;
                    if (lp.Compare('[', tokens[index], LTT.Punctuator)) {
                        g_number--;
                        if (g_number == 0) {
                            var leng: number = beginIndex - index;
                            index--;
                            key = "[]";
                            break;
                        }

                    } else if (lp.Compare(']', tokens[index], LTT.Punctuator)) {
                        g_number++;
                    }
                }

                continue;
            }
            else {
                break;
            }
        }
        var moduleName: string = "";
        if (keys.length >= 2) {
            if (keys[keys.length - 1] == "self" && (keys[keys.length - 2] == ':'
                || keys[keys.length - 2] == '.'
            )) {
                //检查 function
                //找出self 代表的 模块名
                //向上找 function
                var data = Helper.GetSelfToModuleName(tokens, lp)
                if (data) {
                    var moduleName: string = data.moduleName
                    keys[keys.length - 1] = moduleName

                }
            }
        }
        return [keys, tokens]
    }

    public findTokenByKey(keys: string, tokens: Array<LToken>) {
        var length = tokens.length
        var key = keys[1]
        for (var index = 0; index < tokens.length; index++) {
            var element = tokens[index];

            if (key == element.value && element.type == LTT.Identifier) {
                if (length - 1 >= index + 1) {
                    var nextToken: LToken = tokens[index + 1]
                    if (nextToken.value == "=" && LTT.Punctuator == nextToken.type) {
                        var isEqual = true
                        if (keys.length > 2) {
                            //向上找
                            for (var j = 2; j < keys.length; j++) {
                                if (index - 1 >= tokens.length) {
                                    isEqual = false
                                    break
                                }
                                if (tokens[index - 1].value != keys[j]) {
                                    isEqual = false
                                    break
                                }
                            }
                        } else {
                            isEqual = true
                        }
                        if (isEqual) {
                            // console.log()
                        }
                    }
                }

            }
        }
    }

    public getCurrentFileItems(uri: vscode.Uri, keys: Array<string>): Array<LCItem> {
        var file = LParse.ins.fileMgr.getFileByPath(uri.path)
        var items: Array<LCItem> = new Array<LCItem>();
        var citems: Array<LCItem> = new Array<LCItem>();
        if (file == null) {
            return citems
        }
        if (keys.length > 1) {
            file.funcFields.forEach((v, k) => {
                this.getCurrentFileItemByRoot(v, keys, 0, items);
            })
        }

        if (items.length > 0) {
            items.forEach(element => {
                var eitems = element.getItems()
                eitems.forEach((v, k) => {
                    citems.push(v)
                })
            });
        }
        return citems;
    }

    public getCurrentFileItemByRoot(root: LCItem, keys: Array<string>, index: number, items: Array<LCItem>) {
        root = root.getItemByKey(keys[index])
        if (root) {
            if (index == keys.length - 2) {
                items.push(root);
            }
            index += 2;
            if (index < keys.length - 1) {
                this.getCurrentFileItemByRoot(root, keys, index, items);
            }
        }
    }
}