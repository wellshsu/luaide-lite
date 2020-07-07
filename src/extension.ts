import vscode = require("vscode")
import { ExtMgr } from "./context/ExtMgr"
import { LegacyMgr } from "./context/LegacyMgr"
import { EmmyMgr } from "./context/EmmyMgr"

export function activate(context: vscode.ExtensionContext) {
	if (ExtMgr.initialize(context)) {
		if (ExtMgr.isLegacy) {
			LegacyMgr.activate(context)
		} else {
			EmmyMgr.activate(context)
		}
	}
}

export function deactivate() {
	if (ExtMgr.isLegacy) {
		LegacyMgr.deactivate()
	} else {
		EmmyMgr.deactivate()
	}
}