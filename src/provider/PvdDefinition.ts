
import { RenameProvider, ProviderResult, WorkspaceEdit, TextDocument, Position, CancellationToken } from 'vscode';
import * as vscode from 'vscode'
import { LParse } from '../parser/LParse'
import { LFileMgr } from './LFileMgr'
import { LCItem } from "../provider/LCItem"
import { LFile } from "./LFile"
import { LFItem } from "./LFItem"
import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from '../parser/LEntity'
import { LGItem } from "../provider/LGItem"
import { Helper } from '../context/Helper'
import { Uri } from "vscode"
import { ExtMgr } from '../context/ExtMgr'

export class PvdDefinition implements vscode.DefinitionProvider {
    public provideDefinition(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken): Thenable<vscode.Location> {
        return new Promise<vscode.Location>((resolve, reject) => {
            return resolve(this.parse(document, position));
        });
    }

    private parse(document: vscode.TextDocument, position: vscode.Position): vscode.Location {
        var lineText = document.lineAt(position.line).text;
        if (lineText.trim().substring(0, 4) == "---@") {
            // 注解
            return this.findComment(lineText, position)
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
                        var loc: vscode.Location =
                            new vscode.Location(uri, new vscode.Position(0, 0))
                        return loc
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
                isFun = chat == 40;
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

        var loc = this.find(document, keyNames, tokens, isSelf, isFun)
        return loc
    }

    private find(document: vscode.TextDocument, keyNames: Array<string>, tokens: Array<LToken>, isSelf: boolean, isFun: boolean):
        vscode.Location {
        var loc
        var fileMgr = LParse.ins.fileMgr
        var functionNames: Array<string> = Helper.GetCurrentFunctionName(tokens)
        var isLocal = false
        var file = fileMgr.getFile(document.uri)
        var rootVar = keyNames[0]
        var lastVar = keyNames[keyNames.length - 1]
        var root: LCItem
        var dFile: LFile
        var isSingle = keyNames.length == 1
        // is local var in file
        try {
            file.locals.items.forEach((temp) => {
                if (temp.label == rootVar) {
                    if (temp.refField) {
                        temp.refField.forEach(keys => {
                            if (keys && keys.length > 0) {
                                rootVar = keys[0]
                                if (isSingle) {
                                    root = temp
                                }
                                throw null
                            }
                        });
                    }
                }
            })
        } catch { }
        if (root) {
            loc = new vscode.Location(root.uri, root.position)
        } else {
            if (functionNames != null && functionNames.length > 0) {
                var rootFuncName = functionNames[0]
                var rootFunc = file.funcFields.get(rootFuncName)
                if (rootFunc == null) {
                    rootFunc = file.funcFields.get(Helper.GetFunctionName(tokens, 0))
                }
                var symbol = file.getSymbol(rootFuncName)
                if (symbol == null) {
                    symbol = file.getSymbol(Helper.GetFunctionName(tokens, 0))
                }
                if (rootFunc) {
                    if (isSingle) {
                        if (symbol) {
                            try {
                                symbol.args.forEach((arg) => {
                                    if (arg.label == rootVar) {
                                        root = arg
                                        root.uri = document.uri
                                        throw null
                                    }
                                })
                            } catch  { }
                        }
                        if (root == null) {
                            root = rootFunc.getItemByKey(rootVar)
                        }
                    } else {
                        if (symbol) {
                            var checkAssign = function () {
                                var tempName
                                for (var j = 0; j < file.tokens.length; j++) {
                                    var token = file.tokens[j]
                                    var useful = false
                                    if (token.line >= symbol.range.start.line) {
                                        useful = true
                                    }
                                    if (useful && token.value == rootVar) {
                                        if (token.next && token.next.value == "=" &&
                                            token.next.next && token.next.next.type == LTT.Identifier) {
                                            var tempRoot = rootFunc.getItemByKey(rootVar)
                                            if (tempRoot && tempRoot.refClazz) {
                                                rootVar = tempRoot.refClazz
                                                tempName = null
                                                break
                                            }
                                            // else if (tempRoot && tempRoot.refField) {
                                            //     try {
                                            //         tempRoot.refField.forEach(keys => {
                                            //             if (keys && keys.length > 0) {
                                            //                 tempName = keys[0]
                                            //                 throw null
                                            //             }
                                            //         });
                                            //     } catch{ }
                                            // } else if (tempRoot && tempRoot.refFunc) {
                                            //     try {
                                            //         tempRoot.refFunc.forEach(keys => {
                                            //             if (keys && keys.length > 0) {
                                            //                 rootVar = keys[0]
                                            //                 throw null
                                            //             }
                                            //         });
                                            //     } catch{ }
                                            //     tempName = null
                                            //     break
                                            // }
                                            else {
                                                tempName = token.next.next.value
                                            }
                                        }
                                    }
                                    if (token.line > symbol.range.end.line) {
                                        break
                                    }
                                }
                                if (tempName) {
                                    rootVar = tempName
                                    tempName = null
                                    checkAssign()
                                }
                            }
                            checkAssign()
                        }
                    }
                }
            }
        }
        if (root) {
            loc = new vscode.Location(root.uri, root.position)
        } else {
            dFile = fileMgr.getFileByDefine(rootVar)
            if (dFile) {
                if (isSingle) {
                    root = dFile.fields.getItemByKey(rootVar)
                    if (root == null) {
                        root = dFile.funcs.getItemByKey(rootVar)
                    }
                } else {
                    root = dFile.funcs.getItemByKey(rootVar)
                    if (root) {
                        for (var i = 1; i < keyNames.length; i++) {
                            var key = keyNames[i]
                            if (root == null) { break }
                            root = root.getItemByKey(key)
                        }
                    }
                    if (root == null) {
                        root = dFile.fields.getItemByKey(rootVar)
                        if (root) {
                            for (var i = 1; i < keyNames.length; i++) {
                                var key = keyNames[i]
                                if (root == null) { break }
                                root = root.getItemByKey(key)
                            }
                        }
                    }
                }
                if (root) {
                    loc = new vscode.Location(root.uri, root.position)
                }
            }
        }
        return loc
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

    private findComment(line: string, position: vscode.Position): vscode.Location {
        var str = line.trim()
        var strs = str.split("---@")
        if (strs.length > 1) {
            strs = strs[1].split(" ")
            if (strs.length > 1) {
                var names = []
                for (var i = 1; i < strs.length; i++) {
                    var temp = strs[i]
                    if (temp != ":" && temp != "") {
                        names.push(temp)
                    }
                }
                if (names.length > 0) {
                    var moduleName = names[0]
                    if (moduleName) {
                        var fileMgr = LParse.ins.fileMgr
                        var dfile = fileMgr.getFileByDefine(moduleName)
                        if (dfile) {
                            var item = dfile.fields.getItemByKey(moduleName)
                            if (item) {
                                return new vscode.Location(item.uri, item.position)
                            }
                        }
                    }
                }
            }
        }
        return null
    }

}