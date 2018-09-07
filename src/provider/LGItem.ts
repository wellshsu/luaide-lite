import vscode = require('vscode')
import { LCItem } from "../provider/LCItem"
import { LParse } from "../parser/LParse"
import { LFile } from "./LFile"
import { LFItem } from "./LFItem"
import { LFileMgr } from "./LFileMgr"

export class LGItem {
    public static rootCompletion: LCItem;
    private static _LuaCompletionItemGolbalControler: LGItem;
    private fileMgr: LFileMgr;

    constructor() {
        this.fileMgr = LParse.ins.fileMgr
    }

    public static getIns() {
        if (LGItem._LuaCompletionItemGolbalControler == null) {
            LGItem._LuaCompletionItemGolbalControler = new LGItem()
        }
        return LGItem._LuaCompletionItemGolbalControler
    }

    public getItemByKeys(keys: Array<string>) {
        var items = this.getFirstItem(keys[0])
        for (var index = 2; index < keys.length; index++) {
            var key = keys[index];
            items = this.getFindItemByKey(items, key);
            if (items.length == 0) {
                break;
            }
            index++;
        }
        return items
    }

    public getFindItemByKey(items: Array<LCItem>, key: string) {
        var newitems: Array<LCItem> = new Array<LCItem>();
        for (var index = 0; index < items.length; index++) {
            var item = items[index];
            var fitem = item.getItemByKey(key)
            if (fitem) {
                newitems.push(fitem)
            }
        }
        return newitems
    }

    public getFirstItem(key) {
        var items: Array<LCItem> = new Array<LCItem>();
        this.fileMgr.files.forEach((v, k) => {
            var item = v.fields.getItemByKey(key)
            if (item != null && item.isNewVar == true) {
                items.push(item)
                var funItem = v.funcs.getItemByKey(key, false)
                if (funItem != null) {
                    items.push(funItem)
                }
            }
        })
        return items;
    }

    public static setGolbalCompletion(completion: LCItem) {
        if (this.rootCompletion == null) {
            this.rootCompletion = new LCItem("", vscode.CompletionItemKind.Field, null, null, false, null);
        }
        completion.getItems().forEach((v, k) => {
            this.rootCompletion.addItemToGolbal(v)
        })
    }

    public static clearGolbalCompletion(completion: LCItem) {
        if (this.rootCompletion) {
            completion.getItems().forEach((v, k) => {
                this.rootCompletion.delItemToGolbal(v)
            })
        }
    }

    public static getCompletionByKeys(keys: Array<string>): LCItem {
        if (this.rootCompletion) {
            var item = this.rootCompletion;
            for (var index = 0; index < keys.length; index++) {
                var key = keys[index];
                item = item.getItemByKey(key, true)
                if (item == null) {
                    break;
                }
                index++;
            }
            return item;
        }
    }
}