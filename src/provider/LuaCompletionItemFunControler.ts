import vscode = require('vscode')
import { LCItem } from "../provider/LCItem"
import { LParse } from "../parser/LParse"
import { LFile } from "../provider/LFile"
import { LFItem } from "../provider/LFItem"
import { LFileMgr } from "./LFileMgr"
import { LuaCompletionItemControler } from "./LuaCompletionItemControler"
import { LuaCompletionItemProviderUtils } from "./LuaCompletionItemProviderUtils"

export class LuaCompletionItemFunControler {
    public static ins: LuaCompletionItemFunControler;
    private fm: LFileMgr;
    private luaCompletionItemControler: LuaCompletionItemControler;
    private luaCompletionItemProviderUtils: LuaCompletionItemProviderUtils;

    constructor(luaCompletionItemControler: LuaCompletionItemControler) {
        this.fm = LParse.ins.fileMgr
        this.luaCompletionItemControler = luaCompletionItemControler;
        this.luaCompletionItemProviderUtils = LuaCompletionItemProviderUtils.instance();
    }

    public static instance(luaCompletionItemControler: LuaCompletionItemControler) {
        if (LuaCompletionItemFunControler.ins == null) {
            LuaCompletionItemFunControler.ins = new LuaCompletionItemFunControler(luaCompletionItemControler)
        }
        return LuaCompletionItemFunControler.ins
    }

    /**
    * local data = model:getInfo()
    * 获取一个变量是一个方法的返回值
    */
    public getReferenceCompletionFunValue(item: LCItem): Array<LCItem> {
        if (item.refFunc) {
            var requireReferenceItems: Array<LCItem> = new Array<LCItem>();
            item.refFunc.forEach((v, k) => {
                var keys: Array<string> = new Array<string>();
                for (var index = 0; index < v.length - 1; index++) {
                    var key = v[index];
                    keys.push(key)
                }
                var valueFunName: string = v[v.length - 1]
                var funNames: Array<string> = this.luaCompletionItemControler.getFunNames(k)
                var citems: Array<LCItem> = new Array<LCItem>();
                if (keys.length > 0) {
                    this.luaCompletionItemControler.getCompletionsByKeysAndFuncNames(item.uri, keys.reverse(), funNames, citems, false)
                    if (valueFunName == "new") {
                        if (citems.length > 0) {
                            var newRootCompletionInfo = new LCItem("", vscode.CompletionItemKind.Class, citems[0].uri, citems[0].position, false, citems[0].token)
                            citems.forEach(element => {
                                newRootCompletionInfo.addItem(element)
                            });
                            requireReferenceItems.push(newRootCompletionInfo)
                        }
                    } else {
                        citems.forEach(v1 => {
                            if (v1.label == valueFunName) {
                                this.getFunctionReturnCompletionKeys(v1, requireReferenceItems)
                            }
                        })
                    }
                } else {
                    var funItem = this.getFunByfunName(valueFunName, item, funNames)
                    if (funItem != null) {
                        this.getFunctionReturnCompletionKeys(funItem, requireReferenceItems)
                    }
                }
            })
            return requireReferenceItems
        }
        return null
    }

    public getFunctionReturnCompletionGolbalByKey(key: string, item: LCItem) {
        //现在本文件中找 如果本文件中没有找到那么就全局找  
        var file: LFile = this.fm.getFileByPath(item.uri.path)
        if (file == null) return
        //如果找到多个 那么就直接忽略
    }

    /**
    * 获取方法的返回值
    */
    public getFunctionReturnCompletionKeys(item: LCItem, items: Array<LCItem>): Array<LCItem> {
        if (item.funAnnotationReturnValue) {
            var fitems: Array<LCItem> = this.luaCompletionItemProviderUtils.getCompletionByModulePath(item.funAnnotationReturnValue)
            this.luaCompletionItemProviderUtils.mergeItems(items, fitems)
        }
        else if (item.functionReturnCompletionKeys) {
            var citems: Array<LCItem> = new Array<LCItem>();
            item.functionReturnCompletionKeys.forEach((v, k) => {
                var funNames: Array<string> = this.luaCompletionItemControler.getFunNames(k)
                var keys: Array<string> = new Array<string>()
                if (v.length == 1) {
                    keys.push(v[0])
                } else {
                    for (var index = 0; index < v.length - 1; index++) {
                        keys.push(v[index])
                    }
                }
                var keyName = v[v.length - 1]
                // keys.push(".")
                this.luaCompletionItemControler.getCompletionsByKeysAndFuncNames(item.uri, keys.reverse(), funNames, citems, false)
                citems.forEach(element => {
                    if (element.label == keyName) {

                        var reItems = this.luaCompletionItemControler.checkReferenceValue(element)
                        this.luaCompletionItemProviderUtils.mergeItems(items, reItems)
                        items.push(element)
                    }
                });

            })
        }
        return items
    }

    public getFunByfunName(functionName: string, item: LCItem, functionNames: Array<string>): LCItem {
        var file: LFile = this.fm.getFileByPath(item.uri.path)
        if (file == null) return
        functionNames = functionNames.reverse();
        for (var index = 0; index < functionNames.length; index++) {
            var fname = functionNames[index];
            var fitem = file.funcFields.get(fname)
            if (fitem != null) {
                var targetItem = fitem.getItemByKey(functionName)
                if (targetItem != null) {
                    return targetItem
                }
            }
        }
        //全局查找
        this.fm.files.forEach((v, k) => {
            var targetItem = v.funcs.getItemByKey(functionName)
            if (targetItem != null) {
                return targetItem
            }
        })
    }

}