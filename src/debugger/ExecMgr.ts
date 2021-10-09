import child_process = require('child_process')
import * as  fs from "fs"
import * as  path from "path"
import * as rd from "rd"

export class ExecMgr {
    public args: any

    constructor(args) {
        this.args = args
    }

    private execLua51(localRoot: string) {
        let fileName = process.argv[1]
        let fileInfos = fileName.split("out")
        let debugPath = path.join(fileInfos[0], "res/debug/adapter")
        debugPath = debugPath.replace(/\\/g, "/")
        localRoot = localRoot.replace(/\\/g, "/")
        let pathStr = ""
        if (process.platform == "darwin" || process.platform == "linux") {
            rd.eachFileFilterSync(path.join(fileInfos[0], "res/debug", process.platform), (f): boolean => {
                fs.chmodSync(f, "777")
                return true
            })
            let cpath = path.join(fileInfos[0], "res/debug", process.platform, "?.so")
            pathStr += "package.cpath = '" + cpath + "'"
        }
        pathStr += "package.path = package.path .. ';" + debugPath + "/?.lua;" + localRoot + "/?.lua'"
        pathStr += "print(package.path)"
        pathStr += "require('LuaDebug')('localhost'," + this.args.port + ")"
        let main: string = this.args.mainFile
        main = path.relative(localRoot, main)
        main = main.replace(/\\/g, "/")
        if (main.endsWith(".lua")) main = main.substring(0, main.length - 4)
        pathStr += "require('" + main + "')"
        let luaExePath = path.join(fileInfos[0], "res/debug", process.platform, "lua")
        if (this.args.exePath) luaExePath = this.args.exePath
        let luaStartProc = child_process.exec(luaExePath + ' -e "' + pathStr + '"')
        return luaStartProc
    }

    private execCocos(localRoot: string) {
        let options = {
            encoding: 'utf8',
            shell: true
        }
        let args: any = this.args.commandLine
        if (args == null) {
            let file = path.join(localRoot, this.args.mainFile)
            file = path.normalize(file)
            args = [
                "-workdir " + localRoot,
                "-file " + file
            ]
        }
        if (typeof (args) == "string") {
            args = [args]
        }
        let exePath = path.normalize(this.args.exePath)
        exePath = exePath.replace(/ /g, "\\ ")
        let luaStartProc = child_process.spawn(exePath, args, options)
        return luaStartProc
    }

    private execShell() {
        let luaStartProc = child_process.exec(this.args.shellFile, { cwd: path.dirname(this.args.shellFile) })
        return luaStartProc
    }

    public exec() {
        let os = process.platform
        let luaStartProc
        let runtimeType = this.args.runtimeType
        let localRoot = path.normalize(this.args.localRoot)
        if (runtimeType == "Shell") {
            luaStartProc = this.execShell()
        } else {
            if (os == "linux") {
            } else if (os == "darwin") {
                if (runtimeType == "Cocos2" || runtimeType == "Cocos3") {
                    luaStartProc = this.execCocos(localRoot)
                } else if (runtimeType == "Lua51") {
                    luaStartProc = this.execLua51(localRoot)
                }
            } else if (os == "win32") {
                if (runtimeType == "Lua51") {
                    luaStartProc = this.execLua51(localRoot)
                } else if (runtimeType == "Cocos2" || runtimeType == "Cocos3") {
                    luaStartProc = this.execCocos(localRoot)
                }
            }
        }
        return luaStartProc
    }
}