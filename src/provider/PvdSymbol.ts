import vscode = require('vscode')
import { LParse } from '../parser/LParse'

export class PvdSymbol implements vscode.DocumentSymbolProvider {

	private goKindToCodeKind: { [key: string]: vscode.SymbolKind } = {
		'package': vscode.SymbolKind.Package,
		'import': vscode.SymbolKind.Namespace,
		'variable': vscode.SymbolKind.Variable,
		'type': vscode.SymbolKind.Interface,
		'function': vscode.SymbolKind.Function
	};

	public provideDocumentSymbols(document: vscode.TextDocument,
		token: vscode.CancellationToken):
		Thenable<vscode.SymbolInformation[]> {
		let options = { fileName: document.fileName };
		return new Promise<vscode.SymbolInformation[]>((resolve, reject) => {
			return resolve(LParse.ins.fileMgr.getFileByPath(document.uri.path).symbols);
		})
	}
}
