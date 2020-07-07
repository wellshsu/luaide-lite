import vscode = require('vscode')
import { TextFormat } from "../formater/TextFormat"

export class PvdFormat implements vscode.DocumentFormattingEditProvider, vscode.DocumentRangeFormattingEditProvider {

    public provideDocumentFormattingEdits(document: vscode.TextDocument, options: vscode.FormattingOptions, token: vscode.CancellationToken): Thenable<vscode.TextEdit[]> {
        return this.provideDocumentRangeFormattingEdits(document, null, options, token)
    }

    public provideDocumentRangeFormattingEdits(document: vscode.TextDocument, range: vscode.Range, options: vscode.FormattingOptions, token: vscode.CancellationToken): Thenable<vscode.TextEdit[]> {
        if (range === null) {
            let start = new vscode.Position(0, 0)
            let end = new vscode.Position(document.lineCount - 1, document.lineAt(document.lineCount - 1).text.length)
            range = new vscode.Range(start, end)
        }
        let content = document.getText(range)
        let result = []
        content = this.format(content)
        result.push(new vscode.TextEdit(range, content))
        return Promise.resolve(result)
    }

    private format(content: string): string {
        try {
            return new TextFormat(content).formatComent
        } catch (err) {
            console.error(err.stack)
            throw err
        }
    }
}
