import { DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, OutputEvent, Event, Thread, StackFrame, Scope, Source, Breakpoint } from 'vscode-debugadapter'
import { DebugProtocol } from 'vscode-debugprotocol'
import { readFileSync } from 'fs'
import { basename } from 'path'
import child_process = require('child_process')
const fs = require('fs')
const ospath = require('path')
var os = require('os')
import { BPMgr } from "./BPMgr"
import { EventEmitter } from 'events'
import { NetMgr, LuaDebuggerEvent, ClientStatus } from './NetMgr'
import { ScopeMgr, LuaDebugVarInfo } from './ScopeMgr'
import { ExecMgr } from "./ExecMgr"

export enum DebugMode {

	launch,
	attach
}

export class LuaDebug extends DebugSession {
	private netMgr: NetMgr
	private bpMgr: BPMgr
	private bpID = 1000
	private luaStartProc: child_process.ChildProcess
	public fileExtname: string
	public runtimeType: string
	public localRoot: string
	public isHitBreak: boolean
	public printDate: boolean
	public printType: number
	public exConfig: any
	private scopeMgr: ScopeMgr
	private pathMaps: Map<string, Array<string>>
	private lastStackReqTime = -1

	get breakPointData(): BPMgr {
		return this.bpMgr
	}

	public constructor() {
		super()
		this.fileExtname = ".lua"
		this.setDebuggerLinesStartAt1(true)
		this.setDebuggerColumnsStartAt1(false)
	}

	protected initializeRequest(response: DebugProtocol.InitializeResponse, args: DebugProtocol.InitializeRequestArguments): void {
		this.sendEvent(new InitializedEvent())
		response.body = response.body || {}
		response.body.supportsSetVariable = false
		response.body.supportsConfigurationDoneRequest = true
		response.body.supportsFunctionBreakpoints = true
		response.body.supportsConditionalBreakpoints = true
		response.body.supportsRestartFrame = true
		response.body.supportsCompletionsRequest = true
		response.body.supportsExceptionInfoRequest = true
		response.body.supportsDelayedStackTraceLoading = true
		response.body.supportsEvaluateForHovers = true
		this.sendResponse(response)

		//初始化断点信息
		this.bpMgr = new BPMgr(this)
		this.pathMaps = new Map<string, Array<string>>()
		var luaDebug: LuaDebug = this
		this.on("close", function () {
			luaDebug.netMgr.close()
		})
	}

	protected setupProcessHanlders() {
		this.netMgr.on('C2S_HITBreakPoint', result => {
			this.scopeMgr.setStackInfos(result.data.stack)
			this.sendEvent(new StoppedEvent('breakpoint', 1))
		})
		this.netMgr.on('C2S_LuaPrint', result => {
			var content = new Buffer(result.data.msg, 'base64').toString('utf8')
			if (this.printDate) {
				content = this.FormatDate(new Date(), "[yyyy-MM-dd hh:mm:ss] ") + content;
			}
			if (result.data.type == 1) {
				this.sendEvent(new OutputEvent(content + "\n", 'stdout'))
			}
			else if (result.data.type == 2) {
				this.sendEvent(new OutputEvent(content + "\n", 'console'))
			}
			else if (result.data.type == 3) {
				this.sendEvent(new OutputEvent(content + "\n", 'stderr'))
			}
			else {
				this.sendEvent(new OutputEvent(content + "\n"))
			}
		})
	}

	protected launchRequest(response: DebugProtocol.LaunchResponse, args: any): void {
		var result = this.checkArgs(args)
		if (result != true) {
			this.sendErrorResponse(response, 2001, result)
			return
		}
		this.localRoot = args.localRoot
		this.printDate = args.printDate
		this.printType = args.printType
		this.runtimeType = args.runtimeType
		this.initPathMaps(args.scripts)
		if (args.port == null) {
			args.port = this.calculatePort()
		}
		this.printType = args.printType
		var proc = new ExecMgr(args, this)

		this.netMgr = new NetMgr(this, DebugMode.launch, args)
		this.scopeMgr = new ScopeMgr(this.netMgr, this)
		//注册事件
		this.setupProcessHanlders()
		if (this.luaStartProc) {
			this.luaStartProc.kill()
		}
		this.sendResponse(response)
		this.luaStartProc = proc.exec()
		this.luaStartProc.on('error', error => {
			this.sendEvent(new OutputEvent("Process error: " + error.message + "\n"))
		})
		this.luaStartProc.stderr.setEncoding('utf8')
		this.luaStartProc.stderr.on('data', error => {
			luadebug.sendEvent(new OutputEvent(error + "\n"))
		})
		var luadebug: LuaDebug = this
		//关闭事件
		var self = this
		this.luaStartProc.on('close', function (code) {
			if (luadebug.netMgr) {
				luadebug.netMgr.sendMsg(LuaDebuggerEvent.S2C_DebugClose)
			}
			luadebug.sendEvent(new TerminatedEvent())
		})
		this.initEXCfg()
	}

	protected attachRequest(response: DebugProtocol.AttachResponse, args: any): void {
		if (args.fileExtname != null) {
			this.fileExtname = args.fileExtname
		}
		this.localRoot = args.localRoot
		this.runtimeType = args.runtimeType
		this.printDate = args.printDate
		this.printType = args.printType
		this.initPathMaps(args.scripts)
		if (args.port == null) {
			args.port = this.calculatePort()
		}
		this.netMgr = new NetMgr(this, DebugMode.attach, args)
		this.scopeMgr = new ScopeMgr(this.netMgr, this)
		//注册事件
		this.setupProcessHanlders()
		this.sendResponse(response)
		this.initEXCfg()
	}

	protected disconnectRequest(response: DebugProtocol.DisconnectResponse, args: DebugProtocol.DisconnectArguments): void {
		this.sendEvent(new OutputEvent("Server is shutdown.\n"))
		if (this.luaStartProc) {
			this.luaStartProc.kill("SIGUP")
		}
		super.disconnectRequest(response, args)
	}

	protected setBreakPointsRequest(response: DebugProtocol.SetBreakpointsResponse, args: DebugProtocol.SetBreakpointsArguments): void {
		var path = args.source.path
		path = path.substring(0, 1).toLowerCase() + path.substring(1, path.length)
		var lines = args.lines
		var bps = this.bpMgr.verifiedBreakPoint(path, lines, args.breakpoints)
		response.body = {
			breakpoints: bps
		}
		if (this.netMgr != null && this.netMgr.getSocketState() == ClientStatus.connected) {
			var data = this.bpMgr.getClientBreakPointInfo(path)
			this.netMgr.sendMsg(LuaDebuggerEvent.S2C_SetBreakPoints, data ? [data] : null, this.isHitBreak == true ? this.netMgr.mainSocket : this.netMgr.breakPointSocket);
		}
		this.sendResponse(response)
	}

	protected threadsRequest(response: DebugProtocol.ThreadsResponse): void {
		response.body = {
			threads: [
				new Thread(1, "thread 1")
			]
		}
		this.sendResponse(response)
	}

	protected stackTraceRequest(response: DebugProtocol.StackTraceResponse, args: DebugProtocol.StackTraceArguments): void {
		let currentTime = Date.now()
		if ((currentTime - this.lastStackReqTime) > 500) {
			this.lastStackReqTime = currentTime
			var stackInfos: Array<any> = this.scopeMgr.getStackInfos()
			const frames = new Array<StackFrame>()
			for (var i = 0; i < stackInfos.length; i++) {
				var info = stackInfos[i];
				var _file: string = info.src
				if (_file.endsWith("/lua")) {
					_file = _file.replace("/lua", this.fileExtname)
				}
				else if (_file == "=[C]") {
					_file = ospath.join(os.tmpdir(), "=[C]")
					_file = _file.replace(/\\/g, "/")
					try {
						if (fs.existsSync(_file)) {
							fs.unlinkSync(_file)
						}
						let json = JSON.stringify(info)
						fs.writeFileSync(_file, json)
					} catch (e) { }
				} else {
					if (_file.indexOf(this.fileExtname) == -1) {
						_file = _file + this.fileExtname
					}
					_file = this.convertToServerPath(_file)
				}
				if (_file != null && _file != "") {
					var tname = _file.substring(_file.lastIndexOf("/") + 1)
					var line = info.currentline

					frames.push(new StackFrame(i, info.scoreName,
						new Source(tname, _file),
						line))
				}
			}
			response.body = {
				stackFrames: frames,
				totalFrames: frames.length
			}
			this.sendResponse(response)
		}
	}

	protected scopesRequest(response: DebugProtocol.ScopesResponse, args: DebugProtocol.ScopesArguments): void {
		const scopes = this.scopeMgr.createScopes(args.frameId)
		response.body = {
			scopes: scopes
		}
		this.sendResponse(response)
	}

	protected variablesRequest(response: DebugProtocol.VariablesResponse, args: DebugProtocol.VariablesArguments): void {
		var luadebug: LuaDebug = this
		var luaDebugVarInfo: LuaDebugVarInfo = this.scopeMgr.getDebugVarsInfoByVariablesReference(args.variablesReference)
		if (luaDebugVarInfo) {
			this.scopeMgr.getVarsInfos(args.variablesReference,
				function (variables) {
					var newVariables = []
					if (variables) {
						variables.forEach(element => {
							var newVariable = {
								name: element.name,
								type: element.type,
								value: element.value,
								variablesReference: element.variablesReference
							}
							if (newVariable.type == "number") {
								if (luadebug.exConfig && luadebug.exConfig["luaide-lite.numberRadix"]) {
									var radixes = luadebug.exConfig["luaide-lite.numberRadix"]
									if (radixes && radixes.length > 0) {
										var newValue = ""
										for (var i = 0; i < radixes.length; i++) {
											var radix = radixes[i]
											if (radix == 16) {
												newValue += "0x" + parseInt(newVariable.value).toString(radix)
											} else {
												newValue += parseInt(newVariable.value).toString(radix)
											}
											if (i < radixes.length - 1) {
												newValue += " | "
											}
										}
										newVariable.value = newValue
									}
								}
							}
							newVariables.push(newVariable)
						})
					}
					response.body = {
						variables: newVariables
					}
					luadebug.sendResponse(response)
				})
		}
		else {
			this.sendResponse(response)
		}
	}

	protected continueRequest(response: DebugProtocol.ContinueResponse, args: DebugProtocol.ContinueArguments): void {
		this.scopeMgr.clear()
		this.isHitBreak = false
		this.netMgr.sendMsg(LuaDebuggerEvent.S2C_RUN,
			{
				runTimeType: this.runtimeType,
				isProntToConsole: this.printType,
				printType: this.printType
			})
		this.sendResponse(response)
	}

	protected nextRequest(response: DebugProtocol.NextResponse, args: DebugProtocol.NextArguments): void {
		this.scopeMgr.clear()
		var luadebug: LuaDebug = this
		function callBackFun(isstep, isover) {
			if (isstep) {
				luadebug.sendEvent(new StoppedEvent("step", 1))
			}
		}
		try {
			this.scopeMgr.stepReq(callBackFun, LuaDebuggerEvent.S2C_NextRequest)
		} catch (error) {
			this.sendEvent(new OutputEvent("nextRequest error:" + error))
		}
		this.sendResponse(response)
	}

	protected stepInRequest(response: DebugProtocol.StepInResponse): void {
		this.scopeMgr.clear()
		var luadebug: LuaDebug = this
		this.scopeMgr.stepReq(function (isstep, isover) {
			if (isover) {
				this.sendEvent(new TerminatedEvent())
				return
			}
			if (isstep) {
				luadebug.sendEvent(new StoppedEvent("step", 1))
			}
		}, LuaDebuggerEvent.S2C_StepInRequest)
		luadebug.sendResponse(response)
	}

	protected pauseRequest(response: DebugProtocol.PauseResponse): void {
		this.netMgr.sendMsg(LuaDebuggerEvent.S2C_PauseThread, {})
		this.sendResponse(response)
	}

	protected stepOutRequest(response: DebugProtocol.StepInResponse): void {
		this.sendResponse(response)
		var luadebug: LuaDebug = this
		this.scopeMgr.stepReq(function (isstep, isover) {
			if (isover) {
				this.sendEvent(new TerminatedEvent())
				return
			}
			luadebug.sendResponse(response)
			if (isstep) {
				luadebug.sendEvent(new StoppedEvent("step", 1))
			}
		}, LuaDebuggerEvent.S2C_StepOutRequest)
	}

	protected evaluateRequest(response: DebugProtocol.EvaluateResponse, args: DebugProtocol.EvaluateArguments): void {
		var luadebug: LuaDebug = this
		var frameId = args.frameId
		if (frameId == null) {
			frameId = 0
		}
		var expression = args.expression
		var eindex = expression.lastIndexOf("..")
		if (eindex > -1) {
			expression = expression.substring(eindex + 2)
		}
		eindex = expression.lastIndexOf('"')
		if (eindex == 0) {
			var body = {
				result: expression + '"',
				variablesReference: 0
			}
			response.body = body
			luadebug.sendResponse(response)
			return
		}
		if (parseInt(expression)) {
			if (luadebug.exConfig && luadebug.exConfig["luaide-lite.numberRadix"]) {
				var radixes = luadebug.exConfig["luaide-lite.numberRadix"]
				if (radixes && radixes.length > 0) {
					var newValue = ""
					for (var i = 0; i < radixes.length; i++) {
						var radix = radixes[i]
						if (radix == 16) {
							newValue += "0x" + parseInt(expression).toString(radix)
						} else {
							newValue += parseInt(expression).toString(radix)
						}
						if (i < radixes.length - 1) {
							newValue += " | "
						}
					}
					var body = {
						result: newValue,
						variablesReference: 0
					}
					response.body = body
					luadebug.sendResponse(response)
				} else {
					var body = {
						result: expression,
						variablesReference: 0
					}
					response.body = body
					luadebug.sendResponse(response)
				}
			}
			else {
				var body = {
					result: expression,
					variablesReference: 0
				}
				response.body = body
				luadebug.sendResponse(response)
			}
			return
		}
		if (args.context == "repl" && args.expression == ">load") {
			// this.luaProcess.runLuaScript({ luastr: "Helper.LogError(a)", frameId: args.frameId }, function (body) {
			// 	response.body = body
			// 	luadebug.sendResponse(response)
			// })
			return
		}
		var index: number = 1
		var scopesManager = this.scopeMgr
		var callBackFun = function (body) {
			if (body == null) {
				index++
				if (index > 3) {
					response.body =
						{
							result: "nil",
							variablesReference: 0
						}
					luadebug.sendResponse(response)
				} else {
					scopesManager.evaluateRequest(frameId, expression, index, callBackFun, args.context)
				}
			} else {
				response.body = body
				luadebug.sendResponse(response)
			}
		}
		this.scopeMgr.evaluateRequest(frameId, expression, index, callBackFun, args.context)
	}

	protected setVariableRequest(response: DebugProtocol.SetVariableResponse, args: DebugProtocol.SetVariableArguments): void {
		var varInfo: LuaDebugVarInfo = this.scopeMgr.getDebugVarsInfoByVariablesReference(args.variablesReference)
		if (varInfo) {
			var that = this
			for (var i = 0; i < varInfo.variables.length; i++) {
				var temp = varInfo.variables[i]
				if (temp.name == args.name) {
					var msg = {
						group: varInfo.name,
						frameId: varInfo.frameId,
						name: args.name,
						value: args.value,
					}
					that.netMgr.sendMsg(LuaDebuggerEvent.S2C_SetVariable, msg)
					that.netMgr.on("C2S_SetVariable", function (data) {
						response.body = {
							value: args.value
						}
						that.sendResponse(response)
					})
				}
			}
		}
		else {
			this.sendResponse(response)
		}
	}

	public convertToServerPath(path: string): string {
		if (path.indexOf('@') == 0) {
			path = path.substring(1)
		}
		path = path.replace(/\\/g, "/")
		path = path.replace(new RegExp("/./", "gm"), "/")
		var nindex: number = path.lastIndexOf("/")
		var fileName: string = path.substring(nindex + 1)

		fileName = fileName.substr(0, fileName.length - 4) + this.fileExtname
		path = path.substr(0, path.length - 4) + this.fileExtname

		var paths: Array<string> = this.pathMaps.get(fileName)
		if (paths == null) {
			return path
		}
		var clientPaths = path.split("/")
		var isHit: boolean = true
		var hitServerPath = ""
		var pathHitCount: Array<number> = new Array<number>()
		for (var index = 0; index < paths.length; index++) {
			var serverPath = paths[index]
			pathHitCount.push(0)
			var serverPaths = serverPath.split("/")
			var serverPathsCount = serverPaths.length
			var clientPathsCount = clientPaths.length
			while (true) {
				if (clientPaths[clientPathsCount--] != serverPaths[serverPathsCount--]) {
					isHit = false
					break
				} else {
					pathHitCount[index]++
				}
				if (clientPathsCount <= 0 || serverPathsCount <= 0) {
					break
				}
			}
		}
		//判断谁的命中多 
		var maxCount = 0
		var hitIndex = -1
		for (var j = 0; j < pathHitCount.length; j++) {
			var count = pathHitCount[j]
			if (count >= maxCount && count > 0) {
				hitIndex = j
				maxCount = count
			}
		}
		if (hitIndex > -1) {
			return paths[hitIndex]
		}
	}

	public convertToClientPath(path: string, lines: Array<number>): any {
		path = path.replace(/\\/g, "/")
		var nindex: number = path.lastIndexOf("/")
		var fileName: string = path.substring(nindex + 1)
		var extname = ospath.extname(path)
		var baseName = ospath.basename(path)
		fileName = fileName.substr(0, fileName.length - extname.length) + ".lua"
		path = path.substr(0, path.length - extname.length) + ".lua"
		var pathinfo = {
			fileName: fileName,
			serverPath: path,
			lines: lines
		}
		return pathinfo
		//检查文件是否存在如果存在那么就
		// var paths: Array<string> = new Array<string>()
		// var clientPath: string = ""
		// for (var index = 0; index < this.scriptPaths.length; index++) {
		// 	var serverPath: string = this.scriptPaths[index]
		// 	if (path.indexOf(serverPath) > -1) {
		// 		clientPath = path.replace(serverPath, "")
		// 		paths.push(clientPath)
		// 	}
		// }
		// return paths
	}

	private checkArgs(args: any): any {
		var localRoot: string = args.localRoot
		if (!fs.existsSync(localRoot)) {
			return "localRoot: " + localRoot + " doesn't exist!"
		}
		var runtimeType: string = args.runtimeType
		if (runtimeType == "Lua51") {
			return true
		}
		else if (runtimeType == "Cocos2" || runtimeType == "Cocos3") {
			// Cocos
			if (!fs.existsSync(args.exePath)) {
				return "Exe does not exist: " + args.exePath
			}
			if (args.scripts) {
				for (var index = 0; index < args.scripts.length; index++) {
					var scriptsPath = args.scripts[index]
					if (!fs.existsSync(scriptsPath)) {
						return "Scripts does not exist: " + scriptsPath
					}
				}
			}
			return true
		}
	}

	private initPathMaps(scripts: Array<string>) {
		var paths: Array<string> = new Array<string>()
		if (scripts) {
			for (var index = 0; index < scripts.length; index++) {
				var scriptPath = scripts[index]
				scriptPath = scriptPath.replace(/\\/g, "/")
				if (scriptPath.charAt(scriptPath.length - 1) != "/") {
					scriptPath += "/"
				}
				paths.push(ospath.normalize(scriptPath))
			}
		}
		paths.push(ospath.normalize(this.localRoot))
		function sortPath(p1, p2) {
			if (p1.length < p2.length) return 0
			else return 1
		}
		paths = paths.sort(sortPath)
		var tempPaths: Array<string> = Array<string>()
		tempPaths.push(paths[0])
		for (var index = 1; index < paths.length; index++) {
			var addPath = paths[index]
			var isAdd = true
			for (var k = 0; k < tempPaths.length; k++) {
				if (addPath == tempPaths[k] || addPath.indexOf(tempPaths[k]) > -1 || tempPaths[k].indexOf(addPath) > -1) {
					isAdd = false
					break
				}
			}
			if (isAdd) {
				tempPaths.push(addPath)
			}
		}
		this.pathMaps.clear()
		for (var k = 0; k < tempPaths.length; k++) {
			this.readFileList(tempPaths[k])
		}
	}

	private readFileList(path: string) {
		if (path.indexOf(".svn") > -1) {
			return
		}
		path = path.replace(/\\/g, "/")
		if (path.charAt(path.length - 1) != "/") {
			path += "/"
		}
		var files = fs.readdirSync(path)
		for (var index = 0; index < files.length; index++) {
			var filePath = path + files[index]
			var stat = fs.statSync(filePath)
			if (stat.isDirectory()) {
				//递归读取文件
				this.readFileList(filePath)
			} else {
				if (filePath.indexOf(this.fileExtname) > -1) {
					var nindex: number = filePath.lastIndexOf("/")
					var fileName: string = filePath.substring(nindex + 1)
					var filePaths: Array<string> = null
					if (this.pathMaps.has(fileName)) {
						filePaths = this.pathMaps.get(fileName)
					} else {
						filePaths = new Array<string>()
						this.pathMaps.set(fileName, filePaths)
					}
					filePaths.push(filePath)
				}
			}
		}
	}

	private calculatePort(): any {
		var port = 7003
		if (this.pathMaps) {
			try {
				this.pathMaps.forEach((v, k) => {
					if (k == "LuaDebug.lua" && v.length > 0) {
						var token = v[0]
						token = token.replace(/@/g, "")
						token = token.replace(/\\/g, "")
						token = token.replace(/\//g, "")
						token = token.replace(/:/g, "")
						token = token.replace("LuaDebug.lua", "")
						token = token.toLocaleLowerCase()
						port = 0
						for (var i = 0; i < token.length; i++) {
							port += token.charCodeAt(i)
						}
						port = port % 10000 + 50000
						throw port
					}
				})
			} catch{ }
		}
		return port
	}

	private initEXCfg() {
		var cfgFile = ospath.join(this.localRoot, ".vscode/settings.json")
		if (fs.existsSync(cfgFile)) {
			try {
				this.exConfig = require(cfgFile)
			} catch{ }
		}
	}

	public FormatDate(date: Date, fmt) {
		var o = {
			"M+": date.getMonth() + 1, //月份           
			"d+": date.getDate(), //日           
			"h+": date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, //小时           
			"H+": date.getHours(), //小时           
			"m+": date.getMinutes(), //分           
			"s+": date.getSeconds(), //秒           
			"q+": Math.floor((date.getMonth() + 3) / 3), //季度           
			"S": date.getMilliseconds() //毫秒           
		};
		var week = {
			"0": "/u65e5",
			"1": "/u4e00",
			"2": "/u4e8c",
			"3": "/u4e09",
			"4": "/u56db",
			"5": "/u4e94",
			"6": "/u516d"
		};
		if (/(y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
		}
		if (/(E+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[date.getDay() + ""]);
		}
		for (var k in o) {
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			}
		}
		return fmt;
	}

}

DebugSession.run(LuaDebug)