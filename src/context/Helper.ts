import cp = require('child_process')
import vscode = require('vscode')
import { LParse } from '../parser/LParse'
import { LParseHelper } from '../parser/LParseHelper'
import { format } from 'util'
import { LToken, LTT, LComment } from '../parser/LEntity'

export class Helper {
    public static Log(content: any, ...optionalParams: any[]) {
        console.log(content, ...optionalParams)
    }

    public static IsWhiteSpace(code): boolean {
        return 9 === code || 32 === code || 0xB === code || 0xC === code
    }

    public static IsLineTerminate(charCode): boolean {
        return 10 === charCode || 13 === charCode
    }

    public static IsIdentifierStart(charCode): boolean {
        return (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || 95 === charCode
    }

    public static IsIdentifierPart(charCode): boolean {
        return (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || 95 === charCode || (charCode >= 48 && charCode <= 57)
    }

    public static IsIdentifierValid(identifier: string): boolean {
        if (identifier == null || identifier == "") {
            return false
        } else {
            let index = 0
            let sig = false
            while (index < identifier.length) {
                if (index == 0) {
                    sig = Helper.IsIdentifierStart(identifier.charCodeAt(index))
                }
                else if (index == identifier.length - 1) {

                } else {
                    sig = Helper.IsIdentifierPart(identifier.charCodeAt(index))
                }
                if (!sig) {
                    break
                } else {
                    index++
                }
            }
            return sig
        }
    }

    public static GetTokens(document: vscode.TextDocument, position: vscode.Position, lpt?: LParseHelper): Array<LToken> {
        let start: vscode.Position = new vscode.Position(0, 0)
        if (lpt == null) {
            let lp: LParse = LParse.ins
            lpt = LParse.ins.lpt
        }
        let tokens: Array<LToken> = new Array<LToken>()
        if (position == null) {
            lpt.reset(document.getText())
        } else {
            let line = document.lineAt(position.line)
            lpt.reset(document.getText(new vscode.Range(start, position)))
        }
        while (true) {
            let token: LToken = lpt.next()
            if (token.error != null) {
                return
            }
            if (token.type == LTT.EOF) {
                break
            }
            token.index = tokens.length
            tokens.push(token)
        }
        return tokens
    }

    public static GetComments(comments: Array<LComment>): string {
        if (comments == null) return ""
        let commentStr: string = ""
        if (comments.length == 1) {
            return comments[0].content
        }
        for (let i: number = 0; i < comments.length; i++) {
            let comment = comments[i].content
            let index = comment.trim().indexOf("==")
            if (index == 0) { continue }
            commentStr = commentStr + comment
        }
        return commentStr
    }

    public static GetDescComment(comment: string): string {
        let commentStr: string = ""
        let commentIndex: number = comment.indexOf("@desc")
        if (commentIndex > -1) {
            commentStr = comment.substring(commentIndex + 5)
            commentStr = Helper.TrimComment(commentStr)
        } else {
            if (comment.indexOf("@") == 0) {
                commentStr = ""
            } else {
                commentStr = comment
            }
        }
        return commentStr
    }

    public static GetFirstComments(comments: Array<LComment>): string {
        if (comments == null) return ""
        let commentStr: string = null
        if (comments.length == 1) {
            return Helper.GetDescComment(comments[0].content)
        }
        for (let i: number = 0; i < comments.length; i++) {
            let comment = comments[i].content
            let index = comment.trim().indexOf("==")
            if (index == 0) { continue }
            commentStr = Helper.GetDescComment(comments[i].content)
            if (commentStr != "") {
                break
            }
        }
        return commentStr
    }

    public static TrimComment(commentStr: string): string {
        commentStr = commentStr.trim()
        if (commentStr.indexOf(":") == 0) {
            return commentStr.substring(1)
        } else {
            return commentStr
        }
    }

    public static IgnoreEnd(index: number, tokens: Array<LToken>) {
        let lp: LParse = LParse.ins
        let endCount: number = 1
        while (index >= 0) {
            let token: LToken = tokens[index]
            index--
            if (lp.Compare('do', token, LTT.Keyword) ||
                lp.Compare('then', token, LTT.Keyword) ||
                lp.Compare('', token, LTT.Keyword)
            ) {
                endCount--
                if (endCount == 0) {
                    return index
                }

            } else if (lp.Compare('end', token, LTT.Keyword)) {
                endCount++
            }
        }
        return index
    }

    public static GetCurrentFunctionName(tokens: Array<LToken>): Array<string> {
        let lp: LParse = LParse.ins
        let funNames: Array<string> = new Array<string>()
        let index = tokens.length - 1
        while (index >= 0) {
            let token: LToken = tokens[index]
            index--
            if (token.type == LTT.Keyword && token.value == "function") {
                let nextIndex = token.index + 1
                if (nextIndex < tokens.length) {
                    let nextToken: LToken = tokens[nextIndex]
                    let funName = ""
                    if (nextToken.type == LTT.Punctuator && nextToken.value == "(") {
                        funName = format("Anonymous(%d:%d)", token.line, token.lineStart)
                    } else {
                        funName = Helper.GetFunctionName(tokens, nextIndex)
                    }
                    if (funName != null && funName != "") {
                        funNames.push(funName)
                        if (funName.indexOf(".") > -1 || funName.indexOf(":") > -1) {
                            break
                        }
                    } else {
                        return []
                    }

                } else {
                    return []
                }

            } else if (lp.Compare('end', token, LTT.Keyword)) {
                index = Helper.IgnoreEnd(index, tokens)
            }
        }
        let newFunNames: Array<string> = new Array<string>()
        for (let i = 0; i < funNames.length; i++) {
            let fn = ""
            for (let j = funNames.length - 1; j > i; j--) {
                fn += funNames[j] + "->"
            }
            fn += funNames[i]
            newFunNames.push(fn)
        }
        return newFunNames
    }

    public static GetFunctionName(tokens: Array<LToken>, index: number): string {
        let length = tokens.length - 1
        let funName: string = ""
        while (index < length) {
            let token: LToken = tokens[index]
            if (token.type == LTT.Punctuator && token.value == "(") {
                funName = funName.replace("=", "")
                funName = funName.replace("function", "")
                return funName
            } else {
                funName += token.value
            }
            index++
        }
        return funName
    }

    public static GetSelfToModuleName(tokens: Array<LToken>, lp: LParse): any {
        let index: number = tokens.length - 1
        while (true) {
            if (index < 0) break
            let token: LToken = tokens[index]
            if (lp.Compare('function', token, LTT.Keyword)) {
                let nextToken: LToken = tokens[index + 1]
                if (nextToken.type == LTT.Identifier) {
                    let nextToken1: LToken = tokens[index + 2]
                    if (lp.Compare(':', nextToken1, LTT.Punctuator)) {
                        let moduleName: string = nextToken.value
                        let data = { moduleName: moduleName, token: nextToken }
                        return data
                    }
                    else index--
                } else {
                    index--

                }
            } else {
                index--
            }
        }
        return null
    }

    public static GetParamComment(param: string, comments: Array<LComment>) {
        let paramName: string = "@" + param + ""
        for (let i: number = 0; i < comments.length; i++) {
            let comment = comments[i].content
            if (comment.indexOf(paramName) > -1) {
                comment = comment.replace(paramName, "")
                comment = Helper.TrimComment(comment)
                return comment
            }
        }
        return ""
    }

    public static ShowInExplorer(path) {
        let command = null
        switch (process.platform) {
            case 'linux':
                command = 'xdg-open ' + path
                break
            case 'darwin':
                command = 'open ' + path
                break
            case 'win32':
                command = 'start ' + path
                break
        }
        if (command != null) {
            cp.exec(command)
        }
    }

    public static FormatDate(date: Date, fmt) {
        let o = {
            "M+": date.getMonth() + 1, //月份           
            "d+": date.getDate(), //日           
            "h+": date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, //小时           
            "H+": date.getHours(), //小时           
            "m+": date.getMinutes(), //分           
            "s+": date.getSeconds(), //秒           
            "q+": Math.floor((date.getMonth() + 3) / 3), //季度           
            "S": date.getMilliseconds() //毫秒           
        }
        let week = {
            "0": "/u65e5",
            "1": "/u4e00",
            "2": "/u4e8c",
            "3": "/u4e09",
            "4": "/u56db",
            "5": "/u4e94",
            "6": "/u516d"
        }
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length))
        }
        if (/(E+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[date.getDay() + ""])
        }
        for (let k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)))
            }
        }
        return fmt
    }

    public static DELETE(arr: Array<any>, idx: number) {
        if (arr != null) {
            if (idx < arr.length) {
                arr.splice(idx, 1)
            }
        }
    }

    public static REMOVE<T>(arr: Array<T>, condition: (item: T) => boolean): boolean {
        for (let i = 0; i < arr.length; i++) {
            if (condition(arr[i])) {
                Helper.DELETE(arr, i)
                return true
            }
        }
        return false
    }

    public static INSERT(arr: Array<any>, ele: any, idx: number = -1) {
        if (arr != null && ele != null) {
            if (idx == -1) {
                idx = arr.length
            }
            arr.splice(idx, 0, ele)
        }
    }

    public static SORT<T>(arr: T[], func: (o1: T, o2: T) => (boolean)) {
        if (arr != null && func != null && arr instanceof Array) {
            arr.sort((o1, o2) => {
                if (func(o1, o2)) {
                    return -1
                } else {
                    return 1
                }
            })
        }
    }

    public static Format(fmt: string, ...args: any[]): string {
        if (fmt) {
            if (args.length > 0) {
                let index = 0
                const doReplace = function (rplc) {
                    if (rplc == null) {
                        rplc = "undefined"
                    }
                    if (rplc instanceof Array) {
                        for (let i = 0; i < rplc.length; i++) {
                            let temp = rplc[i]
                            doReplace(temp)
                        }
                    }
                    else {
                        let str: string
                        let reg = new RegExp("({)" + index + "(})", "g")
                        if (typeof (rplc) == "string") {
                            str = <string>rplc
                        } else {
                            str = rplc.toString()
                        }
                        fmt = fmt.replace(reg, str)
                        index++
                    }
                }
                for (let i = 0; i < args.length; i++) {
                    let temp = args[i]
                    if (temp != null) {
                        doReplace(temp)
                    }
                }
            }
            return fmt
        }
        else {
            return null
        }
    }

}