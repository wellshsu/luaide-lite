import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
import { ExtMgr } from "../context/ExtMgr"
import { format } from 'util';

export class LuaFunctionParse {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    public check(luaInfo: LFrag, isSemicolons: boolean, checkBreak: Function): boolean {
        var t: LToken = this.lp.getCurrentToken(null)
        luaInfo.type = LFT.Function
        var funName = t.value;
        var nindex: number = t.index;
        while (true) {
            nindex--;
            var upToken: LToken = this.lp.getTokenByIndex(nindex, null);
            if (upToken == null) {
                break;
            }
            nindex--;
            if (
                this.lp.Compare(':', upToken, LTT.Punctuator) ||
                this.lp.Compare('.', upToken, LTT.Punctuator)) {
                var mtokenInfo: LToken = this.lp.getTokenByIndex(nindex, null);
                funName = mtokenInfo.value + upToken.value + funName;
            } else {
                break;
            }
        }
        if (luaInfo.isAnonymousFunction) {
            funName = format("Anonymous(%d:%d)", luaInfo.startToken.line, luaInfo.startToken.lineStart)
        }

        //console.log("开始解析funcation")
        if (this.setFunctionParam(luaInfo) == false) return false
        this.lp.fileMgr.curFile.setBeginFunName(funName, luaInfo.params);
        this.lp.tokenIndex++;
        //进行方法内的解析
        var isEnd = this.lp.setLuaInfo(luaInfo, function (luaParse: LParse) {
            var token: LToken = luaParse.getTokenByIndex(luaParse.tokenIndex, null)
            if (token == null) {
                luaParse.setError(luaParse.getLastToken(), "uncomplete 'function'", luaInfo.startToken)
            }
            if (luaParse.isError) {
                return false
            }
            if (luaParse.Compare('end', token, LTT.Keyword)) {
                if (isSemicolons) {
                    luaParse.checkSemicolons()
                }
                luaParse.tokenIndex++;
                return true
            }
            return false
        }, checkBreak)
        if (isEnd) {
            this.lp.fileMgr.curFile.setEndFun();
            return true
        }
        else {
            if (this.lp.isError) return;
            var currerntToken = this.lp.getCurrentToken(null)
            if (currerntToken == null) {
                currerntToken = this.lp.getLastToken()
            }
            this.lp.setError(currerntToken, "uncomplete 'function'", luaInfo.startToken)
            return false
        }
    }

    /**
     * 解析方法参数
     */
    public setFunctionParam(luaInfo: LFrag) {
        // console.log("解析 方法参数 中...")
        //判断是否为 '('
        var bracketToken = this.lp.getNextToken("uncomplete 'function'")
        if (bracketToken === null) return false
        if (!this.lp.Compare('(', bracketToken, LTT.Punctuator)) {
            this.lp.setError(bracketToken, "unexpected token(1006)")
            return false
        }
        var bracketToken = this.lp.getNextToken("uncomplete 'function'")
        if (bracketToken === null) return false
        //判断是不是没有参数 
        if (this.lp.Compare(')', bracketToken, LTT.Punctuator)) {
            return true;
        }
        this.lp.tokenIndex--;
        var bracketCount: number = 0
        //方法参数只接受 TokenTypes.Identifier TokenTypes.VarargLiteral
        var isFist = true;
        while (true) {

            if (!isFist) {
                //检查逗号
                var commaToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'function'");
                if (commaToken == null) return false;
                if (!this.lp.Compare(',', commaToken, LTT.Punctuator)) {
                    this.lp.setError(commaToken, "should be ','")
                    return false
                } else {
                    this.lp.tokenIndex++;
                }
            }
            var paramToken = this.lp.getNextToken("uncomplete param define");
            if (paramToken == null) return false;
            if (paramToken.type == LTT.Identifier || paramToken.type == LTT.VarargLiteral) {
                isFist = false;
                var index = luaInfo.addParam(paramToken.value)
                if (ExtMgr.luaFunArgCheck) {
                    if (index > -1) {
                        this.lp.setError(paramToken, "param '" + paramToken.value + "' already exists  at " + index)
                        return false;
                    }
                }

                //判断有没有结束
                if (this.lp.Compare(')', this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'function'"), LTT.Punctuator)) {
                    this.lp.tokenIndex++;
                    return true;
                }
            }
            else {
                this.lp.setError(paramToken, "unexpected token(1005)")
                return false
            }
        }
    }
}