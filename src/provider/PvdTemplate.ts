import { ExtMgr } from "../context/ExtMgr"
import { Helper } from "../context/Helper"
import * as vscode from "vscode"
var fs = require("fs")
var os = require("os")
var rd = require("rd")
var path = require("path")

export class PvdTemplate {

    public static process(e) {
        var templates: Array<string> = new Array<string>()
        rd.eachFileFilterSync(ExtMgr.templateDir, /\.lua$/, function (f, s) {
            templates.push(f.substring(ExtMgr.templateDir.length + 1, f.length))
        });
        if (templates != null) {
            if (templates.length > 0) {
                vscode.window.showQuickPick(templates).then(function (selection) {
                    if (selection) {
                        PvdTemplate.showInputBox(selection, e, "Input file name.")
                    }
                })
            } else {
                vscode.window.showWarningMessage("No template files in " + ExtMgr.templateDir + ", please change 'luaide-lite.templateDir'")
            }
        }
    }

    private static showInputBox(selection, e, prompt) {
        var inputOptions = {
            prompt: prompt,
            value: selection,
        }
        vscode.window.showInputBox(inputOptions).then(function (filename) {
            if (filename == "") {
                PvdTemplate.showInputBox(selection, e, "File name negative, please input again.")
                return
            } else {
                var content = fs.readFileSync(path.join(ExtMgr.templateDir, selection), "utf8")
                var newfile = ""
                if (e != null && e.fsPath != null) {
                    newfile = e.fsPath
                } else {
                    var editor: vscode.TextEditor = vscode.window.activeTextEditor
                    newfile = path.dirname(path)
                }
                var lastIndex: number = filename.lastIndexOf(".lua")
                if (lastIndex != filename.length - 4) {
                    filename += ".lua"
                }
                if (fs.existsSync(path.join(newfile, filename))) {
                    PvdTemplate.showInputBox(selection, e, "File already exists, please try anthor one.")
                    return
                }
                var module = filename.substring(0, filename.length - 4)
                content = content.replace(new RegExp("{module}", "gm"), module)
                var date: string = Helper.FormatDate(new Date(), "yyyy-MM-dd hh:mm:ss")
                content = content.replace(new RegExp("{date}", "gm"), date)
                var isCopyright = false
                var isAuthor = false
                ExtMgr.templateDefine.forEach((v, k) => {
                    if (k == "copyright") {
                        isCopyright = true
                    } else if (k == "author") {
                        isAuthor = true
                    }
                    content = content.replace(new RegExp("{" + k + "}", "gm"), v)
                })
                if (!isCopyright) {
                    content = content.replace(new RegExp("{copyright}", "gm"), "2018 luaide-lite")
                }
                if (!isAuthor) {
                    content = content.replace(new RegExp("{author}", "gm"), "luaide-lite")
                }
                var targetFile = path.join(newfile, filename)
                fs.writeFile(targetFile, content, function (err) {
                    if (err) {
                        vscode.window.showErrorMessage(err.message)
                    } else {
                        vscode.workspace.openTextDocument(targetFile).then(doc => {
                            vscode.window.showTextDocument(doc)
                        })
                    }
                })
            }
        })
    }

}