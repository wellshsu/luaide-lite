import { LFrag, LToken, LVT, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
/**验证 ( */
export class LuaValidateBracket_M {
  private lp: LParse;

  constructor(luaparse: LParse) {
    this.lp = luaparse;
  }

  /**验证 小括号( */
  public check(luaInfo: LFrag): boolean {
    //缓存 一元运算符号
    // var unary: string = luaInfo.unary

    // luaInfo.unary = ""
    var exToken = this.lp.getCurrentToken("uncomplete code block");
    if (exToken == null) return false;
    if (this.lp.Compare(')', exToken, LTT.Punctuator)) {
      this.lp.setError(exToken, "can not keep space in '()'");

      return false
    }
    var luainfos: Array<LFrag> = new Array<LFrag>()
    while (true) {

      var nextLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
      luainfos.push(nextLuaInfo)
      this.lp.luaCheckUnary.check(nextLuaInfo);
      this.lp.luaChuckInfo.check(nextLuaInfo, false)

      if (this.lp.isError) return null
      var nextToken: LToken = this.lp.getNextToken("uncomplete code block");
      if (this.lp.isError) return
      //验证是否为括号 ]
      //判断二元
      if (this.lp.Compare(')', nextToken, LTT.Punctuator)) {
        //这里检查表达式的合法性

        this.lp.luaCheckLuaInfos.check(luainfos, luaInfo)
        nextLuaInfo.type = LFT.Field;
        nextLuaInfo.setEndToken(this.lp.getCurrentToken(null))
        luaInfo.valueType = LVT.ANY;
        luaInfo.type = LFT.Bracket_M

        nextToken = this.lp.getTokenByIndex(this.lp.tokenIndex + 1, null);
        if (nextToken) {
          if (this.lp.Compare('.', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex++;
            var newLuaInfo: LFrag = new LFrag(this.lp.getCurrentToken(null))
            nextToken = this.lp.getNextToken("uncomplete code block")
            if (this.lp.isError) return;
            if (nextToken.type != LTT.Identifier) {
              this.lp.setError(nextToken, "unexpected token(1002)")
              return;

            } else {

            }

            luaInfo.setNextLuaInfo(newLuaInfo);
            this.lp.luaChuckInfo.check(newLuaInfo, true)

            if (this.lp.isError) return
            return;
          } else if (this.lp.Compare('[', nextToken, LTT.Punctuator)) {
            this.lp.tokenIndex += 2;
            this.lp.luaValidateBracket_G.check(luaInfo, true)
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
            return
          } else return
        }
      }
      if (this.lp.luaValidateOperator.check(nextToken)) {
        nextLuaInfo.setEndToken(this.lp.getUpToken())
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