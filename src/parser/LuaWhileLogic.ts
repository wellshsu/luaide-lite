import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
export class LuaWhileLogic {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
     * 检查if 语句
     */
    public check(parent: LFrag): boolean {
        var token: LToken = this.lp.getCurrentToken("uncomplete code block")
        if (this.lp.Compare('while', token, LTT.Keyword)) {
            this.lp.tokenIndex++;
            var luaInfo: LFrag = new LFrag(token)
            luaInfo.type = LFT.WHILE
            //先判断表达式  再判断 do
            this.lp.luaSetValue.check(true, false, null)
            if (this.lp.isError) return false
            var doToken: LToken = this.lp.getNextToken("uncomplete code block")
            if (this.lp.isError) return false
            if (this.lp.Compare('do', doToken, LTT.Keyword)) {
                this.lp.tokenIndex++;
                var isEnd: boolean = this.lp.setLuaInfo(luaInfo, function (luaParse: LParse) {
                    var token: LToken = luaParse.getTokenByIndex(luaParse.tokenIndex, "uncomplete code block")
                    if (luaParse.isError) return false
                    if (luaParse.Compare('end', token, LTT.Keyword)) {
                        luaParse.tokenIndex++;
                        luaParse.checkSemicolons()
                        return true
                    }
                    return false
                }, this.lp.luaForLogic.checkBrreak)
                if (this.lp.isError) return false
                if (isEnd) {
                    return true
                } else {
                    this.lp.setError(this.lp.getLastToken(), "missing 'end' after 'while'")
                    return false
                }

            } else {
                this.lp.setError(doToken, "should be 'do'")
                return false
            }
        } else
            return false
    }
}