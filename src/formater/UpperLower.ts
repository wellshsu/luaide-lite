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
        var editor = vscode.window.activeTextEditor;
        var d = editor.document;
        var sel = editor.selections;
        editor.edit(function (edit) {
            for (var x = 0; x < sel.length; x++) {
                var txt = d.getText(new vscode.Range(sel[x].start, sel[x].end));
                txt = converTextFun(txt)
                edit.replace(sel[x], txt);
            }
        });
    }
}
