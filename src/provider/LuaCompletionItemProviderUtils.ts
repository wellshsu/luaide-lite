import vscode = require('vscode')
import { LCItem } from "./LCItem"
import { LFItem } from "./LFItem"
import { LFile } from "./LFile"
import { LParse } from "../parser/LParse"
import { LGItem } from "./LGItem"

export class LuaCompletionItemProviderUtils {
    public static ins: LuaCompletionItemProviderUtils;
    private lfi: LFItem;

    public static instance() {
        if (LuaCompletionItemProviderUtils.ins == null) {
            LuaCompletionItemProviderUtils.ins = new LuaCompletionItemProviderUtils();
        }
        return LuaCompletionItemProviderUtils.ins
    }

    constructor() {
        this.lfi = LFItem.instance()
    }

    public getCompletionByModulePath(modulePath: string): Array<LCItem> {
        var ritems: Array<LCItem> = new Array<LCItem>();
        ritems = this.getItemsByModuleName(modulePath)
        return ritems
    }

    public getItemsByModuleName(moduleName): Array<LCItem> {
        var reItems: Array<LCItem> = new Array<LCItem>();
        var lfcis: LFItem = LFItem.instance()
        var paths: Array<string> = lfcis.getUrisByModuleName(moduleName)
        if (paths == null || paths.length == 0) {
            var gItem = LGItem.getCompletionByKeys([moduleName])
            if (gItem) {
                for (var i = 0; i < gItem.globalUris.length; i++) {
                    var temp = gItem.globalUris[i]
                    if (paths == null) {
                        paths = new Array<string>()
                    }
                    paths.push(temp)
                }
            }
        }
        if (paths) {
            for (var index = 0; index < paths.length; index++) {
                var file: LFile = LParse.ins.fileMgr.getFileByPath(paths[index])
                if (file.rootField) {
                    reItems.push(file.rootField)
                } else {
                    var item: LCItem = file.fields.getItemByKey(moduleName, true)
                    if (item) {
                        reItems.push(item)
                    } else {
                        LParse.ins.fileMgr.files.forEach((v, k) => {
                            var gitem = v.fields.getItemByKey(moduleName, true)
                            if (gitem) {
                                if (reItems.indexOf(gitem) == -1) {
                                    reItems.push(gitem)
                                }
                            }
                        })
                    }
                }
                if (file.rootFunc) {
                    reItems.push(file.rootFunc)
                } else {
                    LParse.ins.fileMgr.files.forEach((v, k) => {
                        var gitem = v.funcs.getItemByKey(moduleName, true)
                        if (gitem) {
                            if (reItems.indexOf(gitem) == -1) {
                                reItems.push(gitem)
                            }
                        }
                    })
                }
            }
        }
        return reItems;
    }

    public getParentItems(completion: LCItem, parentCompletion: Array<Map<string, LCItem>>) {
        if (completion.parentClazz != null) {
            var uri: vscode.Uri = this.lfi.getUriCompletionByModuleName(completion.parentClazz)
            if (uri) {
                var referenceCompletionManager: LFile = LParse.ins.fileMgr.getFileByPath(uri.path)
                if (referenceCompletionManager.rootField) {
                    parentCompletion.push(referenceCompletionManager.rootField.getItems())
                    parentCompletion.push(referenceCompletionManager.rootFunc.getItems())
                    if (referenceCompletionManager.rootField.parentClazz != null) {
                        this.getParentItems(referenceCompletionManager.rootField, parentCompletion)
                    }
                }
            }
        }
    }

    public getParentItemByKey(completion: LCItem, key: string): LCItem {
        var uri: vscode.Uri = this.lfi.getUriCompletionByModuleName(completion.parentClazz)
        if (uri) {
            var referenceCompletionManager: LFile = LParse.ins.fileMgr.getFileByPath(uri.path)
            if (referenceCompletionManager.rootField) {
                var item = referenceCompletionManager.rootField.getItemByKey(key)
                if (item) {
                    return item
                } else {
                    if (referenceCompletionManager.rootField.parentClazz != null) {
                        return this.getParentItemByKey(referenceCompletionManager.rootField, key)
                    }
                }
            }
        }
        return null;
    }

    public mergeItems(items1: Array<LCItem>, items2: Array<LCItem>) {
        if (items2) {
            items2.forEach(item => {
                if (items1.indexOf(item) == -1) {
                    items1.push(item)
                }
            })
        }
        return items1
    }
}