import { LFrag, LToken, LVT, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
export class LuaSetValue {
    private lp: LParse;
    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }
    //value 只能是  
    /**是否检查分号  */
    public check(isSemicolons: boolean, isComma: boolean, leftLuaInfos: Array<LFrag>, index: number = 0): Array<LFrag> {
        var luaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))

        //检查是否为一元
        var luainfos: Array<LFrag> = new Array<LFrag>()
        while (true) {
            var nextLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
            luainfos.push(nextLuaInfo)
            this.lp.luaCheckUnary.check(nextLuaInfo);
            nextLuaInfo.startToken = this.lp.getCurrentToken(null);
            this.lp.luaChuckInfo.check(nextLuaInfo, isSemicolons)

            if (this.lp.isError) return null
            if (nextLuaInfo.type == LFT.Function) {
                if (nextLuaInfo.unarys.length == 0) {
                    nextLuaInfo.valueType = LVT.Function
                    if (leftLuaInfos != null && index <= leftLuaInfos.length - 1) {
                        var linfo: LFrag = leftLuaInfos[index];
                        linfo.params = nextLuaInfo.params;
                        linfo.type = LFT.Function;
                    }
                } else {
                    this.lp.setError(nextLuaInfo.unarys[0], "unexcepted tokens before 'function'")
                }
            }

            if (nextLuaInfo.type == LFT.Table) {
                nextLuaInfo.valueType = LVT.Table
                if (leftLuaInfos != null && index <= leftLuaInfos.length - 1) {
                    var linfo: LFrag = leftLuaInfos[index];
                    linfo.tableFileds = nextLuaInfo.tableFileds;
                }
                //table 直接返回
            }
            var nextToken: LToken = this.lp.getNextToken(null);
            if (nextToken == null) {
                this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                if (nextLuaInfo.type != LFT.FuncCall
                ) {
                    nextLuaInfo.setEndToken(this.lp.getUpToken())
                }
                return luainfos
            }
            //验证是否为括号 ]
            //判断二元
            if (this.lp.luaValidateOperator.check(nextToken)) {
                nextLuaInfo.setEndToken(this.lp.getUpToken())
                this.lp.tokenIndex++;
                nextLuaInfo.operatorToken = nextToken
                continue
            }
            else if (this.lp.Compare(',', nextToken, LTT.Punctuator)) {
                if (leftLuaInfos != null && index > leftLuaInfos.length - 1) {
                    this.lp.setError(nextToken, "unnecessary field assignment");
                    return
                }
                nextLuaInfo.setEndToken(this.lp.getUpToken())
                if (isComma) {
                    this.lp.tokenIndex++;
                    this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                    if (this.lp.isError) return
                    this.check(isSemicolons, isComma, leftLuaInfos, ++index);
                    return luainfos
                } else {
                    this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                    this.lp.tokenIndex--;
                    return luainfos
                }
            }
            else if (this.lp.Compare(';', nextToken, LTT.Punctuator)) {
                this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                if (isSemicolons == false) {
                    this.lp.tokenIndex--;
                }
                return luainfos
            }
            else {
                if (nextLuaInfo.type == LFT.Field && nextToken.type == LTT.StringLiteral) {
                    var upToken: LToken = this.lp.getUpToken();
                    nextLuaInfo.type = LFT.FuncCall
                } else {
                    this.lp.tokenIndex--;
                }
                this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                if (nextLuaInfo.type != LFT.Bracket_M &&
                    nextLuaInfo.getLastLuaInfo().type != LFT.FuncCall
                ) {
                    nextLuaInfo.setEndToken(this.lp.getCurrentToken(null))
                }
                return luainfos
            }
        }
    }

}