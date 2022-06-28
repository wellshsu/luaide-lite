import { Stats } from "fs"
import { Uri } from "vscode"
import { ExtMgr } from '../context/ExtMgr'
import vscode = require('vscode')
import { ToCSharp } from "../formater/ToCSharp";

var libfs = require("fs")
var rd = require('rd');

export class PvdLuacs {
    public static processFile(e) {
        var path = e.fsPath
        var count = 0
        rd.each(path, function (f: string, s: Stats, next) {
            if (s.isFile()) {
                var ex = f.substring(f.lastIndexOf("."), f.length)
                if (ex == ".lua") {
                    // UTF-8 Without BOM
                    vscode.workspace.openTextDocument(Uri.file(f)).then(
                        doc => {
                            var format: ToCSharp = new ToCSharp(doc.getText())
                            f = f.replace(".lua", ".cs")
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
        PvdLuacs.edit((text) => {
            try {
                var to = new ToCSharp(text)
                var content = to.formatContent
                ExtMgr.typescriptDefine.forEach((v, k) => {
                    content = content.replace(new RegExp(k, "gm"), v)
                })
                return content
            } catch (e) {
                console.log(e)
                throw e
            }
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