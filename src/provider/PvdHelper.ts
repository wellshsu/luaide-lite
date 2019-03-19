import vscode = require('vscode');
import { LParse } from '../parser/LParse'
import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from '../parser/LEntity'
import { LParseHelper } from '../parser/LParseHelper'
import { Helper } from '../context/Helper'

export class PvdHelper {
    public static getTokens(document: vscode.TextDocument, position: vscode.Position): Array<LToken> {
        var lp: LParse = LParse.ins;
        var start: vscode.Position = new vscode.Position(0, 0)
        var lpt: LParseHelper = LParse.ins.lpt;
        var tokens: Array<LToken> = new Array<LToken>();
        lpt.reset(document.getText(new vscode.Range(start, position)))
        while (true) {

            var token: LToken = lpt.next();
            if (token.error != null) {
                return;
            }
            if (token.type == LTT.EOF) {
                break;
            }
            token.index = tokens.length;
            tokens.push(token);
        }
        return tokens;
    }

    public static getTokenByText(text: string) {
        var lpt: LParseHelper = LParse.ins.lpt;
        var tokens: Array<LToken> = new Array<LToken>();
        lpt.reset(text)
        while (true) {

            var token: LToken = lpt.next();
            if (token.error != null) {
                return;
            }
            if (token.type == LTT.EOF) {
                break;
            }
            token.index = tokens.length;
            tokens.push(token);
        }
        return tokens;
    }

    public static getComments(comments: Array<LComment>): string {
        if (comments == null) return "";
        var commentStr: string = "";
        if (comments.length == 1) {
            return comments[0].content;
        }
        for (var i: number = 0; i < comments.length; i++) {
            var comment = comments[i].content
            var index = comment.trim().indexOf("==");
            if (index == 0) { continue }
            commentStr = commentStr + comment;

        }
        return commentStr;
    }

    public static getFirstComments(comments: Array<LComment>): string {
        if (comments == null) return "";
        var commentStr: string = null;
        if (comments.length == 1) {
            return comments[0].content;
        }
        var descStr: string = null;
        for (var i: number = 0; i < comments.length; i++) {
            var comment = comments[i].content
            var index = comment.trim().indexOf("==");
            if (index == 0) { continue }
            if (comment.indexOf("@desc:") > -1) {
                commentStr = comment;
                break;
            } else if (commentStr == null) {
                commentStr = comment;
            }
        }
        return commentStr;
    }

    public static getSelfToModuleNameAndStartTokenIndex(uri: vscode.Uri, tokens: Array<LToken>, lp: LParse): any {
        var index: number = tokens.length - 1;
        while (true) {

            if (index < 0) break;
            var token: LToken = tokens[index]
            if (lp.Compare('function', token, LTT.Keyword)) {
                var nextToken: LToken = tokens[index + 1]
                if (nextToken.type == LTT.Identifier) {
                    var nextToken1: LToken = tokens[index + 2]
                    if (lp.Compare(':', nextToken1, LTT.Punctuator) ||
                        lp.Compare('.', nextToken1, LTT.Punctuator)
                    ) {
                        var range: vscode.Range = null
                        var functionNameToken: LToken = null
                        //方法名
                        if (tokens.length > index + 3) {
                            functionNameToken = tokens[index + 3]
                        }
                        if (functionNameToken) {
                            if (lp.fileMgr.getFileByPath(uri.path)) {
                                var name = nextToken.value + nextToken1.value + functionNameToken.value
                                range = lp.fileMgr.getFileByPath(uri.path).getSymbolEndRange(name)
                            } else {
                                return {}
                            }

                        }
                        var moduleName: string = nextToken.value;
                        return { moduleName: moduleName, index: index, range: range };
                    }
                    else index--
                } else {
                    index--;

                }
            } else {
                index--;
            }
        }
        return null
    }

    public static getParamComment(param: string, comments: Array<LComment>) {
        var paramName: string = "@" + param;
        for (var i: number = 0; i < comments.length; i++) {
            var comment = comments[i].content
            if (comment.indexOf(paramName) > -1) {
                comment = comment.replace(paramName, "")
                return comment;
            }
        }
        return "";
    }

}




