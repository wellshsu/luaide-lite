import vscode = require('vscode')

export class UpperLower {

    public static toUpperCase(e) {
        UpperLower.process(function (txt: string) {
            return txt.toUpperCase()
        })
    }

    public static toLowerCase(e) {
        UpperLower.process(function (txt: string) {
            return txt.toLowerCase()
        })
    }

    public static process(converTextFun: Function) {
        let editor = vscode.window.activeTextEditor
        let d = editor.document
        let sel = editor.selections
        editor.edit(function (edit) {
            for (let x = 0; x < sel.length; x++) {
                let txt = d.getText(new vscode.Range(sel[x].start, sel[x].end))
                txt = converTextFun(txt)
                edit.replace(sel[x], txt)
            }
        })
    }
}