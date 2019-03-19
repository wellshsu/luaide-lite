import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'

/**验证 return */
export class LuaCheckReturn {
  private lp: LParse;

  constructor(luaparse: LParse) {
    this.lp = luaparse;
  }

  /**检查return */
  public check(luaInfo: LFrag, checkEnd: Function, isCheckBreak: boolean) {
    var token = this.lp.getCurrentToken(null)
    if (token == null) return false

    if (this.lp.Compare('return', token, LTT.Keyword)) {
      var isReturn = this.lp.checkSemicolons()
      var returnValue = false
      if (isReturn) {
        this.lp.tokenIndex++;
        if (checkEnd != null) {
          returnValue = checkEnd(this.lp)
        }

        if (this.lp.isError) return false
        if (returnValue == false) {
          this.lp.setError(this.lp.getNextToken(null), "return unnecessary tokens")
          return false
        } else {
          return returnValue
        }
      } else {
        this.lp.tokenIndex++;
        if (checkEnd != null) {
          returnValue = checkEnd(this.lp)
          if (this.lp.isError) return false
          if (returnValue != false) {
            return returnValue
          }
        }
        this.lp.luaSetValue.check(true, true, null)
        if (this.lp.isError) return false
        this.lp.tokenIndex++;
        if (checkEnd != null) {
          returnValue = checkEnd(this.lp)
        } else {
          returnValue = true
        }
        if (this.lp.isError) return false
        if (returnValue == false) {
          this.lp.setError(this.lp.getCurrentToken(null), "return unnecessary tokens")
          return false
        } else {
          return returnValue
        }
      }
    } else return false
  }

}