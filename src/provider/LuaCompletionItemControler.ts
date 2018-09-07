import vscode = require('vscode')
import { LCItem } from "../provider/LCItem"
import { LuaCompletionItemProviderUtils } from "../provider/LuaCompletionItemProviderUtils"
import { LGItem } from "../provider/LGItem"
import { LParse } from "../parser/LParse"
import { LFile } from "./LFile"
import { LFItem } from "./LFItem"
import { LuaCompletionItemFunControler } from "./LuaCompletionItemFunControler"

export class LuaCompletionItemControler {
    public static ins: LuaCompletionItemControler
    private luaCompletionItemProviderUtils: LuaCompletionItemProviderUtils;
    private lfi: LFItem;
    private lgi: LGItem;
    private luaCompletionItemFunControler: LuaCompletionItemFunControler;

    constructor() {
        this.lfi = LFItem.instance()
        this.lgi = LGItem.getIns();
        this.luaCompletionItemProviderUtils = LuaCompletionItemProviderUtils.instance();
        this.luaCompletionItemFunControler = LuaCompletionItemFunControler.instance(this);
    }

    public static instance() {
        if (LuaCompletionItemControler.ins == null) {
            LuaCompletionItemControler.ins = new LuaCompletionItemControler()
        }
        return LuaCompletionItemControler.ins
    }

    public getCompletionsByKeysAndFuncNames(
        uri: vscode.Uri, keys: Array<string>,
        funNames: Array<string>,
        citems: Array<LCItem>, isFirst: boolean) {
        var keys = keys.reverse()
        var file: LFile = LParse.ins.fileMgr.getFileByPath(uri.path)
        if (file == null) return
        if (keys.length == 1) {
            if (funNames) {
                for (var index = 0; index < funNames.length; index++) {
                    var fname: string = funNames[index];
                    var funCompletionItem = file.funcFields.get(fname)
                    if (funCompletionItem) {
                        this.getCompletionAloneByItemIndexOfKey(funCompletionItem, keys[0], citems)
                    }
                }
            }
            this.getCompletionAloneByItemIndexOfKey(file.funcs, keys[0], citems)
            this.getCompletionAloneByItemIndexOfKey(file.locals, keys[0], citems)
            this.getCompletionAloneByItemIndexOfKey(file.fields, keys[0], citems)
            if (isFirst) {
                this.getCompletionAloneByItemIndexOfKey(LGItem.rootCompletion, keys[0], citems)
            }
        } else {
            var keyStr = keys.join("")
            var rootItem = this.getFirstCompletionInfo(file, keys[0], funNames)
            var reItems: Array<LCItem> = new Array<LCItem>();
            if (rootItem == null) {
                this.luaCompletionItemProviderUtils.mergeItems(reItems, this.luaCompletionItemProviderUtils.getItemsByModuleName(keys[0]))
            } else {
                reItems = this.checkReferenceValue(rootItem)
                if (reItems.length == 0) {
                    this.luaCompletionItemProviderUtils.mergeItems(reItems, this.luaCompletionItemProviderUtils.getItemsByModuleName(keys[0]))
                }
                if (reItems.indexOf(rootItem) == -1) {
                    reItems.push(rootItem)
                }
            }
            var gitems = this.lgi.getFirstItem(keys[0])
            if (gitems.length > 0) {
                this.luaCompletionItemProviderUtils.mergeItems(reItems, gitems)
            }
            if (reItems.length > 0) {
                var index: number = 3
                while (index < keys.length) {
                    var key = keys[index - 1]
                    if (key == null) {
                        break
                    }
                    var tempItems: Array<LCItem> = new Array<LCItem>();
                    reItems.forEach(item => {
                        var tItem: LCItem = item.getItemByKey(key, true)
                        if (tItem == null) {
                            tItem = this.luaCompletionItemProviderUtils.getParentItemByKey(item, key)
                        }
                        if (tItem) {
                            tempItems.push(tItem)
                            var refItems: Array<LCItem> = this.checkReferenceValue(tItem)
                            refItems.forEach(e => {
                                tempItems.push(e)
                            })
                        }
                    })
                    reItems = tempItems;
                    index += 2
                }
                reItems.forEach(element => {
                    if (element) {
                        element.getItems().forEach((v, k) => {
                            if (citems.indexOf(v) == -1) {
                                citems.push(v)
                            }
                        })
                        //parent element  查找父类元素
                        var parentClassItems: Array<Map<string, LCItem>> = new Array<Map<string, LCItem>>()
                        this.luaCompletionItemProviderUtils.getParentItems(element, parentClassItems)
                        for (var index = 0; index < parentClassItems.length; index++) {
                            var parentItems = parentClassItems[index];
                            parentItems.forEach((v, k) => {
                                if (citems.indexOf(v) == -1) {
                                    citems.push(v)
                                }
                            })
                        }
                        if (element.uri != null && element.uri.path == uri.path) {
                            var tempKeys: Array<string> = new Array<string>()
                            var item = element
                            while (true) {
                                tempKeys.push(item.label)
                                if (item.parent) {
                                    item = item.parent
                                    if (item.completionFunName != null) { break; }
                                } else {
                                    item = null
                                }
                                if (item == null || item.label == "") {
                                    break
                                }
                            }
                            var tempKeys = tempKeys.reverse()
                            var findKeys: Array<string> = new Array<string>()
                            for (var k = 0; k < tempKeys.length; k++) {
                                findKeys.push(tempKeys[k])
                                findKeys.push(".")
                            }
                            var findKeyStr = tempKeys[tempKeys.length - 1]
                            var ccitems: Array<LCItem> = new Array<LCItem>()
                            var findKeysStr = findKeys.join("");
                            if (keyStr != findKeysStr) {
                                if (findKeys.length > 0) {
                                    this.getCompletionsByKeysAndFuncNames(element.uri, findKeys.reverse(), funNames, ccitems, false)
                                    ccitems.forEach(v => {
                                        if (citems.indexOf(v) == -1) {
                                            citems.push(v)
                                        }
                                    })
                                }
                            }
                        }
                    }
                });
            }
        }
    }

    public getReferenceValueByKeysAndFuncName(rootItem: LCItem,
        funName: string, keys: Array<string>): Array<LCItem> {
        //获取方法名字集合
        var funNames: Array<string> = this.getFunNames(funName)
        var file: LFile = LParse.ins.fileMgr.getFileByPath(rootItem.uri.path)
        var valueItem: LCItem = null
        funNames = funNames.reverse()
        var valueItems: Array<LCItem> = new Array<LCItem>();
        if (funNames.length == 1 && funNames[0] == "__g__") {

            valueItem = this.getCompletionByKeys(file.locals, keys, true)

            if (valueItem == null) {
                valueItem = this.getCompletionByKeys(file.fields, keys, true)
            }
            if (valueItem) {
                valueItems.push(valueItem)
            }
        } else {
            for (var index = 0; index < funNames.length; index++) {
                var fname: string = funNames[index]
                var funLuaCompletion = file.funcFields.get(funName)
                if (funLuaCompletion) {
                    valueItem = this.getCompletionByKeys(funLuaCompletion, keys, false)
                    if (valueItem) {
                        valueItems.push(valueItem)
                        break
                    }
                } else {
                    break;
                }

            }
            //如果在方法内没找到那么就找
            valueItem = this.getCompletionByKeys(file.locals, keys, true)

            if (valueItem == null) {
                valueItem = this.getCompletionByKeys(file.fields, keys, true)
            }
            if (valueItem) {
                valueItems.push(valueItem)
            }
        }
        //如果还没找到 就全部文件中找  这里采用一点小技巧 这里先去找keys[0] 值检查下
        //有没有对应的文件 如果没有再进行全局检查
        // if (valueItem == null) {
        this.luaCompletionItemProviderUtils.mergeItems(valueItems, this.luaCompletionItemProviderUtils.getItemsByModuleName(keys[0]))
        var fileCompletionItemManagers: Map<string, LFile> = LParse.ins.fileMgr.files
        for (var info of fileCompletionItemManagers) {
            valueItem = this.getCompletionByKeys(info[1].fields, keys, true)
            if (valueItem != null) {
                valueItems.push(valueItem)
            }
        }
        return valueItems
    }

    public getCompletionByKeys(item: LCItem, keys: Array<string>, isValue: boolean): LCItem {
        var index: number = 0
        while (index < keys.length) {
            item = item.getItemByKey(keys[index])
            if (item == null) {
                break
            }
            index += 2;
        }
        return item
    }

    public checkReferenceValue(item: LCItem): Array<LCItem> {
        var reItems: Array<LCItem> = new Array<LCItem>();
        //require("xxx.xxx.xx")
        if (item.refClazz == null) {
            var rferenceItems = null;
            if (item.reqClazz) {
                for (var index = 0; index < item.reqClazz.length; index++) {
                    var path = item.reqClazz[index];
                    var items: Array<LCItem> = this.luaCompletionItemProviderUtils.getCompletionByModulePath(path)
                    items.forEach(e => {
                        reItems.push(e)
                    })
                }
            }
            rferenceItems = this.getRferenceFiledsValue(item)
            this.luaCompletionItemProviderUtils.mergeItems(reItems, rferenceItems)
        } else {
            var items: Array<LCItem> = this.luaCompletionItemProviderUtils.getCompletionByModulePath(item.refClazz)
            items.forEach(e => {
                reItems.push(e)
            })
        }
        rferenceItems = this.getReferenceCompletionValue(item)
        this.luaCompletionItemProviderUtils.mergeItems(reItems, rferenceItems)
        rferenceItems = this.luaCompletionItemFunControler.getReferenceCompletionFunValue(item)
        this.luaCompletionItemProviderUtils.mergeItems(reItems, rferenceItems)
        return reItems
    }


    /**
     *  //require(mopath.path1)
     * 查找require 的返回值 路径为一个变量
    */
    public getRferenceFiledsValue(item: LCItem): Array<LCItem> {
        if (item.requireReferenceFileds) {
            var requireReferenceItems: Array<LCItem> = new Array<LCItem>();
            item.requireReferenceFileds.forEach((v, k) => {
                var ritems: Array<LCItem> = this.getReferenceValueByKeysAndFuncName(item, k, v)
                if (ritems) {
                    this.luaCompletionItemProviderUtils.mergeItems(requireReferenceItems, ritems)
                }
            })
            var items: Array<LCItem> = this.getRferenceFiledsStr(requireReferenceItems)
            return items
        }
        return null
    }

    /**
     * 查找require 的返回值 路径为一个变量 的变量值
     */
    public getRferenceFiledsStr(requireReferenceItems: Array<LCItem>) {
        var reItems: Array<LCItem> = new Array<LCItem>();
        for (var index = 0; index < requireReferenceItems.length; index++) {
            var element = requireReferenceItems[index];
            if (element.refString) {
                var items: Array<LCItem> = this.luaCompletionItemProviderUtils.getCompletionByModulePath(element.refString)
                if (items) {
                    items.forEach(e => {
                        reItems.push(e)
                    })
                }
            } else {
                //如果不是需要再进行查找
                var valueItems: Array<LCItem> = this.checkReferenceValue(element)
                if (valueItems) {
                    var items: Array<LCItem> = this.getRferenceFiledsStr(valueItems)
                    this.luaCompletionItemProviderUtils.mergeItems(reItems, items)
                }
            }
        }
        return reItems
    }

    /**
     *  local data = data1
     * 获取 一个变量是另外一个变量赋值的 变量集合
     */
    public getReferenceCompletionValue(item: LCItem): Array<LCItem> {
        // if(item.referenceCompletionKeys){
        if (item.refField) {
            var requireReferenceItems: Array<LCItem> = new Array<LCItem>();
            item.refField.forEach((v, k) => {
                var keys: Array<string> = new Array<string>();
                for (var index = 0; index < v.length - 1; index++) {
                    var key = v[index];
                    keys.push(key)
                }
                if (keys.length == 0) {
                    keys = v
                }
                var valueFunName: string = v[v.length - 1]
                var funNames: Array<string> = this.getFunNames(k)
                var citems: Array<LCItem> = new Array<LCItem>();
                this.getCompletionsByKeysAndFuncNames(item.uri, keys.reverse(), funNames, citems, false)
                citems.forEach(v1 => {
                    if (v1.label == valueFunName) {
                        requireReferenceItems.push(v1)
                    }
                })
            })
            return requireReferenceItems
        }
        return null
    }

    public getFirstCompletionInfo(file: LFile, key: string, funNames: Array<string>): LCItem {
        //先
        //  LuaParse.lp.luaInfoManager.fileCompletionItemManagers.forEach((v,f)=>{
        //     v.luaGolbalCompletionInfo
        //  })
        for (var index = 0; index < funNames.length; index++) {
            var funName = funNames[index];
            var funCompletionItem: LCItem = file.funcFields.get(funName)
            if (funCompletionItem) {
                //找到root 的item
                var item: LCItem = funCompletionItem.getItemByKey(key, false)
                if (item) {
                    return item;
                }
            }
        }
        var item = file.locals.getItemByKey(key, true)
        if (item == null) {
            item = file.fields.getItemByKey(key, true)
        }
        if (item) {
            return item;
        }
    }

    public getCompletionByItemIndexOfKey(file: LFile, key: string, funNames: Array<string>): Array<LCItem> {
        return null
    }

    /**
     * 获得不重复的的 Completion
     * @param item 
     * @param key 
     * @param cItems 
     */
    public getCompletionAloneByItemIndexOfKey(item: LCItem,
        key: string,
        cItems: Array<LCItem>) {
        key = key.toLowerCase();
        item.items.forEach((v) => {
            if (cItems.indexOf(v) == -1) {
                cItems.push(v)
            }
        })
    }

    public getFunNames(funName: string): Array<string> {
        var funNames: Array<string> = new Array<string>()
        if (funName.indexOf("->") > -1) {
            var fnames: Array<string> = funName.split("->")
            for (var index = 0; index < fnames.length; index++) {
                var fname = ""
                for (var j = 0; j <= index; j++) {
                    fname += fnames[j] + "->";
                }
                fname = fname.substring(0, fname.length - 2)
                funNames.push(fname)
            }
        } else {
            funNames.push(funName)
        }
        return funNames
    }

}