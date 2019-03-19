import { LFrag, LToken, LVT, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
import { format } from 'util'

export class LuaFunctionCall {

    private lp: LParse;

    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
     * @isSemicolons 是否检查 ;
     * @isForFunction 是否为 for 循环  ipairs pairs
     * @isLackM 是否缺少括号
     */
    public check(luaInfo: LFrag, isSemicolons: boolean, isForFunction: boolean, isLackM: boolean = false): void {
        luaInfo.type = LFT.FuncCall;

        // luaInfo.setEndToken(this.lp.getCurrentToken(null))
        //判断是否为没有参数的方法
        var token: LToken = this.lp.getNextToken("uncomplete function call")
        if (this.lp.isError) return

        if (isForFunction == false && this.lp.Compare(')', token, LTT.Punctuator)) {
            luaInfo.getTopLuaInfo().setEndToken(token)
            luaInfo.getTopLuaInfo().isNextCheck = false
            this.checkNext(luaInfo);
            if (isSemicolons) {
                this.lp.checkSemicolons();
            }
            luaInfo.getTopLuaInfo().setEndToken(token)

            return

        }
        var parameterIndex: number = 0;
        while (true) {
            this.checkParameter(isForFunction, luaInfo, parameterIndex)
            parameterIndex++;
            if (this.lp.isError) return

            var token: LToken = this.lp.getNextToken("uncomplete function call")
            if (isForFunction) {
                if (this.lp.Compare(')', token, LTT.Punctuator)) {
                    if (!isForFunction) {
                        luaInfo.getTopLuaInfo().setEndToken(this.lp.getUpToken())
                    }
                    return
                } else {
                    this.lp.setError(token, luaInfo.name + "should be ')'")
                    return
                }

            }
            if (this.lp.Compare(',', token, LTT.Punctuator)) {

                this.lp.tokenIndex++;
                continue
            } else if (this.lp.Compare(')', token, LTT.Punctuator)) {
                if (!isForFunction) {
                    luaInfo.getTopLuaInfo().setEndToken(token)
                }
                luaInfo.getTopLuaInfo().isNextCheck = false
                this.checkNext(luaInfo)
                if (isSemicolons) {
                    this.lp.checkSemicolons();
                }
                return
            }
        }
    }


    public checkNext(luaInfo: LFrag) {
        var nextToken: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null);
        if (nextToken) {
            if (this.lp.Compare('.', nextToken, LTT.Punctuator)) {
                this.lp.tokenIndex++;
                var newLuaInfo: LFrag = new LFrag(luaInfo.startToken)
                luaInfo.setNextLuaInfo(newLuaInfo)
                nextToken = this.lp.getNextToken("uncomplete code block")
                if (this.lp.isError) return;
                if (nextToken.type != LTT.Identifier) {
                    this.lp.setError(nextToken, "unexpected token(1007)")
                    return;
                } else {

                }

                this.lp.luaChuckInfo.check(newLuaInfo, true)
                var endToken: LToken = this.lp.getCurrentToken(null)

                if (this.lp.isError) return
                var token: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null)
                if (token == null) return
                if (this.lp.isError) return
                if (this.lp.Compare('=', token, LTT.Punctuator)) {
                    this.lp.tokenIndex += 2;
                    this.lp.luaSetValue.check(true, true, [newLuaInfo])
                    newLuaInfo.startToken = newLuaInfo.getTopLuaInfo().startToken
                    newLuaInfo.setEndToken(endToken)
                } else {
                    newLuaInfo.startToken = newLuaInfo.getTopLuaInfo().startToken
                    newLuaInfo.setEndToken(endToken)
                }
            } else if (this.lp.Compare('[', nextToken, LTT.Punctuator)) {
                this.lp.tokenIndex += 2;
                this.lp.luaValidateBracket_G.check(luaInfo, true)
            }
            else if (this.lp.Compare('(', nextToken, LTT.Punctuator)) {

                this.lp.tokenIndex++;
                this.lp.functionCall.check(luaInfo, true, false);
            }
            else if (this.lp.Compare(':', nextToken, LTT.Punctuator)) {
                this.lp.tokenIndex += 2;
                var newLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
                luaInfo.setNextLuaInfo(newLuaInfo);
                this.lp.luaChuckInfo.checkModuleFunctionCall(newLuaInfo, true)

            } else {
                //this.setLuaFunctionCall(luaInfo)
            }
            // else if (this.lp.consume('..', nextToken, TokenTypes.Punctuator)) {
            //      this.lp.tokenIndex+= 2;
            //     this.lp.luaSetValue.check(true,true)
            // }
        } else {
            //  this.setLuaFunctionCall(luaInfo)
        }
    }

    public checkParameter(isForFunction: boolean, parent: LFrag, parameterIndex: number): boolean {
        var luaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
        //检查是否为一元
        var luainfos: Array<LFrag> = new Array<LFrag>()
        while (true) {
            var nextLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
            luainfos.push(nextLuaInfo)
            if (!isForFunction) {
                this.lp.luaCheckUnary.check(nextLuaInfo);
            }
            this.lp.luaChuckInfo.check(nextLuaInfo, false)
            if (nextLuaInfo.type != LFT.Function) {
                nextLuaInfo.setEndToken(this.lp.getCurrentToken(null))
            } else {
                //
                // nextLuaInfo
                LParse.ins.fileMgr.addSymbol(nextLuaInfo, this.lp.getUpToken(),
                    this.lp.getCurrentToken(null), format("Anonymous(%d:%d)", nextLuaInfo.startToken.line, nextLuaInfo.startToken.lineStart))
            }
            if (this.lp.isError) return null
            if (isForFunction) {
                if (luaInfo.type != LFT.FuncCall &&
                    luaInfo.type != LFT.Field &&
                    luaInfo.type != LFT.Table) {
                    this.lp.setError(this.lp.getCurrentToken(null), parent.name + "wrong token")
                    return false
                } else {
                    return true
                }
            }
            var nextToken: LToken = this.lp.getNextToken(null);
            if (nextToken == null) {
                this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                return
            }
            //验证是否为括号 ]
            //判断二元
            if (this.lp.luaValidateOperator.check(nextToken)) {
                this.lp.tokenIndex++;
                nextLuaInfo.operatorToken = nextToken
                continue
            }
            else {
                this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
                this.lp.tokenIndex--;
                return
            }
        }
    }

}
