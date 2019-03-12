import child_process = require('child_process')
var fs = require('fs')
var path = require('path')
var os = require('os')
var rd = require("rd")
import { LuaDebug } from './LuaDebug'
import { ChildProcess } from 'child_process'

export class ExecMgr {
    public args: any;
    private luaDebug: LuaDebug;

    constructor(args, luaDebug) {
        this.args = args;
        var os = process.platform;
        var runtimeType = args.runtimeType;
        this.luaDebug = luaDebug;
    }

    private execLua51(localRoot) {
        var fileName = process.argv[1];
        var fileInfos = fileName.split("out");
        var debugPath = path.join(fileInfos[0], "res/debug/adapter");
        debugPath = debugPath.replace(/\\/g, "/");
        localRoot = localRoot.replace(/\\/g, "/");
        var pathStr = "";
        if (process.platform == "darwin" || process.platform == "linux") {
            rd.eachFileFilterSync(path.join(fileInfos[0], "res/debug", process.platform), function (f, s) {
                fs.chmodSync(f, "777")
            });
            var cpath = path.join(fileInfos[0], "res/debug", process.platform, "?.so");
            pathStr += "package.cpath = '" + cpath + "';";
        }
        pathStr += "package.path = package.path .. ';" + debugPath + "/?.lua;" + localRoot + "/?.lua;'";
        pathStr += "print(package.path)";
        pathStr += "require('LuaDebug')('localhost'," + this.args.port + ")";
        var main: string = this.args.mainFile
        if (main.endsWith(".lua")) {
            main = main.substring(0, main.length - 4)
        }
        pathStr += "require('" + main + "')";
        var options = {
            encoding: 'utf8',
            shell: true
        };
        var luaExePath = path.join(fileInfos[0], "res/debug", process.platform, "lua");
        if(this.args.exePath){
            luaExePath = this.args.exePath;
        }
        var luaStartProc = child_process.exec(luaExePath + ' -e "' + pathStr + '"');
        return luaStartProc;
    }

    private execCocos(localRoot) {
        var options = {
            encoding: 'utf8',
            shell: true
        };
        var args: any = this.args.commandLine
        if (args == null) {
            var file = path.join(localRoot, this.args.mainFile)
            file = path.normalize(file)
            args = [
                "-workdir " + localRoot,
                "-file " + file
            ]
        }
        if (typeof (args) == "string") {
            args = [args]
        }
        var exePath = path.normalize(this.args.exePath)
        exePath = exePath.replace(/ /g, "\\ ")
        var luaStartProc = child_process.spawn(exePath, args, options)
        return luaStartProc
    }

    private execShell() {
        var baseChildProcess = this;
        var luaStartProc = child_process.exec(this.args.shellFile, { cwd: path.dirname(this.args.shellFile) });
        return luaStartProc;
    }

    public exec() {
        var os = process.platform;
        var luaStartProc;
        var runtimeType = this.args.runtimeType;
        var localRoot = path.normalize(this.args.localRoot);
        var baseChildProcess = this;
        var options = null;
        if (runtimeType == "Shell") {
            luaStartProc = this.execShell();
        }
        else {
            if (os == "linux") {
            }
            else if (os == "darwin") {
                if (runtimeType == "Cocos2" || runtimeType == "Cocos3") {
                    luaStartProc = this.execCocos(localRoot);
                }
                else if (runtimeType == "Lua51") {
                    luaStartProc = this.execLua51(localRoot);
                }
            }
            else if (os == "win32") {
                if (runtimeType == "Lua51") {
                    luaStartProc = this.execLua51(localRoot);
                }
                else if (runtimeType == "Cocos2" || runtimeType == "Cocos3") {
                    luaStartProc = this.execCocos(localRoot);
                }
            }
        }
        return luaStartProc;
    }
}
