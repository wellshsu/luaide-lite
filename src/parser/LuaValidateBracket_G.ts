import { LFrag, LVT, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
export class LuaValidateBracket_G {
  private lp: LParse;

  constructor(luaparse: LParse) {
    this.lp = luaparse;
  }

  /**验证中括号 */
  public check(luaInfo: LFrag, isNext: boolean): LFrag {
    var exToken = this.lp.getCurrentToken("uncomplete code block");
    if (exToken == null) return null;
    if (this.lp.Compare(']', exToken, LTT.Punctuator)) {
      this.lp.setError(exToken, "can not keep space in '[]'");
      return null;
    }
    var luainfos: Array<LFrag> = new Array<LFrag>()
    while (true) {
      var nextLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
      luainfos.push(nextLuaInfo)
      this.lp.luaSetValue.check(false, false, [nextLuaInfo])
      if (this.lp.isError) return null
      var nextToken: LToken = this.lp.getNextToken("uncomplete code block");
      if (this.lp.isError) return
      //验证是否为括号 ]
      //判断二元
      if (this.lp.Compare(']', nextToken, LTT.Punctuator)) {
        //这里检查表达式的合法性
        this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
        luaInfo.bracket_Gs = luainfos;
        luaInfo.valueType = LVT.ANY;
        if (!isNext) return
        nextToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null);
        if (nextToken) {
          if (this.lp.Compare('.', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex++;
            var newLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
            nextToken = this.lp.getNextToken("uncomplete code block")
            if (this.lp.isError) return;
            if (nextToken.type != LTT.Identifier) {
              this.lp.setError(nextToken, "unexpected token(1003)")
              return;
            } else {
            }
            luaInfo.setNextLuaInfo(newLuaInfo);
            this.lp.luaChuckInfo.check(newLuaInfo, true)
            if (this.lp.isError) return
            return;
          } else if (this.lp.Compare('[', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex += 2;
            this.lp.luaValidateBracket_G.check(luaInfo, isNext)
            break;
          }
          else if (this.lp.Compare('(', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex++;
            this.lp.functionCall.check(luaInfo, true, false);
            break;
          }
          else if (this.lp.Compare(':', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex += 2;
            if (luainfos.length == 1) {
              this.lp.luaChuckInfo.checkModuleFunctionCall(luaInfo, true)
            } else {
              this.lp.luaChuckInfo.checkModuleFunctionCall(luaInfo, true)
            }
            luaInfo.type = LFT.FuncCall;
            return;
          } else if (this.lp.Compare('=', nextToken, LTT.Punctuator)) {
            luaInfo.getTopLuaInfo().isNextCheck = true
            return
          } else return
        } else {
          return
        }
      }
      if (this.lp.luaValidateOperator.check(nextToken)) {
        this.lp.tokenIndex++;
        nextLuaInfo.operatorToken = nextToken
        continue
      } else {
        this.lp.setError(nextToken, "wrong token")
        return
      }
    }
  }
}