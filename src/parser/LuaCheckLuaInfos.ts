import { LFrag, LVT, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
import { ExtMgr } from "../context/ExtMgr"

/**验证 检查luainfo 集合 是否合法 */
export class LuaCheckLuaInfos {

    private lp: LParse;

    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    public check(
        luaInfos: Array<LFrag>, parentLuaInfo: LFrag) {
        if (!ExtMgr.luaOperatorCheck) {
            return
        }
        if (luaInfos.length == 1) {
            var luaInfo: LFrag = luaInfos[0]
            this.checkLuaInfoValue(luaInfo)



            if (this.lp.isError) return
            // if(luaInfo.valueType == LuaInfoTypeValue.STRING)
            // {
            //     parentLuaInfo.localLuaInfo.push(luaInfo)

            // }

            if (luaInfo.operatorToken != null) {
                this.lp.setError(luaInfo.operatorToken, "unexpected token(1021)")
                return
            }
            return
        }

        for (var i = 0; i < luaInfos.length; i++) {
            var luaInfo: LFrag = luaInfos[i]

            this.checkLuaInfoValue(luaInfo)
            if (this.lp.isError) return
            var token: LToken = luaInfo.operatorToken
            if (token == null) {
                return
            }

            var value: string = token.value
            if (
                value == '+' ||
                value == '-' ||
                value == '*' ||
                value == '/' ||
                value == '^' ||
                value == '+' ||
                value == '%' ||
                value == '&' ||
                value == '<<' ||
                value == '>>' ||
                value == '|' ||
                value == '~'
            ) {
                if (luaInfo.valueType != LVT.NUMBER &&
                    luaInfo.valueType != LVT.ANY
                ) {

                    this.lp.setError(token, "only number can be operated")
                    return
                } else {

                    //判断下一个是否为 number || any
                    if (i + 1 < luaInfos.length) {
                        var nextLuaInfo: LFrag = luaInfos[i + 1]
                        this.checkLuaInfoValue(nextLuaInfo)
                        if (this.lp.isError) return

                        if (nextLuaInfo.valueType != LVT.NUMBER &&
                            nextLuaInfo.valueType != LVT.ANY) {
                            this.lp.setError(token, "only number can be operated")
                            return
                        }
                    }
                }
            }
            else if (
                value == '>' ||
                value == '<' ||
                value == '>=' ||
                value == '<='
            ) {
                if (luaInfo.valueType != LVT.NUMBER &&
                    luaInfo.valueType != LVT.STRING &&
                    luaInfo.valueType != LVT.ANY
                ) {

                    this.lp.setError(token, "only number can be operated")
                    return
                } else {

                    //判断下一个是否为 number || any
                    if (i + 1 < luaInfos.length) {
                        var nextLuaInfo: LFrag = luaInfos[i + 1]
                        this.checkLuaInfoValue(nextLuaInfo)
                        if (this.lp.isError) return
                        if (nextLuaInfo.valueType != LVT.NUMBER &&
                            nextLuaInfo.valueType != LVT.ANY &&
                            nextLuaInfo.valueType != LVT.STRING) {

                            this.lp.setError(token, "only number can be operated")
                            return
                        }
                    }
                }
            }

            else if (value == '..') {
                if (luaInfo.valueType == LVT.BOOL) {
                    this.lp.setError(token, "boolean 不能 用于字符串连接")
                    return
                } else {

                    if (i + 1 < luaInfos.length) {
                        var nextLuaInfo: LFrag = luaInfos[i + 1]
                        if (nextLuaInfo.valueType == LVT.BOOL) {
                            this.lp.setError(token, "boolean 不能 用于字符串连接")
                            return
                        }
                    }
                }
            }
            else if (
                value == '==' ||
                value == '~=') {
                //正确的 不需要处理

            }
            else if (
                value == 'and' ||
                value == 'or'
            ) {
                //正确的 不需要处理
            }
        }
    }
    public checkLuaInfoValue(luaInfo: LFrag) {

        var valueType: LVT = null
        var unarys: Array<LToken> = luaInfo.unarys;
        if (unarys.length == 0) {
            // luaInfo.valueType = LuaInfoTypeValue.ANY
            return
        }
        var length: number = unarys.length - 1
        while (length >= 0) {

            var token: LToken = unarys[length]
            if (valueType == null) {
                if (this.lp.Compare('#', token, LTT.Punctuator)) {
                    if (luaInfo.type == LFT.FuncCall ||
                        luaInfo.type == LFT.Field ||
                        luaInfo.type == LFT.Vararg ||
                        luaInfo.type == LFT.Bracket_M

                    ) {
                        valueType = LVT.NUMBER
                    } else {
                        this.lp.setError(token, "不能计算长度")
                        return
                    }
                }
                else if (this.lp.Compare('-', token, LTT.Punctuator)) {
                    if (luaInfo.type == LFT.FuncCall ||
                        luaInfo.type == LFT.Field ||
                        luaInfo.type == LFT.Number ||
                        luaInfo.type == LFT.Vararg ||
                        luaInfo.type == LFT.Bracket_M
                    ) {
                        valueType = LVT.NUMBER
                    } else {
                        this.lp.setError(token, "不能计算长度")
                        return
                    }
                }
                else if (this.lp.Compare('not', token, LTT.Keyword)) {
                    if (luaInfo.type == LFT.FuncCall ||
                        luaInfo.type == LFT.Field ||
                        luaInfo.type == LFT.BOOLEAN ||
                        luaInfo.type == LFT.STRING ||
                        luaInfo.type == LFT.NIL ||
                        luaInfo.type == LFT.Vararg ||
                        luaInfo.type == LFT.Number ||
                        luaInfo.type == LFT.Bracket_M
                    ) {
                        valueType = LVT.BOOL
                    } else {
                        this.lp.setError(token, "不能转换为 boolean")
                        return
                    }
                }
            } else {
                if (this.lp.Compare('#', token, LTT.Punctuator)) {
                    this.lp.setError(token, "不能计算长度")
                    return
                }
                else if (this.lp.Compare('-', token, LTT.Punctuator)) {
                    if (valueType == LVT.NUMBER ||
                        luaInfo.type == LFT.Bracket_M) {

                    }
                    else {

                        this.lp.setError(token, "非数字不能为 负数")
                        return
                    }
                }
                else if (this.lp.Compare('not', token, LTT.Keyword)) {
                    valueType = LVT.BOOL
                }
            }

            length--;

            // if (this.lp.consume('#', token, TokenTypes.Punctuator)) {
            //     if (valueType == null) {
            //         if (luaInfo.type == LuaInfoType.FunctionCall ||
            //             luaInfo.type == LuaInfoType.Field) {
            //             valueType = LuaInfoTypeValue.NUMBER
            //         } else {
            //             this.lp.setError(token, "不能计算长度")
            //             return
            //         }
            //     } else if (valueType == LuaInfoTypeValue.ANY) {
            //         valueType = LuaInfoTypeValue.NUMBER
            //     } else {
            //         this.lp.setError(token, "不能计算长度")
            //         return
            //     }

            // }
            // else if (this.lp.consume('-', token, TokenTypes.Punctuator)) {

            // }
        }
        luaInfo.valueType = valueType
    }

}



