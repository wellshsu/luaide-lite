import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
/**验证 二元运算符号 */
export class LuaValidateOperator {
  private lp: LParse;

  constructor(luaparse: LParse) {
    this.lp = luaparse;
  }

  /**
 * 判断一个token 是否是一个运算符号 二元
 */
  public check(token: LToken): boolean {
    if (token.type === LTT.Punctuator || token.type == LTT.Keyword) {
      var value = token.value;
      if (
        value == '+' ||
        value == '-' ||
        value == '*' ||
        value == '/' ||
        value == '>' ||
        value == '<' ||
        value == '>=' ||
        value == '<=' ||
        value == '%' ||
        value == '&' ||
        value == '~' ||
        value == '|' ||
        value == '<<' ||
        value == '>>' ||
        value == '^') {
        return true
      }
      else if (value == '..') {
        return true
      }
      else if (
        value == '==' ||
        value == '~=' ||
        value == 'and' ||
        value == 'or'
      ) {
        return true
      } else return false
    } else return false
  }


}