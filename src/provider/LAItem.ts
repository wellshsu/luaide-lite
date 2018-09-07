import { CompletionItem, CompletionItemKind, TextDocument } from 'vscode'
export class LAItem {
    public static CompletionDesc = [
        {
            name: "@type",
            comment: "",
            insertText: "type"
        },
        {
            name: "@class",
            comment: "",
            insertText: "class"
        },
        {
            name: "@field",
            comment: "",
            insertText: "field"
        },
        {
            name: "@language",
            comment: "",
            insertText: "language"
        },
        {
            name: "@module",
            comment: "",
            insertText: "module"
        },
        {
            name: "@overload",
            comment: "",
            insertText: "overload"
        },
        {
            name: "@param",
            comment: "",
            insertText: "param"
        },
        {
            name: "@private",
            comment: "",
            insertText: "private"
        },
        {
            name: "@protected",
            comment: "",
            insertText: "protected"
        },
        {
            name: "@public",
            comment: "",
            insertText: "public"
        },
        {
            name: "@return",
            comment: "",
            insertText: "return"
        },
        {
            name: "@see",
            comment: "",
            insertText: "see"
        },
    ]

    public static ins: LAItem;

    public static Ins() {
        if (LAItem.ins == null) {
            LAItem.ins = new LAItem();
        }
        return LAItem.ins;
    }

    public getItems(prefix: string): Array<CompletionItem> {
        var items = new Array<CompletionItem>()
        LAItem.CompletionDesc.forEach((desc) => {
            var item: CompletionItem = new CompletionItem(desc.name, CompletionItemKind.Property)
            item.documentation = desc.comment;
            item.insertText = desc.insertText;
            items.push(item)
        })
        return items
    }

}