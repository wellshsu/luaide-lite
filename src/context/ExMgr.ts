'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const path = require("path");
const fs = require("fs");
const vscode = require("vscode");
const UpperLower_1 = require("../formater/UpperLower");
const FileFormat_1 = require("../formater/FileFormat");
const PvdTemplate_1 = require("../provider/PvdTemplate");
const PvdLuats_1 = require("../provider/PvdLuats");
const Helper_1 = require("../context/Helper");
const HighlightG_1 = require("../formater/HighlightG");
class EXMgr {
    static showAbout(e) {
        vscode.commands.executeCommand("workbench.extensions.action.showExtensionsWithId", EXMgr.extensionID.toLowerCase());
        // vscode.window.showInformationMessage(EXMgr.slogan)
    }
    static openRes(e) {
        var resDir = path.join(EXMgr.extensionPath, "res");
        Helper_1.Helper.ShowInExplorer(resDir);
    }
    static initialize(context) {
        EXMgr.focused = true;
        for (var i = 0; i < EXMgr.Commands.length; i++) {
            var define = EXMgr.Commands[i];
            vscode.commands.registerCommand(define.label, define.func);
        }
        EXMgr.Bar = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left);
        context.subscriptions.push(this.Bar);
        EXMgr.Bar.tooltip = EXMgr.slogan;
        EXMgr.Bar.command = "luaide-lite.about";
        EXMgr.Bar.text = EXMgr.extensionName;
        EXMgr.Bar.show();
        EXMgr.requireFunNames = new Array();
        EXMgr.requireFunNames.push("require");
        EXMgr.requireFunNames.push("import");
        try {
            EXMgr.extensionPath = vscode.extensions.getExtension(EXMgr.extensionID).extensionPath;
            EXMgr.parseConfig();
            EXMgr.isInit = true;
        }
        catch (err) {
            vscode.window.showErrorMessage(EXMgr.extensionName + " init error: " + err);
            console.log(err);
        }
    }
    static parseConfig() {
        var config = vscode.workspace.getConfiguration("luaide-lite");
        EXMgr.luaOperatorCheck = config.get("luaOperatorCheck");
        EXMgr.luaFunArgCheck = config.get("luaFunArgCheck");
        EXMgr.changeTextCheck = config.get("changeTextCheck");
        EXMgr.moduleFunNestingCheck = config.get("moduleFunNestingCheck");
        EXMgr.enableHighlight = config.get("enableHighlight");
        EXMgr.normalHighlightColor = config.get("highlightNormal");
        EXMgr.darkHighlightColor = config.get("highlightDark");
        EXMgr.enableFormat = config.get("enableFormat");
        EXMgr.core = config.get("core");
        EXMgr.javahome = config.get("javahome");
        EXMgr.lightParameter = config.get("theme.light.parameter");
        EXMgr.lightGlobal = config.get("theme.light.global");
        EXMgr.lightAnnotation = config.get("theme.light.annotation");
        EXMgr.darkParameter = config.get("theme.dark.parameter");
        EXMgr.darkGlobal = config.get("theme.dark.global");
        EXMgr.darkAnnotation = config.get("theme.dark.annotation");
        // single script root.
        var scriptRoot = vscode.workspace.rootPath.replace(/\\/g, "/");
        scriptRoot = scriptRoot.replace(new RegExp("/", "gm"), ".");
        scriptRoot = scriptRoot.toLowerCase();
        EXMgr.scriptRoots = new Array();
        EXMgr.scriptRoots.push(scriptRoot);
        if (EXMgr.luaOperatorCheck == null) {
            EXMgr.luaOperatorCheck = true;
        }
        if (EXMgr.luaFunArgCheck == null) {
            EXMgr.luaFunArgCheck = true;
        }
        if (EXMgr.changeTextCheck == null) {
            EXMgr.changeTextCheck = true;
        }
        if (EXMgr.enableHighlight == null) {
            EXMgr.enableHighlight = true;
        }
        if (EXMgr.normalHighlightColor == null) {
            EXMgr.normalHighlightColor = "#2B91AF";
        }
        if (EXMgr.darkHighlightColor == null) {
            EXMgr.darkHighlightColor = "#00D6AA";
        }
        if (EXMgr.enableFormat == null) {
            EXMgr.enableFormat = true;
        }
        if (EXMgr.core == null) {
            EXMgr.core = "emmy";
        }
        if (EXMgr.core == "emmy") {
            EXMgr.isLegacy = EXMgr.getJavaExe() == null ? true : false;
        }
        else {
            EXMgr.isLegacy = true;
        }
        if (EXMgr.lightParameter == null) {
            EXMgr.lightParameter = "#565656";
        }
        if (EXMgr.lightGlobal == null) {
            EXMgr.lightGlobal = "#2B91AF";
        }
        if (EXMgr.lightAnnotation == null) {
            EXMgr.lightAnnotation = "#2B91AF";
        }
        if (EXMgr.darkParameter == null) {
            EXMgr.darkParameter = "#FFFFFF";
        }
        if (EXMgr.darkGlobal == null) {
            EXMgr.darkGlobal = "#00D6AA";
        }
        if (EXMgr.darkAnnotation == null) {
            EXMgr.darkAnnotation = "#00D6AA";
        }
        EXMgr.templateDir = config.get("templateDir");
        if (EXMgr.templateDir == null || EXMgr.templateDir == "") {
            EXMgr.templateDir = EXMgr.extensionPath + "/res/template";
        }
        EXMgr.templateDefine = new Map();
        var templateDefine = config.get("templateDefine");
        if (templateDefine) {
            templateDefine.forEach((v) => {
                if ((v.name || v.key) && v.value) {
                    if (v.name) {
                        EXMgr.templateDefine.set(v.name, v.value);
                    }
                    else {
                        EXMgr.templateDefine.set(v.key, v.value);
                    }
                }
            });
        }
        EXMgr.excludes = new Array();
        var excludes = config.get("exclude");
        if (excludes) {
            excludes.forEach((v) => {
                EXMgr.excludes.push(path.normalize(path.join(vscode.workspace.rootPath, v)));
            });
        }
        EXMgr.excludesRegex = new Array();
        var excludesRegexs = config.get("excludesRegex");
        if (excludesRegexs) {
            excludesRegexs.forEach((v) => {
                EXMgr.excludesRegex.push(v);
            });
        }
        EXMgr.formatHex = config.get("formatHex");
        if (EXMgr.formatHex == null) {
            EXMgr.formatHex = true;
        }
        EXMgr.enableDiagnostic = config.get("enableDiagnostic");
        if (EXMgr.enableDiagnostic == null) {
            EXMgr.enableDiagnostic = true;
        }
        EXMgr.typescriptDefine = new Map();
        var typescriptDefine = config.get("typescriptDefine");
        if (typescriptDefine) {
            typescriptDefine.forEach((v) => {
                if ((v.name || v.key) && v.value) {
                    if (v.name) {
                        EXMgr.typescriptDefine.set(v.name, v.value);
                    }
                    else {
                        EXMgr.typescriptDefine.set(v.key, v.value);
                    }
                }
            });
        }
        HighlightG_1.HighlightG.reset();
    }
    static isFileExclude(file) {
        if (EXMgr.excludes && EXMgr.excludes.length > 0) {
            for (var i = 0; i < EXMgr.excludes.length; i++) {
                var exclude = EXMgr.excludes[i];
                if (file.indexOf(exclude) > -1) {
                    return true;
                }
            }
            return false;
        }
        else if (EXMgr.excludesRegex && EXMgr.excludesRegex.length > 0) {
            for (var i = 0; i < EXMgr.excludesRegex.length; i++) {
                var exclude = EXMgr.excludesRegex[i];
                if (file.search(exclude) > -1) {
                    return true;
                }
            }
            return false;
        }
        else {
            return false;
        }
    }
    static getJavaExe() {
        try {
            if (process.platform == "win32") {
                if (EXMgr.javahome != null) {
                    return path.join(EXMgr.javahome, "bin/java.exe");
                }
                if ("JAVA_HOME" in process.env) {
                    let javaHome = process.env.JAVA_HOME;
                    let javaPath = path.join(javaHome, "bin/java.exe");
                    return javaPath;
                }
                if ("PATH" in process.env) {
                    let PATH = process.env.PATH;
                    let paths = PATH.split(";");
                    let pathCount = paths.length;
                    for (let i = 0; i < pathCount; i++) {
                        let javaPath = path.join(paths[i], "bin/java.exe");
                        if (fs.existsSync(javaPath)) {
                            return javaPath;
                        }
                    }
                }
            }
        }
        catch (_a) {
        }
        return null;
    }
}
EXMgr.extensionID = "wellshsu.luaide-lite";
EXMgr.extensionName = "luaide-lite";
EXMgr.slogan = "Lite and free, but more professional.";
EXMgr.LUA_MODE = { language: "lua", scheme: "file" };
EXMgr.LANGUAGE_ID = "lua";
EXMgr.maxFileSize = 2048;
EXMgr.changeTextCheck = true;
EXMgr.isInit = false;
EXMgr.enableHighlight = true;
EXMgr.normalHighlightColor = "#2B91AF";
EXMgr.darkHighlightColor = "#00D6AA";
EXMgr.enableFormat = true;
EXMgr.core = "emmy";
EXMgr.lightParameter = "#565656";
EXMgr.lightGlobal = "#2B91AF";
EXMgr.lightAnnotation = "#2B91AF";
EXMgr.darkParameter = "#FFFFFF";
EXMgr.darkGlobal = "#00D6AA";
EXMgr.darkAnnotation = "#00D6AA";
EXMgr.isLegacy = false;
EXMgr.Commands = [
    { label: "luaide-lite.toUpperCase", desc: 'Shift chars to uppercase', func: UpperLower_1.UpperLower.toUpperCase },
    { label: "luaide-lite.toLowerCase", desc: 'Shift carrs to lowercase', func: UpperLower_1.UpperLower.toLowerCase },
    { label: "luaide-lite.formatFiles", desc: 'Format file(s)', func: FileFormat_1.FileFormat.process },
    { label: "luaide-lite.createTemplate", desc: 'Create template', func: PvdTemplate_1.PvdTemplate.process },
    { label: "luaide-lite.convertTsFile", desc: 'Translate lua to typescript', func: PvdLuats_1.PvdLuats.processFile },
    { label: "luaide-lite.convertTsText", desc: 'Convert lua to typescript', func: PvdLuats_1.PvdLuats.processText },
    { label: "luaide-lite.openRes", desc: 'Open res folder', func: EXMgr.openRes },
    { label: "luaide-lite.about", desc: 'About luaide-lite', func: EXMgr.showAbout },
];
exports.EXMgr = EXMgr;
//# sourceMappingURL=EXMgr.js.map