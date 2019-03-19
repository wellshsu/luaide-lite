import { CompletionItem, CompletionItemKind, window } from 'vscode'
import { LFrag, LToken, LTT, LComment, LRange, LET, LError, LFT, LSymbol } from "../parser/LEntity"
import vscode = require('vscode')

export class LCItem extends CompletionItem {
    public items: Map<string, LCItem>
    public lowerCaseItems: Map<string, LCItem>
    public symbol: LSymbol
    public type: Array<number>
    public parent: LCItem
    public params: Array<string>
    public comments: Array<LComment>
    public uri: vscode.Uri
    public position: vscode.Position
    public isFunc: boolean
    public isLocal: boolean
    public isNewVar: boolean = false
    public isLocalFunc: boolean = null
    public funParentLuaCompletionInfo
    public globalUris: Array<string>
    public parentClazz: string = null
    public refClazz: string = null
    public refString: string
    public reqClazz: Array<string>
    //require 中用到的使用的是变量 记录keys 用于查找modulePath
    public requireReferenceFileds: Map<string, Array<string>>
    public refField: Map<string, Array<string>>
    public refFunc: Map<string, Array<string>>
    //  为一个function  返回值的 keys 
    public functionReturnCompletionKeys: Map<string, Array<string>>
    //注释的方法返回值 优先于 functionReturnCompletionKeys
    public funAnnotationReturnValue: string = null

    public completionFunName: string = null
    //显示fun的全
    public funLable: string = null
    public funvSnippetString: vscode.SnippetString = null
    public token: LToken = null

    constructor(label: string, kind: CompletionItemKind, uri: vscode.Uri, position: vscode.Position, isFun: boolean, token: LToken) {
        super(label, kind);
        this.isFunc = isFun
        this.documentation = ""
        this.type = new Array<number>();
        this.uri = uri;
        this.position = position;
        this.items = new Map<string, LCItem>();
        this.lowerCaseItems = new Map<string, LCItem>();
        this.token = token
    }

    public checkType(t: number) {
        for (var i: number = 0; i < this.type.length; i++) {
            if (this.type[i] == t) {
                return true
            }
        }
        return false
    }

    public setType(t: number) {
        var isAdd = true
        this.type.forEach(element => {
            if (element == t) {
                isAdd = false
                return;
            }
        });
        if (isAdd) {
            this.type.push(t);
        }
    }

    public getItems(): Map<string, LCItem> {
        return this.items
    }

    public clearItems() {
        this.items.clear();
        this.lowerCaseItems.clear();
    }

    public getItemByKey(key: string, islowerCase: boolean = false): LCItem {
        var rItem: LCItem;
        if (this.items) {
            if (this.items.has(key)) {
                rItem = this.items.get(key)
            } else if (islowerCase) {
                key = key.toLocaleLowerCase()
                if (this.lowerCaseItems.has(key)) {
                    rItem = this.lowerCaseItems.get(key)
                }
            }
        }
        return rItem
    }

    public addItem(item: LCItem) {
        item.parent = this;
        this.items.set(item.label, item)
        this.lowerCaseItems.set(item.label.toLocaleLowerCase(), item)
    }

    public delItem(key: string) {
        if (this.items.has(key)) {
            this.items.delete(key)
            this.lowerCaseItems.delete(key.toLocaleLowerCase())
        }
    }

    public delItemToGolbal(item: LCItem) {
        var citem: LCItem = this.getItemByKey(item.label)
        if (citem != null) {
            var path = item.uri.path
            var count = 0;
            if (item.items.size == 0) {
                var index = citem.globalUris.indexOf(item.uri.path)
                if (index > -1) {
                    citem.globalUris.splice(index, 1)
                }
                if (citem.globalUris.length <= 0) {
                    this.delItem(citem.label)
                }
            } else {
                item.items.forEach((v, k) => {
                    citem.delItemToGolbal(v)
                })
                if (citem.items.size == 0) {
                    this.delItem(citem.label)
                }
            }
        }
    }

    public addItemToGolbal(item: LCItem) {
        var citem: LCItem = this.getItemByKey(item.label)
        if (citem == null) {
            var newItem: LCItem = new LCItem(item.label, item.kind, null, null, false, item.token)
            citem = newItem
            this.addItem(newItem);
        }
        if (citem.globalUris == null) {
            citem.globalUris = new Array<string>()
        }
        var count = 0;
        if (citem.globalUris.length == 0) {
            citem.globalUris.push(item.uri.path)
        } else {
            item.items.forEach((v, k) => {
                citem.addItemToGolbal(v)
            })
        }
    }

    public setCompletionStringValue(value: string) {
        this.refString = value
    }

    //require 路径集合 字符串集合
    public addRequireReferencePath(path: string) {
        if (path) {
            if (this.reqClazz == null) {
                this.reqClazz = new Array<string>();
            }
            if (this.reqClazz.indexOf(path) == -1) {
                this.reqClazz.push(path)
            }
        }
    }

    //require 变量引用 用于查找 modulePath
    public addRequireReferenceFileds(functionName: string, keys: Array<string>) {
        if (this.requireReferenceFileds == null) {
            this.requireReferenceFileds = new Map<string, Array<string>>();
        }
        this.requireReferenceFileds.set(functionName, keys)
    }

    //引用其他的Completion 
    public addReferenceCompletionKeys(functionName: string, keys: Array<string>) {
        if (this.refField == null) {
            this.refField = new Map<string, Array<string>>();
        }
        if (keys != null) {
            this.refField.set(functionName, keys)
        }
    }

    //当前的值为一个方法返回值
    public addReferenceCompletionFunKeys(functionName: string, keys: Array<string>) {
        if (this.refFunc == null) {
            this.refFunc = new Map<string, Array<string>>();
        }
        if (keys != null) {
            this.refFunc.set(functionName, keys)
        }
    }

    //如果completion 为一个function 那么就记录他的返回值 当前的值为一个方法返回值
    public addFunctionReturnCompletionKeys(functionName: string, keys: Array<string>) {
        if (this.functionReturnCompletionKeys == null) {
            this.functionReturnCompletionKeys = new Map<string, Array<string>>();
        }
        if (keys != null) {
            this.functionReturnCompletionKeys.set(functionName, keys)
        }
    }
}