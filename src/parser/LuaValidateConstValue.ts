import { LFrag, LVT, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
/**验证 是否为一个可以复制的 token */
export class LuaValidateConstValue {
  private lp: LParse;

  constructor(luaparse: LParse) {
    this.lp = luaparse;
  }
  /**
* 验证是否是一个可以符值的token
*/
  public check(token: LToken, luaInfo: LFrag): boolean {

    if (token.type == LTT.BooleanLiteral) {
      if (luaInfo.isVar == true) {
        this.lp.setError(token, "identifier can not be boolean")
        return
      }
      luaInfo.type = LFT.BOOLEAN
      luaInfo.valueType = LVT.BOOL
      return true
    }
    else if (token.type == LTT.NilLiteral) {
      if (luaInfo.isVar == true) {
        this.lp.setError(token, "identifier can not be nil")
        return
      }
      luaInfo.type = LFT.NIL
      luaInfo.valueType = LVT.NIL
      return true
    }
    else if (token.type == LTT.NumericLiteral) {
      if (luaInfo.isVar == true) {
        this.lp.setError(token, "identifier can not be number")
        return
      }
      luaInfo.valueType = LVT.NUMBER
      luaInfo.type = LFT.Number
      return true
    }
    else if (token.type == LTT.StringLiteral) {
      if (luaInfo.isVar == true) {
        this.lp.setError(token, "identifier can not be string")
        return
      }
      luaInfo.valueType = LVT.STRING

      luaInfo.type = LFT.STRING
      return true
    }
    else if (token.type == LTT.VarargLiteral) {
      if (luaInfo.isVar == true) {
        this.lp.setError(token, "identifier can not be ...")
        return
      }
      luaInfo.valueType = LVT.ANY
      luaInfo.type = LFT.Vararg
      return true
    }
    else if (token.type == LTT.Identifier) {
      luaInfo.type = LFT.Field
      luaInfo.valueType = LVT.ANY
      return true
    }
    else {
      if (!this.lp.Compare('(', token, LTT.Punctuator)) {
        this.lp.setError(this.lp.getCurrentToken(null), "unexpected token(1001)");
        this.lp.tokenIndex--;

      }
      return false
    }

  }
}