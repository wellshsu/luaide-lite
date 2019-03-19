import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'

export class LuaTableParse {
    private lp: LParse;

    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    public check(luaInfo: LFrag) {
        luaInfo.type = LFT.Table;
        while (true) {
            var token: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'table'");
            if (this.lp.Compare('}', token, LTT.Punctuator)) {
                this.lp.tokenIndex++;
                return
            }
            if (this.lp.isError) return
            if (token.type == LTT.Identifier) {
                var nextToken: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 2, "uncomplete 'table'");
                if (this.lp.isError) return
                if (this.lp.Compare('=', nextToken, LTT.Punctuator)) {
                    var fluaInfo: LFrag = new LFrag(nextToken);
                    fluaInfo.name = token.value;
                    fluaInfo.endToken = nextToken;
                    var leftLuaInfos: Array<LFrag> = new Array<LFrag>();
                    leftLuaInfos.push(fluaInfo)
                    this.lp.tokenIndex += 3;
                    luaInfo.tableFileds.push(fluaInfo);
                    this.lp.luaSetValue.check(false, false, leftLuaInfos);
                } else {
                    this.lp.tokenIndex += 1;
                    this.lp.luaSetValue.check(false, false, null);
                }
            }
            else if (this.lp.Compare('[', token, LTT.Punctuator)) {
                this.lp.tokenIndex += 2;
                var startIndex: number = this.lp.tokenIndex;
                var newLuaInfo: LFrag = new LFrag(token)
                this.lp.luaValidateBracket_G.check(newLuaInfo, false)
                var endIndex: number = this.lp.tokenIndex;
                var nextToken: LToken = this.lp.getNextToken("uncomplete code block")
                if (this.lp.isError) return
                if (this.lp.Compare('=', nextToken, LTT.Punctuator)) {
                    if (endIndex - startIndex == 1) {
                        var token: LToken = this.lp.tokens[startIndex];
                        newLuaInfo.name = "[" + token.value + "]"
                        newLuaInfo.tableFiledType = 1;
                        luaInfo.tableFileds.push(newLuaInfo);
                    }
                    var leftLuaInfos: Array<LFrag> = new Array<LFrag>();
                    leftLuaInfos.push(newLuaInfo)
                    this.lp.tokenIndex += 1;
                    this.lp.luaSetValue.check(false, false, leftLuaInfos);
                } else {
                    this.lp.setError(nextToken, "missing '='")
                    return
                }
            }
            else {
                this.lp.tokenIndex += 1
                this.lp.luaSetValue.check(false, false, null)
            }
            token = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'table'");
            if (this.lp.Compare(',', token, LTT.Punctuator) || this.lp.Compare(';', token, LTT.Punctuator)) {
                this.lp.tokenIndex++;
                var endToken: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'table'");
                if (this.lp.Compare('}', endToken, LTT.Punctuator)) {
                    this.lp.tokenIndex++;
                    return
                } else {
                    continue;
                }
            }
            else if (token.last && token.last.last && this.lp.Compare('end', token.last.last, LTT.Keyword) &&
                (this.lp.Compare(',', token.last, LTT.Punctuator) || this.lp.Compare(';', token.last, LTT.Punctuator))) {
                // @Issue: 
                // d = {
                //     a = function()
                //     end;
                //     b = 2;
                // }
                var endToken: LToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, "uncomplete 'table'");
                if (this.lp.Compare('}', endToken, LTT.Punctuator)) {
                    this.lp.tokenIndex++;
                    return
                } else {
                    continue;
                }
            }
            else if (this.lp.Compare('}', token, LTT.Punctuator)) {
                this.lp.tokenIndex++;
                return
            } else {
                this.lp.setError(token, "unexpected token(1004) in table define")
                return
            }
        }
    }
}