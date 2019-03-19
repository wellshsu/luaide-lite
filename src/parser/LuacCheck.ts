import vscode = require('vscode')
var path = require('path')
import child_process = require('child_process')
import { ExtMgr } from '../context/ExtMgr'
export class LuacCheck {
    //默认为5.1
    private luaPath: string;
    constructor() {
    }

    private parseDiagnostics(data) {
        const diagnostics = [];
        var errorRegex = /.+: .+:([0-9]+): (.+) near.*[<'](.*)['>]/;
        const matches = data.match(errorRegex);
        if (!matches) {
            return [];
        }
        while (true) {
            const m = errorRegex.exec(data);
            if (!m) {
                break;
            }
            const [, lineStr, columnStr, endColumnStr, type, codeStr, message] = m;
            const line = Number(lineStr) - 1;
            const column = Number(columnStr) - 1;
            const columnEnd = Number(endColumnStr);
            const code = Number(codeStr);
            var range: vscode.Range = new vscode.Range(new vscode.Position(line, column), new vscode.Position(line, columnEnd))

            diagnostics.push({
                range: range,
                severity: vscode.DiagnosticSeverity.Error,
                code,
                source: 'luacheck',
                message
            });
        }
        return diagnostics;
    }

    /**
     * checkLua
     */
    public checkLua(uri: vscode.Uri, documentText: vscode.TextDocument) {
        var exepath = path.join(this.luaPath, "luac.exe")
        var dir = path.dirname(uri.fsPath);
        const process = child_process.spawn(exepath, ['-', '--no-color', '--ranges', '--codes'], {
            cwd: dir
        });
        try {
            var xx = documentText.getText()
            process.stdin.write(xx);
            process.stdin.end();
        }
        catch (err) { }
        process.stdout.on('data', (data) => {
            var xx = data.toString()
            var c = 1
        });
        process.stderr.on('data', (data) => {
            this.parseDiagnostics(data.toString())
            var c = 1
        });
        process.on('error', (err) => {
            var xx = err.message
            var c = 1
        });
    }
}