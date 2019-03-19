import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
/**验证 一个代码段 */
export class LuaChuckInfo {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }


    public check(luaInfo: LFrag, isSemicolons: boolean) {
        var token: LToken = this.lp.getCurrentToken("uncomplete code block")
        if (this.lp.isError) return
        luaInfo.setComments(token.comments)
        if (this.lp.Compare('(', token, LTT.Punctuator)) {
            this.lp.tokenIndex++;
            this.lp.luaValidateBracket_M.check(luaInfo)
            if (this.lp.isError) return
        }
        else if (this.lp.Compare("function", token, LTT.Keyword)) {
            luaInfo.isAnonymousFunction = true
            this.lp.luaFunctionParse.check(luaInfo, true, null)
            this.lp.tokenIndex--;
            return
        }
        else if (this.lp.Compare('{', token, LTT.Punctuator)) {
            var endToken: LToken = this.lp.getUpToken();
            this.lp.luaTableParse.check(luaInfo);
            luaInfo.setEndToken(endToken);
            return
        }
        else if (token.type == LTT.Keyword) {
            this.lp.setError(token, "keyword can not be identifier")
            return false
        }
        else {
            //设置luainfo 的值
            this.lp.luaValidateConstValue.check(token, luaInfo);
            if (this.lp.isError) return
            luaInfo.name = token.value
        }

        var currentToken: LToken = this.lp.getCurrentToken(null);

        //检查还有没有
        var nextToken: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null)
        if (nextToken == null) return

        if (currentToken.type == LTT.Identifier) {
            if (
                nextToken.type == LTT.BooleanLiteral ||
                nextToken.type == LTT.NilLiteral ||
                nextToken.type == LTT.NumericLiteral ||
                nextToken.type == LTT.StringLiteral ||
                nextToken.type == LTT.VarargLiteral
            ) {
                this.lp.tokenIndex++;
                luaInfo.getTopLuaInfo().isNextCheck = false
                return
            } else if (this.lp.Compare('{', nextToken, LTT.Punctuator)) {
                var tableLuaInfo: LFrag = new LFrag(nextToken)
                this.lp.tokenIndex++;
                this.lp.luaTableParse.check(tableLuaInfo)
                luaInfo.getTopLuaInfo().isNextCheck = false
                return
            }

        }

        if (this.lp.Compare(',', nextToken, LTT.Punctuator)) {
            return
        }
        if (token.type != LTT.Identifier &&
            token.type != LTT.VarargLiteral) {
            if (this.lp.Compare('.', nextToken, LTT.Punctuator) ||
                this.lp.Compare('[', nextToken, LTT.Punctuator) ||
                this.lp.Compare(':', nextToken, LTT.Punctuator) ||
                this.lp.Compare('(', nextToken, LTT.Punctuator)) {
                this.lp.setError(nextToken, "unexpected token(1020)")
                return
            }
        }

        if (this.lp.Compare('(', nextToken, LTT.Punctuator)) {

            if (luaInfo.isLocal) {
                this.lp.setError(nextToken, "unexpected token(1019)")
                return
            }
            if (luaInfo.isMultipleVariables) {
                this.lp.setError(nextToken, "unexpected token(1018)")
                return
            }
            this.lp.tokenIndex++;
            this.lp.functionCall.check(luaInfo, isSemicolons, false)

        }
        else if (this.lp.Compare('.', nextToken, LTT.Punctuator) ||
            this.lp.Compare('[', nextToken, LTT.Punctuator) ||
            this.lp.Compare(':', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex += 2;
            if (luaInfo.isLocal) {
                this.lp.setError(token, "local identifier can not include '" + token.value + "'")
                return null;
            } else {
                if (this.lp.Compare('.', nextToken, LTT.Punctuator)) {
                    var newLuaInfo: LFrag = new LFrag(this.lp.getTokenByIndex(this.lp.tokenIndex + 2, null));
                    luaInfo.setNextLuaInfo(newLuaInfo)
                    nextToken = this.lp.getCurrentToken("uncomplete code block")
                    if (this.lp.isError) return;
                    if (nextToken.type != LTT.Identifier) {
                        if (nextToken.type == LTT.Keyword) {
                            this.lp.setError(nextToken, "keyword can not be identifier")
                        } else {
                            this.lp.setError(nextToken, "unexpected token(1017)")
                        }
                        return;
                    }
                    this.check(newLuaInfo, isSemicolons)
                    if (this.lp.isError) return

                } else if (this.lp.Compare('[', nextToken, LTT.Punctuator)) {
                    this.lp.luaValidateBracket_G.check(luaInfo, true)
                } else if (this.lp.Compare(':', nextToken, LTT.Punctuator)) {
                    this.checkModuleFunctionCall(luaInfo, isSemicolons)
                }

            }
        }
    }

    /**
     * 检查模块方法调用
     */
    public checkModuleFunctionCall(luaInfo: LFrag, isSemicolons: boolean) {
        var token: LToken = this.lp.getCurrentToken("unexcepted module function call");
        if (this.lp.isError) return
        if (token.type != LTT.Identifier) {
            this.lp.setError(token, "unexcepted module function call")
            return
        }
        var newLuaInfo: LFrag = new LFrag(token)
        if (luaInfo != null) {
            luaInfo.setNextLuaInfo(newLuaInfo)
        }
        else {
        }
        var nextToken: LToken = this.lp.getNextToken("unexcepted module function call");
        if (this.lp.isError) return
        if (!this.lp.Compare('(', nextToken, LTT.Punctuator)) {
            if (
                nextToken.type == LTT.BooleanLiteral ||
                nextToken.type == LTT.NilLiteral ||
                nextToken.type == LTT.NumericLiteral ||
                nextToken.type == LTT.StringLiteral ||
                nextToken.type == LTT.VarargLiteral
            ) {
                luaInfo.getTopLuaInfo().isNextCheck = false
                return
            } else if (this.lp.Compare('{', nextToken, LTT.Punctuator)) {
                var tableLuaInfo: LFrag = new LFrag(nextToken)
                this.lp.luaTableParse.check(tableLuaInfo)
                luaInfo.getTopLuaInfo().isNextCheck = false
                return
            } else {
                this.lp.setError(token, "unexcepted module function call")
            }
            return
        }
        this.lp.functionCall.check(newLuaInfo, isSemicolons, false)
        if (this.lp.isError) return
    }
}