import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
export class LuaForLogic {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
     * 检查if 语句
     */
    public check(): boolean {

        var token: LToken = this.lp.getCurrentToken("uncomplete code block")
        if (this.lp.Compare('for', token, LTT.Keyword)) {
            var parent: LFrag = new LFrag(token)
            //检查类型
            var nextToken1 = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'for'");
            var nextToken2 = this.lp.getTokenByIndex(this.lp.tokenIndex + 2, "uncomplete 'for'");
            if (nextToken1 == null || nextToken2 == null) {
                return false
            }
            if (nextToken1.type != LTT.Identifier) {
                this.lp.setError(nextToken1, "for unexpected token(1016)");
                return false
            }
            var pluaInfo: LFrag = new LFrag(nextToken1)
            pluaInfo.isLocal = true
            pluaInfo.setEndToken(nextToken1)
            if (this.lp.Compare(',', nextToken2, LTT.Punctuator)) {
                this.lp.tokenIndex += 2
                this.checkPairs(parent, token, false)
                if (this.lp.isError) return false
                return true
            } else if (this.lp.Compare('in', nextToken2, LTT.Keyword)) {

                this.lp.tokenIndex += 2
                this.checkPairs(parent, token, true)
                if (this.lp.isError) return false
                return true
            }
            else {
                return this.checkForI(parent, token)
            }
        } else return false
    }

    private checkForI(parent: LFrag, startToken: LToken): boolean {
        var nextToken1 = this.lp.getNextToken(null)
        var luaInfo: LFrag = new LFrag(nextToken1);
        luaInfo.isLocal = true
        parent.type = LFT.FOR_I

        var nextToken2 = this.lp.getNextToken("uncomplete 'for'");
        if (this.lp.isError) return false
        if (this.lp.Compare('=', nextToken2, LTT.Punctuator)) {
            this.lp.tokenIndex++;
        }
        else {
            this.lp.setError(nextToken2, "unexpected token(1015)");
            return false

        }
        //验证表达式
        this.lp.luaSetValue.check(false, false, null)
        if (this.lp.isError) return false
        var nextToken = this.lp.getNextToken("uncomplete code block ")
        if (nextToken == null) return false
        if (!this.lp.Compare(',', nextToken, LTT.Punctuator)) {
            this.lp.setError(nextToken, "unexpected token(1014), should be ','");
            return false
        }
        this.lp.tokenIndex++;
        this.lp.luaSetValue.check(false, false, null)
        nextToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null)
        if (this.lp.Compare(',', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex += 2;
            this.lp.luaSetValue.check(false, false, null)
        }
        if (this.lp.isError) return false
        return this.checkFor1(luaInfo)
    }

    private checkPairs(parent: LFrag, startToken: LToken, isBrakTopCheck: boolean): boolean {
        var pairsToken: LToken = null;
        var luaInfo: LFrag = new LFrag(startToken);
        parent.type = LFT.FOR_PAIRS
        if (!isBrakTopCheck) {

            while (true) {
                //判断是否为in
                var tokenInfo1: LToken = this.lp.getNextToken("uncomplete 'for'")
                if (tokenInfo1 == null) return false
                var tokenInfo2: LToken = this.lp.getNextToken("uncomplete 'for'")
                if (tokenInfo2 == null) return false
                if (tokenInfo1.type != LTT.Identifier) {
                    this.lp.setError(tokenInfo1, "unexpected token(1013)")

                    return false
                }
                var pluaInfo: LFrag = new LFrag(tokenInfo1)
                pluaInfo.isLocal = true
                pluaInfo.setEndToken(tokenInfo1)
                if (this.lp.Compare('in', tokenInfo2, LTT.Keyword)) {
                    break;
                }



                if (this.lp.Compare(',', tokenInfo2, LTT.Punctuator)) {
                    continue;
                }
                else if (this.lp.Compare('in', tokenInfo2, LTT.Keyword)) {
                    break;
                } else {
                    this.lp.setError(tokenInfo1, "应该为 in")
                    return false
                }
            }
        } else {
        }
        pairsToken = this.lp.getNextToken("uncomplete 'for'")
        if (this.lp.isError) return false
        if (this.lp.Compare('ipairs', pairsToken, LTT.Identifier) ||
            this.lp.Compare('pairs', pairsToken, LTT.Identifier)) {
            var token: LToken = this.lp.getNextToken("uncomplete 'for'")
            if (this.lp.Compare('(', token, LTT.Punctuator) ||
                this.lp.Compare('{', token, LTT.Punctuator)) {
                luaInfo.name = pairsToken.value
                this.lp.luaSetValue.check(false, false, null);
                var to: LToken = this.lp.getCurrentToken(null)

                // this.lp.functionCall.check(luaInfo, false, true)
            } else {
                if (token.type != LTT.Identifier) {
                    this.lp.setError(token, "wrong token")
                    return false
                }

            }

            if (this.lp.isError) return false
            return this.checkFor1(luaInfo)


        }
        else if (this.lp.Compare('function', pairsToken, LTT.Keyword)) {
            var luaInfo1: LFrag = new LFrag(pairsToken)
            this.lp.luaFunctionParse.check(luaInfo1, true, null)
            this.lp.tokenIndex--;
            if (this.lp.isError) return false
            return this.checkFor1(luaInfo)
        }
        else {
            this.lp.luaSetValue.check(false, false, null)
            while (true) {
                var nextToken: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "for 未完成")
                if (this.lp.isError) return
                if (this.lp.Compare(',', nextToken, LTT.Punctuator)) {
                    this.lp.tokenIndex += 2;
                    this.lp.luaSetValue.check(false, false, null)
                } else {
                    break;
                }
            }

            if (this.lp.isError) return false
            // this.lp.setError(pairsToken, "unexpected token(1012)")
            return this.checkFor1(luaInfo)
        }

    }

    private checkFor1(luaInfo: LFrag): boolean {
        var nextToken = this.lp.getNextToken("uncomplete code block ")
        if (nextToken == null) return false
        if (!this.lp.Compare('do', nextToken, LTT.Keyword)) {
            this.lp.setError(nextToken, "unexpected token(1011), should be 'do'");
            return false
        } else {
            this.lp.tokenIndex++;
        }

        var isEnd = this.lp.setLuaInfo(luaInfo, function (luaParse: LParse) {
            var token: LToken = luaParse.getTokenByIndex(luaParse.tokenIndex, "uncomplete 'function'")
            if (luaParse.isError) return false
            if (luaParse.Compare('end', token, LTT.Keyword)) {

                luaParse.checkSemicolons()
                luaParse.tokenIndex++;
                return true
            }
            return false
        }, this.checkBrreak)
        if (isEnd) {

            return true
        }
        else {
            if (this.lp.isError) return false
            this.lp.setError(this.lp.getCurrentToken(null), "uncomplete 'for'")
            return false
        }
    }

    public checkBrreak(luaParse: LParse): any {
        var token: LToken = luaParse.getTokenByIndex(luaParse.tokenIndex, null)
        if (luaParse.Compare("break", token, LTT.Keyword)) {
            luaParse.checkSemicolons()
            luaParse.tokenIndex++;
        } else {
            return false
        }
        token = luaParse.getTokenByIndex(luaParse.tokenIndex, "uncomplete code block")
        if (luaParse.isError) return false
        if (luaParse.Compare('end', token, LTT.Keyword) ||
            luaParse.Compare('elseif', token, LTT.Keyword) ||
            luaParse.Compare('else', token, LTT.Keyword)
        ) {
            return true
        } else {
            luaParse.setError(token, "no more other tokens after 'break'")
            return false
        }
    }

}