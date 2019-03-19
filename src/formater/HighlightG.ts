import { DecorationRangeBehavior } from "vscode"
import { LFile } from "../provider/LFile"
import vscode = require('vscode')
import { LToken, LTT } from "../parser/LEntity"
import { ExtMgr } from "../context/ExtMgr"

export class HighlightG {
    public static Style: vscode.TextEditorDecorationType
    public file: LFile
    private timeout

    constructor(file: LFile) {
        this.file = file
        if (HighlightG.Style == null) {
            HighlightG.reset()
        }
    }

    public static reset() {
        HighlightG.Style = vscode.window.createTextEditorDecorationType({
            isWholeLine: false,
            light: {
                color: ExtMgr.normalHighlightColor
            },
            dark: {
                color: ExtMgr.darkHighlightColor
            },
            rangeBehavior: DecorationRangeBehavior.ClosedClosed
        })
    }

    public render(tokens: Array<LToken>): void {
        if (ExtMgr.enableHighlight) {
            if (vscode.window.activeTextEditor && vscode.window.activeTextEditor.document.uri == this.file.uri && tokens.length > 0) {
                let doc = vscode.window.activeTextEditor.document
                let that = this
                const updataG = function () {
                    let tempDs: vscode.DecorationOptions[] = []
                    tokens.forEach((token: LToken) => {
                        if (token.type == LTT.Identifier && (token.last == null || token.last.value != ".")) {
                            let tempSig = false
                            let tempGT = that.file.fields.getItemByKey(token.value)
                            if (tempGT) {
                                tempSig = true
                            }
                            if (!tempSig) {
                                let tempGF = that.file.funcs.getItemByKey(token.value)
                                if (tempGF && !tempGF.isLocal) {
                                    tempSig = true
                                }
                            }
                            if (tempSig) {
                                let tempR = new vscode.Range(doc.positionAt(token.range.start), doc.positionAt(token.range.end))
                                let tempD = {
                                    range: tempR,
                                }
                                tempDs.push(tempD)
                            }
                        }
                    })
                    if (vscode.window.activeTextEditor) {
                        vscode.window.activeTextEditor.setDecorations(HighlightG.Style, tempDs)
                    }
                }
                if (this.timeout) {
                    clearTimeout(this.timeout)
                }
                this.timeout = setTimeout(updataG, 50)
            }
        }
    }
}