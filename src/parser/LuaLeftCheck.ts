import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
export class LuaLeftCheck {
    private lp: LParse;

    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**是否为 多变量声明  */
    public isMultipleVariables: boolean = false
    public luaInfos: Array<LFrag>;
    public parent: LFrag;
    public isLocal: boolean;

    public check(parent: LFrag) {
        this.luaInfos = new Array<LFrag>();
        this.isLocal = false;
        this.isMultipleVariables = false;
        this.parent = parent;
        //创建leftLuaInfo
        var toekn: LToken = this.lp.getCurrentToken(null)

        var currentLuaInfo: LFrag = new LFrag(toekn)
        this.isLocal = this.checkIsLocal(currentLuaInfo)
        if (this.lp.isError) return
        currentLuaInfo.isLocal = this.isLocal;
        currentLuaInfo.isVar = true
        if (this.isLocal) {
            currentLuaInfo.startToken = this.lp.getCurrentToken(null);
            currentLuaInfo.startToken.comments = this.lp.getUpToken().comments;
        }
        this.luaInfos.push(currentLuaInfo)
        this.checkLeftExpression(currentLuaInfo, new Array<LFrag>())
        currentLuaInfo = null
    }

    /**
     * 是否是local
     */
    public checkIsLocal(luaInfo: LFrag): boolean {
        var token = this.lp.getCurrentToken("uncomplete code block");
        if (this.lp.isError) return false
        var isLocal: boolean = this.lp.Compare('local', token, LTT.Keyword)
        if (isLocal) {
            this.lp.tokenIndex++;
            luaInfo.setComments(token.comments)
        }
        return isLocal;
    }

    /**
     * 检查 变量声明
     * @isIdentifier 是否必须为 TokenTypes.Identifier 类型
     */
    public checkLeftExpression(leftLuaInfo: LFrag, leftLuaInfos: Array<LFrag>) {
        while (true) {
            this.lp.luaChuckInfo.check(leftLuaInfo, true)
            if (this.lp.isError) return
            //方法调用直接退出
            if (leftLuaInfo.type == LFT.FuncCall && leftLuaInfo.endToken && leftLuaInfo.endToken.next &&
                leftLuaInfo.endToken.next.value == "=" && leftLuaInfo.endToken.next.type == LTT.Punctuator) {
                return
            }
            if (!leftLuaInfo.isNextCheck) {
                return;
            }
            // 复杂数据赋值错误
            if (leftLuaInfo && leftLuaInfo.startToken && leftLuaInfo.startToken.next &&
                leftLuaInfo.startToken.next.value == ":" && leftLuaInfo.startToken.next.type == LTT.Punctuator) {
                var current: LFrag
                var temp: LFrag = leftLuaInfo.getNextLuaInfo()
                while (temp) {
                    current = temp
                    temp = temp.getNextLuaInfo()
                }
                if (current) {
                    if (current.endToken) {
                        this.lp.tokenIndex = current.endToken.index
                    } else if (current.startToken) {
                        var temp2: LToken = current.startToken
                        while (!(temp2 && temp2.value == "=" && temp2.type == LTT.Punctuator)) {
                            temp2 = temp2.next
                        }
                        if (temp2) {
                            this.lp.tokenIndex = temp2.index - 1
                        }
                    }
                }
            }
            var token: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null)
            if (token == null) {
                if (leftLuaInfo.isLocal == false) {
                    var last: LFrag = leftLuaInfo.getLastLuaInfo();
                    // leftLuaInfo.type == LuaInfoType.Function
                    var type = leftLuaInfo.type
                    if (type != LFT.AnonymousFunc) {
                        this.lp.setError(leftLuaInfo.startToken, "not assign yet(1103)")
                    }
                }
                leftLuaInfo.setEndToken(this.lp.getCurrentToken(null))
                return
            }
            this.lp.tokenIndex++;
            //赋值
            if (this.lp.Compare('=', token, LTT.Punctuator)) {
                var endToken: LToken = this.lp.getUpToken()

                leftLuaInfos.push(leftLuaInfo)
                this.lp.tokenIndex++;
                //设置value
                this.lp.luaSetValue.check(true, true, leftLuaInfos)
                if (leftLuaInfo.type == LFT.Function) {
                    this.lp.fileMgr.addFunc(leftLuaInfo, endToken, this.lp.getUpToken())
                } else {
                    leftLuaInfo.setEndToken(endToken);
                }
                return
            }
            else if (this.lp.Compare(',', token, LTT.Punctuator)) {

                leftLuaInfo.setEndToken(this.lp.getUpToken())
                leftLuaInfos.push(leftLuaInfo)
                this.lp.tokenIndex++;
                this.isMultipleVariables = true
                var currentLuaInfo: LFrag = new LFrag(this.lp.getTokenByIndex(this.lp.tokenIndex, null))
                currentLuaInfo.isLocal = this.isLocal
                currentLuaInfo.isVar = true
                currentLuaInfo.isMultipleVariables = true
                this.luaInfos.push(currentLuaInfo)
                this.checkLeftExpression(currentLuaInfo, leftLuaInfos)
                return
            }
            else if (this.lp.Compare(';', token, LTT.Punctuator)) {
                // 多变量声明错误
                if (this.isLocal == false /*|| (this.isLocal && this.isMultipleVariables)*/) {
                    this.lp.setError(this.lp.getCurrentToken(null), "not assign yet(1102)")
                }
                leftLuaInfo.setEndToken(this.lp.getUpToken())
                // this.lp.tokenIndex++;
                return
            }
            else {
                if (this.isLocal == false) {
                    if (token.type == LTT.StringLiteral) {
                        return
                    }
                    else if (!this.lp.Compare('=', token, LTT.Punctuator)) {
                        if (token.type == LTT.Identifier) {
                            this.lp.setError(this.lp.getTokenByIndex(this.lp.tokenIndex, null), "guess this is a function, attach '( )' ?")
                        }
                        // else if (token.type == LTT.Keyword && token.last && token.last.type == LTT.Identifier) {

                        // }
                        else {
                            this.lp.setError(this.lp.getTokenByIndex(this.lp.tokenIndex - 1, null), "not assign yet(1101)")
                        }
                        return false
                    }
                }
                leftLuaInfo.setEndToken(this.lp.getUpToken())
                this.lp.tokenIndex--;
                return
            }
        }
    }

    public checkLastLuaInfoType(luaInfo: LFrag, type: LFT): boolean {
        while (true) {
            if (luaInfo.getNextLuaInfo() == null) {
                if (luaInfo.type == type) return true
                else return false
            } else {
                luaInfo = luaInfo.getNextLuaInfo();
            }
        }
    }
}