import { Stats } from "fs"
import { Uri } from "vscode"
import { TextFormat } from "./TextFormat"
import { ExtMgr } from '../context/ExtMgr'
import vscode = require('vscode')

var libfs = require("fs")
var rd = require('rd');

export class FileFormat {
    public static process(e) {
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
                            var format: TextFormat = new TextFormat(doc.getText())
                            libfs.writeFileSync(f, format.formatComent, "utf8")
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
                console.log("FormatAll: count = " + count + ", error = " + err)
            } else {
                var str
                if (count <= 1) {
                    str = "Format " + count + " file success."
                } else {
                    str = "Format " + count + " files success."
                }
                vscode.window.showInformationMessage(str)
                console.log(str)
            }
        });
    }
}