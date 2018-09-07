import { LCItem } from "../provider/LCItem"
import { CompletionItem, CompletionItemKind } from "vscode"

export class LICache {
    public static ins: LICache;
    public static getIns() {
        if (LICache.ins == null) {
            LICache.ins = new LICache();
        }
        return LICache.ins;
    }
    private infos: Array<CompletionItem>;
    public constructor() {
        this.infos = new Array<LCItem>()
    }
    public getItem(item: LCItem) {
        var newItem: CompletionItem = null;
        if (this.infos.length == 0) {
            newItem = new CompletionItem(item.funLable, CompletionItemKind.Function);
        } else {
            newItem = this.infos.pop();
        }
        newItem.label = item.funLable;
        newItem.documentation = item.documentation;
        newItem.insertText = item.funvSnippetString == null ? item.funLable : item.funvSnippetString;
        return newItem;
    }
    public pushItems(items: Array<CompletionItem>) {
        items.forEach(v => {
            this.infos.push(v)
        })
    }

}
