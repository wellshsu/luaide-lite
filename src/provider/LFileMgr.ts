import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT } from '../parser/LEntity'
import { LParse } from "../parser/LParse"
import { CompletionItem, CompletionItemKind, Uri } from "vscode"
import { LCItem } from "../provider/LCItem"
import { LFile, CompletionItemSimpleInfo } from "../provider/LFile"
import { Helper } from '../context/Helper'
import vscode = require('vscode')
import { throws } from 'assert';

export class LFileMgr {
    public lp: LParse
    public tokens: Array<LToken>
    public files: Map<string, LFile>
    public curFile: LFile

    constructor() {
        this.files = new Map<string, LFile>()
    }

    public initialize(lp: LParse, uri: Uri, tempUri: Uri) {
        this.lp = lp
        this.tokens = lp.tokens
        this.curFile = new LFile(tempUri)
        this.files.set(uri.path, this.curFile)
    }

    public addFile(uri: Uri, file: LFile) {
        this.files.set(uri.path, file)
    }

    public getFile(uri: Uri): LFile {
        var file: LFile = null
        if (this.files.has(uri.path)) {
            file = this.files.get(uri.path)
        }
        return file
    }

    public getFileByPath(path: string): LFile {
        var file: LFile = null
        if (this.files.has(path)) {
            file = this.files.get(path)
        }
        return file
    }

    public getFileByDefine(define: string): LFile {
        var file: LFile
        try {
            if (this.files && this.files.size > 0) {
                this.files.forEach((temp) => {
                    temp.fields.items.forEach((temp2) => {
                        if (temp2.label == define && temp2.isNewVar) {
                            file = temp
                            throw null
                        }
                    })
                })
            }
        } catch{ }
        try {
            if (file == null) {
                if (this.files && this.files.size > 0) {
                    this.files.forEach((temp) => {
                        temp.funcs.items.forEach((temp2) => {
                            if (temp2.label == define) {
                                file = temp
                                throw null
                            }
                        })
                    })
                }
            }
        } catch{ }
        return file
    }

    public addFunc(luaInfo: LFrag, token: LToken, functionEndToken: LToken) {
        this.curFile.addFunctionCompletion(this.lp, luaInfo, token, functionEndToken)
    }

    public addField(luaInfo: LFrag, token: LToken): LCItem {
        var completion = this.curFile.addCompletionItem(this.lp,
            luaInfo, token, this.tokens, false, true);
        return completion
    }

    public addSymbol(luaInfo: LFrag, token: LToken, functionEndToken: LToken, symolName: string) {
        this.curFile.addSymbol(this.lp, luaInfo, token, functionEndToken, symolName)
    }

    public addGlobal(items: Array<LCItem>) {
        this.files.forEach((v, k) => {
            if (k != LParse.checkTempFilePath) {
                items.push(v.fields)
            }
        })
        this.files.forEach((v, k) => {
            if (k != LParse.checkTempFilePath) {
                items.push(v.funcs)
            }
        })
    }

    public getFuncArgs(tokens: Array<LToken>, uri: Uri) {
        var file: LFile = this.getFileByPath(uri.path)
        var funNames: Array<string> = Helper.GetCurrentFunctionName(tokens)
        if (file == null) {
            return [];
        }
        return file.getSymbolArgsByNames(funNames)
    }

}