import { LToken } from "../parser/LEntity";
import crypto = require("crypto");
import path = require("path")
import fs = require("fs")
import { workspace } from "vscode";
import { ExtMgr } from "../context/ExtMgr";
import { Helper } from "../context/Helper";

export class PToken {
    public File: string
    public Tokens: Array<LToken>
}

export class PTokenMgr {
    public static Tokens: Array<PToken>
    public static MD5: string
    public static LocalFile: string
    public static LocalRoot: string

    public static Initialize() {
        let hash = crypto.createHash("md5")
        hash.update(new Buffer(workspace.rootPath, "binary"))
        PTokenMgr.MD5 = hash.digest("hex")
        PTokenMgr.LocalRoot = path.join(ExtMgr.extensionPath, "res/cache")
        PTokenMgr.LocalFile = path.join(PTokenMgr.LocalRoot, PTokenMgr.MD5 + ".ptoken")
        let json
        if (fs.existsSync(PTokenMgr.LocalFile)) {
            json = fs.readFileSync(PTokenMgr.LocalFile)
        }
        if (json != null) {
            PTokenMgr.Tokens = <Array<PToken>>JSON.parse(json.toString())
            if (PTokenMgr.Tokens != null) {
                for (let i = 0; i < PTokenMgr.Tokens.length;) {
                    let temp = PTokenMgr.Tokens[i]
                    if (temp != null && temp.File != null && temp.Tokens != null && temp.Tokens.length > 0 && fs.existsSync(temp.File)) {
                        i++
                        let c = null
                        for (let j = 0; j < temp.Tokens.length; j++) {
                            let t = temp.Tokens[j]
                            t.last = c
                            t.next = temp.Tokens[j + 1]
                            c = t
                        }
                    } else {
                        Helper.DELETE(PTokenMgr.Tokens, i)
                    }
                }
            }
        }
        if (PTokenMgr.Tokens == null) {
            PTokenMgr.Tokens = new Array<PToken>()
        }
        console.log("PTokenMgr: " + PTokenMgr.LocalFile)
    }

    public static Get(file: string): Array<LToken> {
        for (let i = 0; i < PTokenMgr.Tokens.length; i++) {
            let temp = PTokenMgr.Tokens[i]
            if (temp && temp.File == file) {
                let temp2 = new Array<LToken>()
                for (let j = 0; j < temp.Tokens.length; j++) {
                    temp2.push(temp.Tokens[j])
                }
                return temp2
            }
        }
        return null
    }

    public static Update(file: string, tokens: Array<LToken>) {
        if (file == null || fs.existsSync(file) == false || tokens == null) return
        let has = false
        for (let i = 0; i < PTokenMgr.Tokens.length; i++) {
            let temp = PTokenMgr.Tokens[i]
            if (temp && temp.File == file) {
                has = true
                temp.Tokens = tokens
            }
        }
        if (has == false) {
            let temp = new PToken()
            temp.File = file
            temp.Tokens = tokens
            Helper.INSERT(PTokenMgr.Tokens, temp)
        }
        return null
    }

    public static Save() {
        if (PTokenMgr.Tokens == null) return
        if (fs.existsSync(PTokenMgr.LocalRoot) == false) {
            fs.mkdirSync(PTokenMgr.LocalRoot)
        }
        if (fs.existsSync(PTokenMgr.LocalFile)) {
            fs.unlinkSync(PTokenMgr.LocalFile)
        }
        let json = JSON.stringify(PTokenMgr.Tokens, (k, v) => {
            if ((k == "last" || k == "next") && v instanceof LToken) {
                return null
            }
            return v
        })
        fs.writeFileSync(PTokenMgr.LocalFile, json)
    }

}