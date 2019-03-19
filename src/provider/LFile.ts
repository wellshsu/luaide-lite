
'use strict';
import vscode = require('vscode')
import { Uri, SymbolInformation, Position, Range, SymbolKind } from 'vscode'
import { LParse } from '../parser/LParse'
import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT, LSymbol } from '../parser/LEntity'
import { LCItem } from "../provider/LCItem"
import { LParseHelper } from '../parser/LParseHelper';
import { CompletionItem, CompletionItemKind } from "vscode"
import { Helper } from '../context/Helper'
import { ExtMgr } from "../context/ExtMgr"
import { HighlightG } from "../formater/HighlightG"

export class LFile {
    public uri: Uri
    public module: string = null
    public lp: LParse
    public hlG: HighlightG
    public symbols: Array<LSymbol> = null
    public tokens: Array<LToken> = null

    public rootFunc: LCItem = null
    public rootField: LCItem = null
    public funcs: LCItem = null
    public funcFields: Map<string, LCItem> = null
    public fields: LCItem = null
    public locals: LCItem = null

    public tempFunc: LCItem = null;
    public tempFuncNames: Array<string> = null
    public tempFuncParams: Array<Array<string>> = null
    public tempFuncSymbols: Array<string> = null

    public constructor(uri: Uri) {
        this.lp = LParse.ins;
        this.tempFuncNames = new Array<string>();
        this.tempFuncSymbols = new Array<string>();
        this.tempFuncParams = new Array<Array<string>>();
        this.uri = uri;
        this.funcs = new LCItem("", CompletionItemKind.Class, uri, null, false, null)
        this.fields = new LCItem("", CompletionItemKind.Class, uri, null, false, null)
        this.locals = new LCItem("", CompletionItemKind.Class, uri, null, false, null)
        this.symbols = new Array<LSymbol>();
        this.funcFields = new Map<string, LCItem>();
        this.hlG = new HighlightG(this)
    }

    public clear() {
        this.funcs.clearItems();
        this.fields.clearItems();
        this.locals.clearItems;
        this.tempFuncParams = null;
        this.symbols = null
        this.funcFields.clear()
        this.rootField = null
        this.rootFunc = null
        this.tempFunc = null
        this.tokens = null
    }

    //设置根 用于类型推断
    public setRootCompletionInfo(rootName: string) {
        this.rootField = this.locals.getItemByKey(rootName)
        if (this.rootField == null) {
            this.rootField = this.fields.getItemByKey(rootName)
        }
        this.rootFunc = this.funcs.getItemByKey(rootName)
    }

    /**
     * 添加方法开始 标记  
     * @param funName 方法名称
     */
    public setBeginFunName(funName: string, params: Array<string>) {
        var luaCompletion: LCItem = new LCItem("", CompletionItemKind.Function, this.lp.tempUri, null, false, null)
        this.tempFuncSymbols.push(funName)
        this.tempFuncParams.push(params)
        if (this.tempFunc) {
            funName = this.tempFunc.label + "->" + funName
            //记录父方法的根
            luaCompletion.funParentLuaCompletionInfo = this.tempFunc;
        }
        this.tempFuncNames.push(funName)
        luaCompletion.label = funName
        this.funcFields.set(funName, luaCompletion)
        luaCompletion.completionFunName = funName
        this.tempFunc = luaCompletion;
    }

    public setEndFun() {
        this.tempFuncSymbols.pop()
        this.tempFuncNames.pop()
        this.tempFuncParams.pop()
        if (this.tempFuncNames.length > 0) {
            var funName = this.tempFuncNames[this.tempFuncNames.length - 1]
            this.tempFunc = this.funcFields.get(funName)
        } else {
            this.tempFunc = null;
        }
    }

    public addFunctionCompletion(
        lp: LParse,
        luaInfo: LFrag,
        token: LToken,
        functionEndToken: LToken) {
        var symbol: LSymbol = this.addSymbol(lp, luaInfo, token, functionEndToken)
        var completion: LCItem = this.addCompletionItem(lp, luaInfo, token, this.tokens, true)
        completion.completionFunName = symbol.name
        var argsStr = ""
        var snippetStr = "";
        for (var index = 0; index < symbol.args.length; index++) {
            var v = symbol.args[index];
            argsStr += v.label + ","
            snippetStr += "${" + (index + 1) + ":" + v.label + "},";
        }
        if (argsStr != "") {
            argsStr = argsStr.substring(0, argsStr.length - 1);
            snippetStr = snippetStr.substring(0, snippetStr.length - 1);
            snippetStr = completion.label + "(" + snippetStr + ")";
            var snippetString: vscode.SnippetString = new vscode.SnippetString(snippetStr)
            completion.funvSnippetString = snippetString
        }
        var funLabelStr = completion.label + "(" + argsStr + ")";
        completion.funLable = funLabelStr
        this.checkFunAnnotationReturnValue(completion);
        this.checkFunReturnValue(completion, token.index, functionEndToken.index)
    }

    public checkValueReferenceValue(completion: LCItem) {
        if (completion.comments == null) { return }
        for (var index = 0; index < completion.comments.length; index++) {
            var element = completion.comments[index];
            var returnValue = "-@type"
            var num = element.content.indexOf(returnValue)
            if (num == 0) {
                var className = element.content.substring(returnValue.length).trim()
                completion.refClazz = className;
                break;
            }
        }
    }

    //检查父类引用
    public checkParentClassValue(completion: LCItem) {
        if (completion.comments == null) { return }
        for (var index = 0; index < completion.comments.length; index++) {
            var element = completion.comments[index];
            var returnValue = "-@base"
            var num = element.content.indexOf(returnValue)
            if (num == 0) {
                var className = element.content.substring(returnValue.length).trim()
                if (className[0] == "[") {
                    var endIndex = className.indexOf("]")
                    className = className.substring(1, endIndex)
                    className = className.trim();
                    completion.parentClazz = className
                }
            }
        }
    }

    //检查注释的返回值
    public checkFunAnnotationReturnValue(completion: LCItem) {
        if (completion.comments == null) return;
        for (var index = 0; index < completion.comments.length; index++) {
            var element = completion.comments[index];
            var returnValue = "-@return"
            var num = element.content.indexOf(returnValue)
            if (num == 0) {
                var className = element.content.substring(returnValue.length).trim()
                if (className[0] == "[") {
                    var endIndex = className.indexOf("]")
                    className = className.substring(1, endIndex)
                    className = className.trim();
                    completion.funAnnotationReturnValue = className
                }
            }
        }
    }

    //检查返回值
    public checkFunReturnValue(completion: LCItem, startIndex: number, endTokenIndex: number) {
        var index = startIndex;
        while (index < endTokenIndex) {
            var token: LToken = this.tokens[index]
            index++;
            if (token.type == LTT.Keyword && token.value == "return") {
                var info = this.getCompletionValueKeys(this.tokens, index)
                if (info) {
                    if (info == null || info.type == null) {
                        var xx = 1
                    }
                    if (info.type == 1) {
                        completion.addFunctionReturnCompletionKeys(completion.completionFunName, info.keys)
                    } else {
                    }
                }
            }
        }
    }

    public getSymbol(name: string): LSymbol {
        for (var i = 0; i < this.symbols.length; i++) {
            var symbol = this.symbols[i]
            if (symbol.name == name) {
                return symbol
            }
        }
        return null
    }

    public getSymbolEndRange(functionName: string): vscode.Range {
        var symbol: LSymbol = null;
        var range: vscode.Range;
        for (var i = 0; i < this.symbols.length; i++) {
            symbol = this.symbols[i]
            if (!symbol.isLocal) {
                if (symbol.name == functionName) {
                    var loc: vscode.Position = new Position(symbol.location.range.end.line + 1, 0)
                    range = new vscode.Range(
                        loc, loc)
                    break;
                }
            }
        }
        if (range == null && symbol != null) {
            var loc: vscode.Position = new Position(symbol.location.range.end.line, symbol.location.range.end.character)
            range = new vscode.Range(
                loc, loc)
        }
        //没找到直接找最后
        return range
    }

    public getSymbolArgsByNames(funNames: Array<string>): Array<LCItem> {
        var argLuaFiledCompleteInfos: Array<LCItem> = new Array<LCItem>()
        for (var i = 0; i < this.symbols.length; i++) {
            var symbol = this.symbols[i]
            for (var j = 0; j < funNames.length; j++) {
                var name = funNames[j];
                if (symbol.name == name) {
                    for (var k = 0; k < symbol.args.length; k++) {
                        var alc = symbol.args[k];
                        argLuaFiledCompleteInfos.push(alc)
                    }
                }
            }
        }
        return argLuaFiledCompleteInfos;
    }

    public addSymbol(lp: LParse, luaInfo: LFrag, token: LToken, functionEndToken: LToken, symolName?: string): LSymbol {
        var tokens: Array<LToken> = lp.tokens
        var symbolInfo = new LSymbol(token.value, SymbolKind.Function, new Range(
            new Position(luaInfo.startToken.line, luaInfo.startToken.range.start),
            new Position(functionEndToken.line, token.range.end)
        ), undefined, Helper.GetFirstComments(luaInfo.getComments()));
        var nindex: number = token.index;
        while (true) {
            nindex--;
            var upToken: LToken = tokens[nindex]
            if (upToken == null) {
                break;
            }
            nindex--;
            if (lp.Compare(':', upToken, LTT.Punctuator) || lp.Compare('.', upToken, LTT.Punctuator)) {
                var mtokenInfo: LToken = tokens[nindex];
                symbolInfo.name = mtokenInfo.value + upToken.value + symbolInfo.name;
            } else {
                break;
            }
        }
        if (symolName != null) {
            symbolInfo.name = symolName;
        }
        if (this.tempFuncSymbols.length == 0) {
            symbolInfo.isLocal = false;
        } else {
            symbolInfo.isLocal = true;
            var functionName = "";
            this.tempFuncSymbols.forEach(fname => {
                if (functionName == "") {
                    functionName = fname;
                } else {
                    functionName = functionName + "->" + fname;
                }
            });
            symbolInfo.name = functionName + "->" + symbolInfo.name;
        }
        symbolInfo.initArgs(luaInfo.params, luaInfo.getComments())
        this.symbols.push(symbolInfo)
        return symbolInfo
    }

    private findLastSymbol(): LSymbol {
        for (var i = this.symbols.length - 1; i > 0; i--) {
            var symbolInfo = this.symbols[i];
            if (!symbolInfo.location) {
                return symbolInfo;
            }
        }
        return null
    }

    /**
     * 添加itemm
     */
    public addCompletionItem(lp: LParse, frag: LFrag, token: LToken, tokens: Array<LToken>,
        isFun: boolean = false,
        isCheckValueRequire: boolean = false
    ): LCItem {
        this.lp = lp;
        this.tokens = lp.tokens;
        var starIndex: number = frag.startToken.index;
        var endIndex: number = token.index;
        var label: string = "";
        if (starIndex == endIndex) {
            var singleToken: LToken = this.tokens[starIndex];
            if (singleToken.type == LTT.NumericLiteral ||
                singleToken.type == LTT.BooleanLiteral ||
                singleToken.type == LTT.NilLiteral ||
                singleToken.type == LTT.StringLiteral
            ) {
                return;
            }
        }
        var stoken = this.tokens[starIndex]
        if (
            stoken.type == LTT.NumericLiteral ||
            stoken.type == LTT.BooleanLiteral ||
            stoken.type == LTT.NilLiteral ||
            stoken.type == LTT.StringLiteral ||
            stoken.type == LTT.Punctuator
        ) {
            return
        }
        if (stoken.value == "module") {
            if (this.tokens.length >= starIndex + 3) {
                if (this.tokens[starIndex + 1].value == "(") {
                    var moduleToken = this.tokens[starIndex + 2]
                    if (moduleToken.type == LTT.StringLiteral) {
                        this.module = moduleToken.value;
                        var moduleCompletion = new LCItem(this.module, CompletionItemKind.Field, lp.tempUri, new vscode.Position(moduleToken.line, moduleToken.lineStart), false, moduleToken)

                        this.fields.addItem(moduleCompletion)
                        moduleCompletion.isNewVar = true

                        var moduleFunCompletion = new LCItem(this.module, CompletionItemKind.Field, lp.tempUri, new vscode.Position(moduleToken.line, moduleToken.lineStart), false, moduleToken)
                        this.funcs.addItem(moduleFunCompletion)
                        moduleCompletion.isNewVar = true
                        moduleFunCompletion.isNewVar = true
                        this.rootField = moduleCompletion;
                        this.rootFunc = moduleFunCompletion;
                        return;
                    }
                }
            }
        }

        var startInfos: LCItem = null

        var infos: Array<CompletionItemSimpleInfo> = this.getCompletionKey(starIndex, endIndex);


        if (infos == null || infos.length == 0) { return null }
        var isCheckParentPath = false
        var forindex: number = 0;
        if (isFun) {
            // 方法
            startInfos = this.funcs;
            if (this.tempFunc != null) {
                startInfos = this.tempFunc;
            } else if (this.module != null) {
                startInfos = startInfos.getItemByKey(this.module)
            }
        } else if (this.tempFuncNames.length == 0) {

            if (frag.isLocal) {
                startInfos = this.locals
            }
            else {
                // 类
                if (this.locals.getItemByKey(infos[0].key) != null) {
                    startInfos = this.locals
                } else {
                    startInfos = this.fields;
                }
                isCheckParentPath = true
            }
        }
        else {
            var data = null
            if (infos[0].key == "self") {
                data = Helper.GetSelfToModuleName(this.tokens.slice(0, endIndex), this.lp)
            }
            if (data) {
                var moduleName = data.moduleName
                //找到self 属于谁
                var golbalCompletion = this.locals.getItemByKey(moduleName)
                if (golbalCompletion == null) {
                    golbalCompletion = this.fields.getItemByKey(moduleName)
                }
                if (golbalCompletion == null) {
                    var keyToken: LToken = data.token
                    golbalCompletion = new LCItem(moduleName, infos[0].kind, lp.tempUri,
                        new vscode.Position(keyToken.line, keyToken.lineStart), false, keyToken)
                    this.fields.addItem(golbalCompletion)
                }
                forindex = 1;
                startInfos = golbalCompletion;
            } else {
                startInfos = this.tempFunc
                if (frag.isLocal == false) {
                    var key = ""
                    if (infos.length > 0) {
                        key = infos[0].key
                    }
                    var curName: string = ""
                    if (key != "") {
                        //判断是否为参数
                        for (var pi = 0; pi < this.tempFuncParams.length; pi++) {
                            var argNames = this.tempFuncParams[pi];
                            for (var ai = 0; ai < argNames.length; ai++) {
                                var paramsName = argNames[ai];
                                if (key == paramsName) {
                                    curName = this.tempFuncNames[pi]
                                    break
                                }
                            }
                            if (curName != "") {
                                break
                            }
                        }
                    }
                    if (curName != "") {
                        startInfos = this.funcFields.get(curName)
                    } else {
                        while (true) {
                            var completion: LCItem = startInfos.getItemByKey(infos[0].key)
                            if (completion == null) {
                                if (startInfos.funParentLuaCompletionInfo) {
                                    startInfos = startInfos.funParentLuaCompletionInfo
                                } else {
                                    if (this.locals.getItemByKey(infos[0].key)) {
                                        startInfos = this.locals
                                    } else {
                                        startInfos = this.fields
                                    }
                                    break
                                }
                            } else {
                                break
                            }

                        }
                    }
                }
            }
        }
        for (var i = forindex; i < infos.length; i++) {
            var newStartInfos: LCItem = null
            var completion: LCItem = startInfos.getItemByKey(infos[i].key)
            if (completion == null) {
                completion = new LCItem(infos[i].key, infos[i].kind, lp.tempUri, infos[i].position, isFun, infos[i].token)
                startInfos.addItem(completion)
                if (isFun) {
                    completion.documentation = Helper.GetFirstComments(infos[i].comments)
                }
                else {
                    completion.documentation = infos[i].desc;
                }
                completion.comments = infos[i].comments
                if (isCheckParentPath && infos.length == 1) {
                    this.checkParentClassValue(completion);
                }
            } else {
                if (infos[i].desc && completion.isFunc == false) {
                    completion.documentation = infos[i].desc
                }
            }
            if (i == infos.length - 1) {
                if (completion.isNewVar == false && endIndex + 2 < tokens.length) {
                    if (lp.Compare("=", tokens[endIndex + 1], LTT.Punctuator)) {
                        completion.isNewVar = true;
                        completion.position = infos[i].position
                        completion.token = infos[i].token
                    }
                }
            }
            completion.setType(infos[i].tipTipType)
            if (infos[i].nextInfo) {
                var nextInfo: CompletionItemSimpleInfo = infos[i].nextInfo
                var nextCompletion: LCItem = completion.getItemByKey(nextInfo.key)
                if (nextCompletion == null) {
                    nextCompletion = new LCItem(nextInfo.key, nextInfo.kind, lp.tempUri, nextInfo.position, isFun, nextInfo.token)
                    nextCompletion.setType(1)
                    completion.addItem(nextCompletion);
                } else {
                    var xx = 1;
                }
                newStartInfos = nextCompletion
            } else {
                newStartInfos = completion
            }
            startInfos = newStartInfos
        }
        if (frag.type == LFT.Function) {
            startInfos.params = frag.params
            startInfos.kind = CompletionItemKind.Function;
            startInfos.isLocal = frag.isLocal;
            var funKey = startInfos.label;
            if (this.tempFunc != null) {
                funKey = this.tempFunc.label + "->" + funKey;
            }
            if (this.funcFields.has(funKey)) {
                this.funcFields.get(funKey).isLocal = startInfos.isLocal;
            }
        }
        this.addTableFileds(frag, startInfos, lp, isFun);
        if (isCheckValueRequire) {
            this.checkCompletionItemValueRequire(token, tokens, startInfos)
        }
        return startInfos
    }

    private addTableFileds(luaInfo: LFrag, startInfos: LCItem, lp: LParse, isFun: boolean) {
        //判断 luaInfo 
        if (luaInfo.tableFileds && luaInfo.tableFileds.length) {
            var tableFileds: Array<LFrag> = luaInfo.tableFileds;
            tableFileds.forEach(filed => {
                if (!startInfos.getItemByKey(filed.name)) {
                    if (filed.tableFiledType == 0) {
                        var completion: LCItem = new LCItem(
                            filed.name, CompletionItemKind.Field, lp.tempUri,
                            new vscode.Position(filed.endToken.line, filed.endToken.lineStart), isFun, filed.endToken.last);
                        completion.isNewVar = true;
                        startInfos.addItem(completion)
                        completion.setType(1)
                        this.addTableFileds(filed, completion, lp, isFun)
                    } else {
                        var completion: LCItem = new LCItem(
                            startInfos.label + filed.name,
                            CompletionItemKind.Field, lp.tempUri, new vscode.Position(filed.startToken.line, filed.startToken.lineStart), isFun, filed.startToken);
                        startInfos.parent.addItem(completion)
                        this.addTableFileds(filed, completion, lp, isFun)
                    }
                }
            })
        }
    }

    public getCompletionKey(starIndex: number, endIndex: number): Array<CompletionItemSimpleInfo> {
        // console.log("getCompletionKey")
        var infos: Array<CompletionItemSimpleInfo> = new Array<CompletionItemSimpleInfo>();
        var key: string = "";
        // 1 为 .  2 为 :
        var tipType: number = 0;

        var comments: Array<LComment> = null
        //获取注释
        while (true) {
            if (starIndex > endIndex) break;
            var keyToken: LToken = this.tokens[starIndex];
            if (keyToken.type == LTT.Keyword) {
                return infos = [];
            }

            if (comments == null) {
                //判断下 是不是function  和 local 
                if (starIndex - 1 >= 0) {
                    var upToken: LToken = this.tokens[starIndex - 1]
                    if (this.lp.Compare('function', upToken, LTT.Keyword)) {
                        comments = upToken.comments;
                        if (starIndex - 2 >= 0) {
                            if (this.lp.Compare('local', this.tokens[starIndex - 2], LTT.Keyword)) {
                                comments = this.tokens[starIndex - 2].comments;
                            }
                        }
                    } else if (this.lp.Compare('local', upToken, LTT.Keyword)) {
                        comments = upToken.comments;
                    }
                } else {
                    comments = keyToken.comments;
                }
            }
            var key = "";
            if (keyToken.type == LTT.StringLiteral) {
                key += '"' + this.tokens[starIndex].value + '"';
            }
            else {
                key += this.tokens[starIndex].value;
            }
            var simpleInfo: CompletionItemSimpleInfo = null;
            if (
                this.lp.Compare('[', keyToken, LTT.Punctuator) ||
                this.lp.Compare('(', keyToken, LTT.Punctuator) ||
                this.lp.Compare(')', keyToken, LTT.Punctuator) ||
                this.lp.Compare(']', keyToken, LTT.Punctuator)
            ) {
                break
            } else {
                simpleInfo = new CompletionItemSimpleInfo(key, starIndex, CompletionItemKind.Field, tipType, new vscode.Position(keyToken.line,
                    keyToken.range.start - keyToken.lineStart), keyToken);
                infos.push(simpleInfo);
                starIndex++;
                if (starIndex > endIndex) break;
                tipType = this.getTipType(starIndex);
                if (tipType != 0) {
                    starIndex++;
                    continue;
                }
            }

            if (this.lp.Compare('[', this.tokens[starIndex], LTT.Punctuator)) {
                var g_number = 1;
                var beginIndex = starIndex + 1;
                while (true) {
                    starIndex++;
                    if (this.lp.Compare(']', this.tokens[starIndex], LTT.Punctuator)) {
                        g_number--;
                        if (g_number == 0) {
                            var leng: number = starIndex - beginIndex
                            var lastInfo: CompletionItemSimpleInfo = infos[infos.length - 1]
                            if (leng == 1) {

                                var stringToken: LToken = this.tokens[beginIndex];
                                var tokenValue: string = "";
                                if (stringToken.type == LTT.StringLiteral) {
                                    tokenValue = '"' + stringToken.value + '"';
                                    var nextSimpleInfo: CompletionItemSimpleInfo = new CompletionItemSimpleInfo(stringToken.value, starIndex, CompletionItemKind.Field, 1, new vscode.Position(stringToken.line,
                                        stringToken.range.start - stringToken.lineStart
                                    ), stringToken)
                                    lastInfo.nextInfo = nextSimpleInfo;

                                } else if (
                                    stringToken.type == LTT.NumericLiteral ||
                                    stringToken.type == LTT.BooleanLiteral ||
                                    stringToken.type == LTT.Identifier ||
                                    stringToken.type == LTT.VarargLiteral
                                ) {
                                }
                                else {
                                }

                            } else {
                            }
                            starIndex++;
                            break;
                        }

                    } else if (this.lp.Compare('[', this.tokens[starIndex], LTT.Punctuator)) {
                        g_number++;
                    }
                }
                tipType = this.getTipType(starIndex);
                if (tipType != 0) {
                    starIndex++;
                    continue;
                }
            } else {
                var ss = 1;
            }
            if (starIndex > endIndex) break;
            if (this.lp.Compare('(', this.tokens[starIndex], LTT.Punctuator)) {
                var m_number = 1;
                while (true) {
                    starIndex++;
                    if (this.lp.Compare(')', this.tokens[starIndex], LTT.Punctuator)) {
                        m_number--;
                        if (m_number == 0) {
                            starIndex++;
                            break;
                        }
                    } else if (this.lp.Compare('(', this.tokens[starIndex], LTT.Punctuator)) {
                        m_number++;
                    }
                }
                if (starIndex > endIndex) {
                    break
                }
                tipType = this.getTipType(starIndex);
                if (tipType != 0) {
                    starIndex++;
                    continue;
                }
            }
            if (starIndex > endIndex) {
                break
            }
        }
        if (infos.length > 0) {
            var simpleInfo: CompletionItemSimpleInfo = infos[infos.length - 1]
            var commentstr: string = Helper.GetComments(comments)
            var skind: CompletionItemKind = simpleInfo.kind;
            if (simpleInfo.nextInfo) {
                simpleInfo.kind = CompletionItemKind.Field;
                simpleInfo.nextInfo.kind = skind;
                simpleInfo.nextInfo.desc = commentstr;
                simpleInfo.comments = comments;
            } else {
                simpleInfo.desc = commentstr;
                simpleInfo.comments = comments;
            }
        }
        return infos;
    }

    public getTipType(starIndex: number): number {
        var tipType: number = 0;
        if (starIndex >= this.tokens.length) return tipType;
        var symbolToken: LToken = this.tokens[starIndex];
        if (this.lp.Compare('.', symbolToken, LTT.Punctuator)) {
            tipType = 1;

        } else if (this.lp.Compare(':', this.tokens[starIndex], LTT.Punctuator)) {
            tipType = 2;
        }
        return tipType;
    }

    public getValueToken(index: number, tokens: Array<LToken>) {
        if (index < tokens.length) {
            return tokens[index]
        } else {
            return null
        }
    }

    //检查 item赋值 require 路径
    public checkCompletionItemValueRequire(endToken: LToken, tokens: Array<LToken>, completion: LCItem) {
        if (completion.refClazz != null) {
            return;
        }
        var length = tokens.length
        var index = endToken.index + 1;
        var currentToken: LToken = this.getValueToken(index, tokens)
        if (currentToken) {
            if (currentToken.type == LTT.Punctuator && currentToken.value == "=") {
                //优先注释
                this.checkValueReferenceValue(completion)
                if (completion.refClazz != null) {
                    return;
                }
                index++;
                var funNames: Array<string> = Helper.GetCurrentFunctionName(this.tokens.slice(0, endToken.index))
                if (funNames.length == 0) {
                    //没有方法那么就是文件中的全局信息
                    funNames.push("__g__")
                }
                currentToken = this.getValueToken(index, tokens)
                if (currentToken == null) {
                    return;
                }
                if (currentToken.type == LTT.Identifier) {
                    if (ExtMgr.requireFunNames.indexOf(currentToken.value) > -1) {
                        //require 模式
                        index++;
                        currentToken = this.getValueToken(index, tokens)
                        if (currentToken) {
                            if (currentToken.type == LTT.Punctuator && currentToken.value == "(") {
                                index++
                                currentToken = this.getValueToken(index, tokens)
                                if (currentToken != null) {
                                    if (currentToken.type == LTT.StringLiteral) {
                                        var pathValue = currentToken.value;
                                        completion.addRequireReferencePath(pathValue)
                                    } else if (currentToken.type == LTT.Identifier) {
                                        var keysInfo = this.getCompletionValueKeys(tokens, index)
                                        if (keysInfo) {
                                            var keys: Array<string> = keysInfo.keys
                                            if (keys.length > 0) {
                                                completion.addRequireReferenceFileds(funNames[0], keys)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        var info = this.getCompletionValueKeys(tokens, index)
                        if (info) {
                            if (info.type == 1) {
                                completion.addReferenceCompletionKeys(funNames[0], info.keys)
                            } else {
                                completion.addReferenceCompletionFunKeys(funNames[0], info.keys)
                            }
                        }
                    }
                } else if (currentToken.type == LTT.StringLiteral) {
                    completion.setCompletionStringValue(currentToken.value)
                }
            }
        }
    }

    /**
     * type == 1 字段
     * type == 2 方法
     */
    public getCompletionValueKeys(tokens: Array<LToken>, index: number): any {
        var keys: Array<string> = new Array<string>();
        var keyToken: LToken = tokens[index]
        if (keyToken.type == LTT.Identifier) {
            keys.push(keyToken.value)
            if (keyToken.value == "self") {
                var info = Helper.GetSelfToModuleName(tokens, LParse.ins)
                if (info) {
                    keys[0] = info.moduleName
                }
            }
        } else {
            return null
        }
        index++;
        while (index < tokens.length) {
            keyToken = tokens[index]
            if (keyToken.type == LTT.Punctuator) {
                if (keyToken.value == "." || keyToken.value == ":") {
                    keys.push(keyToken.value)
                } else if (keyToken.value == "(") {
                    //为一个方法
                    return {
                        type: 2,
                        keys: keys
                    }
                }
                else if (keyToken.value == ")") {
                    return {
                        type: 1,
                        keys: keys
                    }
                }
                else if (keyToken.value == ";") {
                    return {
                        type: 1,
                        keys: keys
                    }
                }
                else {
                    return null
                }
            } else {
                return {
                    type: 1,
                    keys: keys
                }
            }
            index++
            var keyToken = tokens[index]
            if (keyToken.type == LTT.Identifier) {
                keys.push(keyToken.value)
            }
            index++
            if (index >= tokens.length) {
                return null
            }

        }
        return null
    }

    /**
     * 去除多余的completion
     */
    public checkFunCompletion() {
        var items = this.funcs.getItems()
        items.forEach((funCompletion, k) => {
            //查找
            var gcompletion: LCItem = this.locals.getItemByKey(k)
            if (gcompletion) {
                if (funCompletion.getItems().size == 0 && gcompletion.getItems().size == 0) {
                    this.locals.delItem(k)
                } else {
                    funCompletion.getItems().forEach((fc, k1) => {
                        gcompletion.delItem(k1)
                    })
                }
            }
            gcompletion = this.fields.getItemByKey(k)
            if (gcompletion) {
                if (funCompletion.getItems().size == 0 && gcompletion.getItems().size == 0) {
                    this.locals.delItem(k)
                } else {
                    funCompletion.getItems().forEach((fc, k1) => {
                        gcompletion.delItem(k1)
                    })
                }
            }
        })
    }
}

export class CompletionItemSimpleInfo {
    public key: string
    public endIndex11: number
    public tipTipType: number
    public kind: CompletionItemKind
    public desc: string = null
    public nextInfo: CompletionItemSimpleInfo = null
    public isShow: boolean = true
    public comments: Array<LComment>
    public position: vscode.Position
    public token: LToken

    public constructor(key: string, endIndex: number, kind: CompletionItemKind, tipTipType: number, position: vscode.Position, token: LToken) {
        this.position = position
        this.key = key
        this.tipTipType = tipTipType
        this.endIndex11 = endIndex
        this.kind = kind
        this.token = token
    }
}