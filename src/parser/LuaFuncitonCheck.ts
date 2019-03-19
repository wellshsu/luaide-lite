import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
import { ExtMgr } from "../context/ExtMgr"
export class LuaFuncitonCheck {
    private lp: LParse;

    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
     * 检查if 语句
     */
    public check(): boolean {

        var functionToken: LToken = this.lp.getCurrentToken("uncomplete code block")
        if (this.lp.isError) return;
        if (this.lp.Compare('function', functionToken, LTT.Keyword)) {

            return this.checkGlobalFunction(functionToken);

        } else {
            if (this.checkIsLocal()) {
                var functionToken1: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete code block");
                if (this.lp.Compare('function', functionToken1, LTT.Keyword)) {
                    this.lp.tokenIndex++;

                    return this.checkLocalFunction(null, functionToken.comments);

                }
            }
        }
        return false
    }

    public currentFunLuaInfo: LFrag;
    public checkGlobalFunction(functionToken: LToken): boolean {

        var luaInfo: LFrag = new LFrag(this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "un complete 'function'"));
        luaInfo.type = LFT.Function;
        // luaInfo.name = "";
        if (functionToken.comments && functionToken.comments.length > 0) {
            luaInfo.startToken.comments = functionToken.comments
            luaInfo.setComments(functionToken.comments)
        }
        while (true) {

            var token: LToken = this.lp.getNextToken("uncomplete 'function'")
            if (token == null) {
                return false
            }
            // luaInfo.name = luaInfo.name + token.value;
            if (token.type == LTT.Identifier) {
                var nextToken: LToken = this.lp.getNextToken("uncomplete 'function'")
                if (this.lp.Compare('.', nextToken, LTT.Punctuator)) {
                    //  luaInfo.name = luaInfo.name+".";
                    continue;
                } else if (this.lp.Compare(':', nextToken, LTT.Punctuator)) {
                    // luaInfo.name = luaInfo.name +":"
                    if (ExtMgr.moduleFunNestingCheck) {
                        if (this.currentFunLuaInfo) {
                            this.lp.setError(token, "module can not be nested", this.currentFunLuaInfo.startToken);
                            return
                        }
                        this.currentFunLuaInfo = luaInfo
                        var funResult = this.checkLocalFunction(luaInfo, functionToken.comments);
                        this.currentFunLuaInfo = null
                        return funResult
                    }
                    else {
                        var funResult = this.checkLocalFunction(luaInfo, functionToken.comments);

                        return funResult
                    }

                } else if (this.lp.Compare('(', nextToken, LTT.Punctuator)) {
                    this.lp.tokenIndex--;
                    var endToken: LToken = this.lp.getCurrentToken(null);
                    var returnValue = this.lp.luaFunctionParse.check(luaInfo, true, null)
                    this.lp.fileMgr.addFunc(luaInfo, endToken, this.lp.getUpToken())
                    return returnValue
                }
                else {
                    this.lp.setError(token, "function unexpected token(1010)");
                    return false
                }
            } else {
                this.lp.setError(token, "function unexpected token(1009)");
                return false
            }
        }
    }

    public checkLocalFunction(luaInfo: LFrag, comments: Array<LComment>): boolean {
        var token: LToken = this.lp.getNextToken("uncomplete 'function'")
        if (luaInfo == null) {
            luaInfo = new LFrag(token);
            luaInfo.isLocal = true
            luaInfo.setComments(comments)
        }
        if (token.type == LTT.Identifier) {
            var endToken: LToken = this.lp.getCurrentToken(null)
            var result: boolean = this.lp.luaFunctionParse.check(luaInfo, true, null)
            this.lp.fileMgr.addFunc(luaInfo, endToken, this.lp.getUpToken())
            return result
        } else {
            this.lp.setError(token, "function (unexpected token(1008))");
            return false
        }
    }

    /**
     * 是否是local
     */
    public checkIsLocal(): boolean {
        var token = this.lp.getCurrentToken("uncomplete code block");
        if (this.lp.isError) return false
        var isLocal: boolean = this.lp.Compare('local', token, LTT.Keyword)
        return isLocal;
    }
}