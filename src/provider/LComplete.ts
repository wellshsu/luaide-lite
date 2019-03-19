import vscode = require('vscode')
import { LCItem } from "./LCItem"
import { LGItem } from "./LGItem"
import { LParse } from "../parser/LParse"
import { LFile } from "./LFile"
import { LFItem } from "./LFItem"
import { LFileMgr } from './LFileMgr';

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