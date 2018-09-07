import { TextDocument, Range, DecorationRangeBehavior } from "vscode"
import { LFile } from "../provider/LFile"
import { LParse } from "../parser/LParse"
import { LFItem } from "../provider/LFItem"
import vscode = require('vscode')
import { LCItem } from "../provider/LCItem"
import { LToken, LFrag, LRange, LFT, LTT } from "../context/LEntity"
import { EXMgr } from "../context/EXMgr"

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
                color: EXMgr.normalHighlightColor
            },
            dark: {
                color: EXMgr.darkHighlightColor
            },
            rangeBehavior: DecorationRangeBehavior.ClosedClosed
        })
    }

    public render(tokens: Array<LToken>): void {
        if (EXMgr.enableHighlight) {
            if (vscode.window.activeTextEditor && vscode.window.activeTextEditor.document.uri == this.file.uri && tokens.length > 0) {
                var doc = vscode.window.activeTextEditor.document
                var that = this
                var updataG = function () {
                    var tempDs: vscode.DecorationOptions[] = []
                    tokens.forEach((token: LToken) => {
                        if (token.type == LTT.Identifier && (token.last == null || token.last.value != ".")) {
                            var tempSig = false
                            var tempGT = that.file.fields.getItemByKey(token.value)
                            if (tempGT) {
                                tempSig = true
                            }
                            if (!tempSig) {
                                var tempGF = that.file.funcs.getItemByKey(token.value)
                                if (tempGF && !tempGF.isLocal) {
                                    tempSig = true
                                }
                            }
                            if (tempSig) {
                                // if (token.value == "string" || token.value == "coroutine") {
                                //     tempSig = false
                                // }
                            }
                            if (tempSig) {
                                var tempR = new vscode.Range(doc.positionAt(token.range.start), doc.positionAt(token.range.end))
                                var tempD = {
                                    range: tempR,
                                }
                                tempDs.push(tempD)
                            }
                        }
                    });
                    if (vscode.window.activeTextEditor) {
                        vscode.window.activeTextEditor.setDecorations(HighlightG.Style, tempDs)
                    }
                }
                if (this.timeout) {
                    clearTimeout(this.timeout);
                }
                this.timeout = setTimeout(updataG, 50);
                // updataG();
            }
        }
    }
}