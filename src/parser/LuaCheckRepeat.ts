import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
export class LuaCheckRepeat {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
     * 检查if 语句
     */
    public check(): boolean {

        var token: LToken = this.lp.getCurrentToken(null)
        if (token == null) return true
        if (this.lp.Compare('repeat', token, LTT.Keyword)) {
            var luaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
            this.lp.tokenIndex++;

            var returnValue: any = this.lp.setLuaInfo(luaInfo,
                function (luaParse: LParse): any {

                    var token: LToken = luaParse.getTokenByIndex(luaParse.tokenIndex, "uncomplete code block")
                    if (luaParse.isError) return false
                    if (luaParse.Compare('until', token, LTT.Keyword)) {
                        var ul: LFrag = new LFrag(token)
                        luaParse.tokenIndex++;
                        luaParse.luaSetValue.check(true, true, null)
                        if (luaParse.isError) return false

                        luaParse.tokenIndex++;

                        return true
                    }
                    return false
                }, null)
            return returnValue

        } else return false

    }
}