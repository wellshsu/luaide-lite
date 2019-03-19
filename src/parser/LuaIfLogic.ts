import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
export class LuaIfLogic {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
     * 检查if 语句
     * isElseIf 是否检查 elseif 默认为false
     */
    public check(parent: LFrag, isIf: boolean, isElseIf: boolean, isElse: boolean, checkBreak: Function): boolean {

        //创建一个luaInfo 标识未 ifLuaInfo

        var token: LToken = this.lp.getCurrentToken("uncomplete code block")
        var luaInfo: LFrag = new LFrag(token)
        if (this.lp.isError) return
        var returnValue: any = false
        if (this.lp.Compare('if', token, LTT.Keyword)) {
            luaInfo.type = LFT.IF
            luaInfo.name = token.value
            returnValue = this.checkIfAndElseIF(luaInfo, token, checkBreak)

        }
        else if (isElseIf == true && this.lp.Compare('elseif', token, LTT.Keyword)) {
            luaInfo.type = LFT.ELSEIF
            luaInfo.name = token.value
            returnValue = this.checkIfAndElseIF(luaInfo, token, checkBreak)
        } else if (isElse == true && this.lp.Compare('else', token, LTT.Keyword)) {
            luaInfo.type = LFT.ELSE
            luaInfo.name = token.value
            returnValue = this.checkLuaInfos(luaInfo, false, false, checkBreak);
        }
        else {
            return false
        }

        if (returnValue == "end") {
            this.lp.tokenIndex++;
            return true
        } else {
            if (returnValue == "elseif") {
                var re = this.check(luaInfo, false, true, true, checkBreak)
                if (this.lp.isError) return false
                if (re == false) {

                    this.lp.setError(this.lp.getCurrentToken(null), luaInfo.name + " uncomplete code block")
                    return false
                }
                return re
            } else if (returnValue == "else") {
                this.lp.tokenIndex++;
                var revalue = this.checkLuaInfos(luaInfo, false, false, checkBreak)
                if (this.lp.isError) return false
                if (revalue == "end") {
                    this.lp.tokenIndex++;
                    return true
                } else {
                    this.lp.setError(this.lp.getCurrentToken(null), luaInfo.name + " uncomplete code block")
                    return false
                }

            } else {
                if (this.lp.isError) return false
                this.lp.setError(this.lp.getLastToken(), luaInfo.name + " uncomplete code block")
                return false
            }
        }
    }

    public checkIfAndElseIF(luaInfo: LFrag, token: LToken, checkBreak: Function): any {
        this.lp.tokenIndex++;
        this.lp.luaSetValue.check(false, false, null)
        if (this.lp.isError) return false
        var thenToken = this.lp.getNextToken("missing 'then'")
        if (this.lp.isError) return false
        if (!this.lp.Compare('then', thenToken, LTT.Keyword)) {
            this.lp.setError(thenToken, "should be 'then'")
            if (this.lp.isError) return false
        }
        this.lp.tokenIndex++;
        return this.checkLuaInfos(luaInfo, true, true, checkBreak);
    }

    public checkLuaInfos(LuaInfo: LFrag, isCheckElseIf: boolean, ischeckElse: boolean, checkBreak: Function): any {
        var returnValue: any = this.lp.setLuaInfo(LuaInfo,
            function (luaParse: LParse): any {
                var token: LToken = luaParse.getTokenByIndex(luaParse.tokenIndex, "uncomplete code block")
                if (luaParse.isError) return false
                if (luaParse.Compare('end', token, LTT.Keyword)) {
                    luaParse.checkSemicolons()
                    return "end"
                } else if (isCheckElseIf == true && luaParse.Compare('elseif', token, LTT.Keyword)) {
                    return "elseif"
                } else if (ischeckElse == true && luaParse.Compare('else', token, LTT.Keyword)) {
                    return "else"
                }
                return false
            }, checkBreak)
        return returnValue
    }

}