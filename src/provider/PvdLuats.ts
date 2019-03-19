import { Stats } from "fs"
import { Uri } from "vscode"
import { ExtMgr } from '../context/ExtMgr'
import vscode = require('vscode')
import { ToTypescript } from "../formater/ToTypescript";
import { LParse } from "../parser/LParse";

var libfs = require("fs")
var rd = require('rd');

export class PvdLuats {

    public static processFile(e) {
        if (!ExtMgr.enableFormat) {
            vscode.window.showWarningMessage("Enable format setting 'luaide-lite.enableFormat:true'")
            return
        }
        var path = e.fsPath
        var count = 0
        rd.each(path, function (f: string, s: Stats, next) {
            if (s.isFile()) {
                var ex = f.substring(f.lastIndexOf("."), f.length)
                if (ex == ".lua") {
                    // UTF-8 Without BOM
                    vscode.workspace.openTextDocument(Uri.file(f)).then(
                        doc => {
                            var format: ToTypescript = new ToTypescript(doc.getText())
                            f = f.replace(".lua", ".ts")
                            libfs.writeFileSync(f, format.formatContent, "utf8")
                        }
                    ).then(function (event) {
                    }, function (reason) {
                    })
                    count++
                }
            }
            next();
        }, function (err) {
            if (err) {
                console.log("To Typescript: count = " + count + ", error = " + err)
            } else {
                var str
                if (count <= 1) {
                    str = "To Typescript " + count + " file success."
                } else {
                    str = "To Typescript " + count + " files success."
                }
                vscode.window.showInformationMessage(str)
                console.log(str)
            }
        });
    }

    public static processText(e) {
        PvdLuats.edit((text) => {
            var to = new ToTypescript(text)
            var content = to.formatContent
            ExtMgr.typescriptDefine.forEach((v, k) => {
                content = content.replace(new RegExp(k, "gm"), v)
            })
            return content
        })
    }

    private static edit(func, text = null) {
        var editor = vscode.window.activeTextEditor;
        var d = editor.document;
        var sel = editor.selections;
        editor.edit(function (edit) {
            for (var x = 0; x < sel.length; x++) {
                var txt = d.getText(new vscode.Range(sel[x].start, sel[x].end));
                txt = func(txt)
                edit.replace(sel[x], txt);
            }
        });
    }
}
