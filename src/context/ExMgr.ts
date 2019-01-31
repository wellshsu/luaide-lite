'use strict';

import * as path from 'path'
import * as fs from 'fs'
import { ExtensionContext } from 'vscode'
import vscode = require('vscode')
import { UpperLower } from '../formater/UpperLower'
import { FileFormat } from "../formater/FileFormat"
import { PvdTemplate } from '../provider/PvdTemplate'
import { PvdLuats } from '../provider/PvdLuats';
import { Helper } from "../context/Helper"
import { HighlightG } from '../formater/HighlightG';

export class EXMgr {
    public static extensionID = "wellshsu.luaide-lite"
    public static extensionName = "luaide-lite"
    public static slogan = "Lite and free, but more professional."
    public static LUA_MODE: vscode.DocumentFilter = { language: "lua", scheme: "file" }
    public static LANGUAGE_ID = "lua";

    public static luaOperatorCheck: boolean
    public static luaFunArgCheck: boolean
    public static extensionPath: string
    public static maxFileSize: number = 2048
    public static changeTextCheck: boolean = true
    public static moduleFunNestingCheck: boolean
    public static requireFunNames: Array<string>
    public static scriptRoots: Array<string>
    public static isInit: boolean = false
    public static enableHighlight: boolean = true
    public static normalHighlightColor: string = "#2B91AF"
    public static darkHighlightColor: string = "#00D6AA"
    public static enableFormat: boolean = true
    public static templateDir: string
    public static templateDefine: Map<string, string>
    public static excludes: Array<string>
    public static formatHex: boolean
    public static enableDiagnostic: boolean
    public static typescriptDefine: Map<string, string>
    public static core: string = "emmy"
    public static javahome: string
    public static lightParameter: string = "#565656"
    public static lightGlobal: string = "#2B91AF"
    public static lightAnnotation: string = "#2B91AF"
    public static darkParameter: string = "#FFFFFF"
    public static darkGlobal: string = "#00D6AA"
    public static darkAnnotation: string = "#00D6AA"

    public static isLegacy: boolean = false
    public static focused: boolean
    public static Bar: vscode.StatusBarItem;
    public static Commands = [
        { label: "luaide-lite.toUpperCase", desc: 'Shift chars to uppercase', func: UpperLower.toUpperCase },
        { label: "luaide-lite.toLowerCase", desc: 'Shift carrs to lowercase', func: UpperLower.toLowerCase },
        { label: "luaide-lite.formatFiles", desc: 'Format file(s)', func: FileFormat.process },
        { label: "luaide-lite.createTemplate", desc: 'Create template', func: PvdTemplate.process },
        { label: "luaide-lite.convertTsFile", desc: 'Translate lua to typescript', func: PvdLuats.processFile },
        { label: "luaide-lite.convertTsText", desc: 'Convert lua to typescript', func: PvdLuats.processText },
        { label: "luaide-lite.openRes", desc: 'Open res folder', func: EXMgr.openRes },
        { label: "luaide-lite.about", desc: 'About luaide-lite', func: EXMgr.showAbout },
    ];

    public static showAbout(e) {
        vscode.commands.executeCommand("workbench.extensions.action.showExtensionsWithId", EXMgr.extensionID.toLowerCase())
        // vscode.window.showInformationMessage(EXMgr.slogan)
    }

    public static openRes(e) {
        var resDir = path.join(EXMgr.extensionPath, "res")
        Helper.ShowInExplorer(resDir)
    }

    public static initialize(context: ExtensionContext) {
        EXMgr.focused = true
        for (var i = 0; i < EXMgr.Commands.length; i++) {
            var define = EXMgr.Commands[i]
            vscode.commands.registerCommand(define.label, define.func)
        }
        EXMgr.Bar = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left)
        context.subscriptions.push(this.Bar);
        EXMgr.Bar.tooltip = EXMgr.slogan
        EXMgr.Bar.command = "luaide-lite.about"
        EXMgr.Bar.text = EXMgr.extensionName
        EXMgr.Bar.show();

        EXMgr.requireFunNames = new Array<string>();
        EXMgr.requireFunNames.push("require")
        EXMgr.requireFunNames.push("import")
        try {
            EXMgr.extensionPath = vscode.extensions.getExtension(EXMgr.extensionID).extensionPath
            EXMgr.parseConfig();
            EXMgr.isInit = true;
        } catch (err) {
            vscode.window.showErrorMessage(EXMgr.extensionName + " init error: " + err);
            console.log(err)
        }
    }

    public static parseConfig() {
        var config: vscode.WorkspaceConfiguration = vscode.workspace.getConfiguration("luaide-lite")
        EXMgr.luaOperatorCheck = config.get<boolean>("luaOperatorCheck")
        EXMgr.luaFunArgCheck = config.get<boolean>("luaFunArgCheck")
        EXMgr.changeTextCheck = config.get<boolean>("changeTextCheck")
        EXMgr.moduleFunNestingCheck = config.get<boolean>("moduleFunNestingCheck")
        EXMgr.enableHighlight = config.get<boolean>("enableHighlight")
        EXMgr.normalHighlightColor = config.get<string>("highlightNormal")
        EXMgr.darkHighlightColor = config.get<string>("highlightDark")
        EXMgr.enableFormat = config.get<boolean>("enableFormat")
        EXMgr.core = config.get<string>("core")
        EXMgr.javahome = config.get<string>("javahome")
        EXMgr.lightParameter = config.get<string>("theme.light.parameter")
        EXMgr.lightGlobal = config.get<string>("theme.light.global")
        EXMgr.lightAnnotation = config.get<string>("theme.light.annotation")
        EXMgr.darkParameter = config.get<string>("theme.dark.parameter")
        EXMgr.darkGlobal = config.get<string>("theme.dark.global")
        EXMgr.darkAnnotation = config.get<string>("theme.dark.annotation")
        // single script root.
        var scriptRoot = vscode.workspace.rootPath.replace(/\\/g, "/");
        scriptRoot = scriptRoot.replace(new RegExp("/", "gm"), ".")
        scriptRoot = scriptRoot.toLowerCase();
        EXMgr.scriptRoots = new Array<string>();
        EXMgr.scriptRoots.push(scriptRoot);

        if (EXMgr.luaOperatorCheck == null) {
            EXMgr.luaOperatorCheck = true;
        }
        if (EXMgr.luaFunArgCheck == null) {
            EXMgr.luaFunArgCheck = true
        }
        if (EXMgr.changeTextCheck == null) {
            EXMgr.changeTextCheck = true
        }
        if (EXMgr.enableHighlight == null) {
            EXMgr.enableHighlight = true
        }
        if (EXMgr.normalHighlightColor == null) {
            EXMgr.normalHighlightColor = "#2B91AF"
        }
        if (EXMgr.darkHighlightColor == null) {
            EXMgr.darkHighlightColor = "#00D6AA"
        }
        if (EXMgr.enableFormat == null) {
            EXMgr.enableFormat = true
        }
        if (EXMgr.core == null) {
            EXMgr.core = "emmy"
        }
        if (EXMgr.core == "emmy") {
            EXMgr.isLegacy = EXMgr.getJavaExe() == null ? true : false
        } else {
            EXMgr.isLegacy = true
        }
        if (EXMgr.lightParameter == null) {
            EXMgr.lightParameter = "#565656"
        }
        if (EXMgr.lightGlobal == null) {
            EXMgr.lightGlobal = "#2B91AF"
        }
        if (EXMgr.lightAnnotation == null) {
            EXMgr.lightAnnotation = "#2B91AF"
        }
        if (EXMgr.darkParameter == null) {
            EXMgr.darkParameter = "#FFFFFF"
        }
        if (EXMgr.darkGlobal == null) {
            EXMgr.darkGlobal = "#00D6AA"
        }
        if (EXMgr.darkAnnotation == null) {
            EXMgr.darkAnnotation = "#00D6AA"
        }

        EXMgr.templateDir = config.get<string>("templateDir")
        if (EXMgr.templateDir == null || EXMgr.templateDir == "") {
            EXMgr.templateDir = EXMgr.extensionPath + "/res/template"
        }
        EXMgr.templateDefine = new Map<string, string>()
        var templateDefine: Array<any> = config.get<Array<any>>("templateDefine")
        if (templateDefine) {
            templateDefine.forEach((v) => {
                if ((v.name || v.key) && v.value) {
                    if (v.name) {
                        EXMgr.templateDefine.set(v.name, v.value)
                    } else {
                        EXMgr.templateDefine.set(v.key, v.value)
                    }
                }
            })
        }

        EXMgr.excludes = new Array<string>()
        var excludes: Array<string> = config.get<Array<string>>("exclude");
        if (excludes) {
            excludes.forEach((v) => {
                EXMgr.excludes.push(path.normalize(path.join(vscode.workspace.rootPath, v)))
            })
        }

        EXMgr.formatHex = config.get<boolean>("formatHex")
        if (EXMgr.formatHex == null) {
            EXMgr.formatHex = true
        }

        EXMgr.enableDiagnostic = config.get<boolean>("enableDiagnostic")
        if (EXMgr.enableDiagnostic == null) {
            EXMgr.enableDiagnostic = true
        }

        EXMgr.typescriptDefine = new Map<string, string>()
        var typescriptDefine: Array<any> = config.get<Array<any>>("typescriptDefine")
        if (typescriptDefine) {
            typescriptDefine.forEach((v) => {
                if ((v.name || v.key) && v.value) {
                    if (v.name) {
                        EXMgr.typescriptDefine.set(v.name, v.value)
                    } else {
                        EXMgr.typescriptDefine.set(v.key, v.value)
                    }
                }
            })
        }

        HighlightG.reset()
    }

    public static isFileExclude(file: string): boolean {
        if (EXMgr.excludes && EXMgr.excludes.length > 0) {
            for (var i = 0; i < EXMgr.excludes.length; i++) {
                var exclude = EXMgr.excludes[i]
                if (file.indexOf(exclude) > -1) {
                    return true
                }
            }
            return false
        } else {
            return false
        }
    }

    public static getJavaExe(): string {
        try {
            if (process.platform == "win32") {
                if (EXMgr.javahome != null) {
                    return path.join(EXMgr.javahome, "bin/java.exe")
                }
                if ("JAVA_HOME" in process.env) {
                    let javaHome = <string>process.env.JAVA_HOME
                    let javaPath = path.join(javaHome, "bin/java.exe")
                    return javaPath
                }
                if ("PATH" in process.env) {
                    let PATH = <string>process.env.PATH
                    let paths = PATH.split(";")
                    let pathCount = paths.length
                    for (let i = 0; i < pathCount; i++) {
                        let javaPath = path.join(paths[i], "bin/java.exe")
                        if (fs.existsSync(javaPath)) {
                            return javaPath
                        }
                    }
                }
            }
        } catch{
        }
        return null
    }
}