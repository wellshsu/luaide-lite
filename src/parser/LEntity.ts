import vscode = require('vscode')
import { Range } from 'vscode-languageclient'
import { LParse } from './LParse'
import { LCItem } from "../provider/LCItem"

export class LFrag {
    public name: string;
    public type: LFT;
    public module: string;
    public parent: LFrag;
    public comments: Array<LComment> = null;
    public alisa: string = null;
    public isPointFun: boolean = false
    public isMultipleVariables: boolean = false
    public localFrags: Array<LFrag>;
    public params: Array<string>;
    public isValue: boolean = false;
    public value: LFrag;
    public multipleRoot: LFrag;
    /** : 的数量 */
    public punctuatorNumber_1: number = 0;
    /** . 的数量  */
    public punctuatorNumber_2: number = 0;
    /** [] 的数量 */
    public punctuatorNumber_3: number = 0;

    /**用于table 第一次判断 , */
    public tableIsFistItem: boolean = true;

    public bracket_Gs: Array<LFrag>;

    /**是否是包含在 [] 中的 */
    public isBracket_G: boolean = false

    //==============================华丽的分割线   新版本用到的=====================================
    /**后置的二元运算符号 用于预判值的计算 */
    public operatorToken: LToken;

    /**一元数组 */
    public unarys: Array<LToken>;
    /**是否是局部变量 */
    public isLocal = false;
    /** 所在文件 */
    public filePath: string;
    /**  . : 连接的下一个info */
    private nextLuaInfo: LFrag;
    private upLuaInfo: LFrag;
    /**lua对应的值 */
    public valueType: LVT;

    public isVar: boolean;

    public isAddToFiled: boolean = true
    public tableFileds: Array<LFrag>;
    public startToken: LToken;
    public endToken: LToken;

    public tableFiledType: number = 0;
    public isAnonymousFunction: boolean = false
    public isNextCheck: boolean = true;
    constructor(startToken: LToken) {
        this.comments = new Array<LComment>();
        this.isVar = false
        this.startToken = startToken;
        this.type = LFT.Field;
        this.localFrags = new Array<LFrag>();
        this.params = new Array<string>();
        this.unarys = new Array<LToken>();
        this.tableFileds = new Array<LFrag>();
    }

    public getNextLuaInfo() {
        return this.nextLuaInfo;
    }

    public getUpInfo() {
        return this.upLuaInfo;
    }

    public setNextLuaInfo(nextLuaInfo: LFrag) {
        this.nextLuaInfo = nextLuaInfo;
        nextLuaInfo.isMultipleVariables = this.isMultipleVariables
        nextLuaInfo.isLocal = this.isLocal
        nextLuaInfo.isVar = this.isValue;
        nextLuaInfo.upLuaInfo = this;
        nextLuaInfo.comments = this.comments;
        this.comments = null
    }

    public getTopLuaInfo(): LFrag {
        while (true) {
            if (this.upLuaInfo) {
                return this.upLuaInfo.getTopLuaInfo();
            } else {
                return this
            }
        }
    }

    public getLastLuaInfo(): LFrag {
        while (true) {
            if (this.nextLuaInfo) {
                return this.nextLuaInfo.getLastLuaInfo();
            } else {
                return this
            }
        }
    }

    public setEndToken(token: LToken) {
        this.endToken = token;
        if (this.type == LFT.Table) {
            return;
        }
        LParse.ins.fileMgr.addField(this, token)
    }

    /**
     * 添加参数名
     */
    public addParam(param): number {
        //需要检查是否有重复的参数名
        for (var i = 0; i < this.params.length; i++) {
            if (this.params[i] === param) {
                return i + 1;
            }
        }
        this.params.push(param);
        return -1;
    }

    public setComments(comments: Array<LComment>) {
        this.comments = this.comments.concat(comments)
    }

    public getComments(): Array<LComment> {
        return this.comments;
    }
}

export enum LFT {
    Field = 1,
    Table = 2,
    Function = 3,
    ModuleFunc = 5, // function xx:xxx() end
    Param = 6,
    AnonymousFunc = 7,
    FOR_I = 8,
    FOR_PAIRS = 9,
    FuncCall,
    RETURN = 11,
    WHILE = 12,
    ROOT = 13,
    IF = 14,
    ELSEIF = 15,
    ELSE = 16,
    Number,
    BOOLEAN,
    STRING,
    NIL,
    Vararg,
    Bracket_M
}

export class LComment {
    constructor(content, range: Range, isLong: boolean) {
        this.content = content;
        this.range = range;
        this.isLong = isLong;
    }
    public isLong: boolean = false;
    public content: string = null;
    public range: Range = null;
}

export class LToken {
    public type: LTT = LTT.EOF;
    public value: any = '<eof>';
    public line: number = 0;
    public lineStart: number = 0;
    public last: LToken
    public next: LToken;
    public range: LRange = null;
    public error: LError = null;
    public index: number;
    public delimiter: string = null;
    public enddelimiter: string = null;
    public comments: Array<LComment>;
    public afterComments: Array<LComment>;
    constructor() {
        this.comments = new Array<LComment>();
    }
    public addAfterComment(comment: LComment) {
        if (this.afterComments == null) {
            this.afterComments = new Array<LComment>();
        }
        this.afterComments.push(comment);
    }
    public addComment(comment: LComment): void {
        this.comments.push(comment);
    }
}

export class LRange {
    public start: number;
    public end: number;
    constructor(start: number, end: number) {
        this.start = start;
        this.end = end;
    }
}

export enum LTT {
    EOF = 1, // 结束符
    StringLiteral = 2,
    Keyword = 3,
    Identifier = 4, // 标示符
    NumericLiteral = 5,
    Punctuator = 6, // 标点符号
    BooleanLiteral = 7,
    NilLiteral = 8,
    VarargLiteral = 9,
    Wrap = 10,
    Tab = 11
}

export enum LET {
    unexpected,
    expected,
    unfinishedString,
    malformedNumber,
    invalidVar,
    expectedToken,
    unoperator,
}

export class LError {
    public type: LET;
    public msg: string;

    public constructor(type: LET, msg: string) {
        this.type = type;
        this.msg = msg;
    }
}

export enum LVT {
    NUMBER,
    BOOL,
    STRING,
    ANY,
    NIL,
    Table,
    Function
}

export class LSymbol extends vscode.SymbolInformation {
    public uri: vscode.Uri;
    public range: vscode.Range;
    public isLocal: boolean = false;
    public args: Array<LCItem>;
    public parent: LSymbol;

    constructor(name: string, kind: vscode.SymbolKind, range: vscode.Range, uri?: vscode.Uri, containerName?: string) {
        super(name.toString(), kind, range, uri, containerName);
        this.uri = uri;
        this.range = range;
    }

    public initArgs(args: Array<string>, comments: Array<LComment>) {
        if (args != null) {
            this.args = new Array<LCItem>();
            for (var i = 0; i < args.length; i++) {
                var element = args[i];
                var completion: LCItem = new LCItem(element,
                    vscode.CompletionItemKind.Variable, this.uri, this.range.start, false, null)
                if (comments) {
                    for (var index = 0; index < comments.length; index++) {
                        var comment: LComment = comments[index];
                        var argComment = "@" + element + ":";
                        var cindex: number = comment.content.indexOf(argComment)
                        if (cindex > -1) {
                            completion.documentation = comment.content.substring(cindex + argComment.length).trim()
                            break
                        }
                    }
                }
                this.args.push(completion)
            }
        }
    }
}