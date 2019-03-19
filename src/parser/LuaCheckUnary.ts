import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from './LEntity'
import { LParse } from './LParse'
import { Helper } from '../context/Helper'
/**验证 一元 */
export class LuaCheckUnary {

    private lp: LParse;

    constructor(luaparse: LParse) {
        this.lp = luaparse;
    }

    /**
  * 判断是否是一元表达式
  */
    public check(luaInfo: LFrag) {
        while (true) {
            var token: LToken = this.lp.getCurrentToken(null)
            if (token != null) {
                if (this.lp.Compare('#', token, LTT.Punctuator) ||
                    this.lp.Compare('not', token, LTT.Keyword) ||
                    this.lp.Compare('-', token, LTT.Punctuator)) {
                    this.lp.tokenIndex++;
                    luaInfo.unarys.push(token)
                } else { return }
            } else
                return
        }
    }
}