import { DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, OutputEvent, Thread, StackFrame, Source } from 'vscode-debugadapter'
import { DebugProtocol } from 'vscode-debugprotocol'
import child_process = require('child_process')
const fs = require('fs')
const ospath = require('path')
const os = require('os')
import { BPMgr } from "./BPMgr"
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

	get breakPointData(): BPMgr { return this.bpMgr }

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
		response.body.supportsConditionalBreakpoints = true
		response.body.supportsRestartFrame = true
		response.body.supportsCompletionsRequest = true
		response.body.supportsExceptionInfoRequest = true
		response.body.supportsDelayedStackTraceLoading = false // FIX(20211214)：修复堆栈重复的问题
		response.body.supportsEvaluateForHovers = true
		this.sendResponse(response)

		this.bpMgr = new BPMgr(this)
		this.pathMaps = new Map<string, Array<string>>()
		let that: LuaDebug = this
		this.on("close", function () {
			that.netMgr.close()
		})
	}

	protected setupProcessHanlders() {
		this.netMgr.on("C2S_HITBreakPoint", result => {
			this.scopeMgr.setStackInfos(result.data.stack)
			this.sendEvent(new StoppedEvent("breakpoint", 1))
		})
		this.netMgr.on("C2S_LuaPrint", result => {
			let content = new Buffer(result.data.msg, "base64").toString("utf8")
			if (this.printDate) {
				content = this.FormatDate(new Date(), "[yyyy-MM-dd hh:mm:ss] ") + content
			}
			if (result.data.type == 1) {
				this.sendEvent(new OutputEvent(content + "\n", "stdout"))
			} else if (result.data.type == 2) {
				this.sendEvent(new OutputEvent(content + "\n", "console"))
			} else if (result.data.type == 3) {
				this.sendEvent(new OutputEvent(content + "\n", "stderr"))
			} else {
				this.sendEvent(new OutputEvent(content + "\n"))
			}
		})
	}

	protected launchRequest(response: DebugProtocol.LaunchResponse, args: any): void {
		let result = this.checkArgs(args)
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
		let proc = new ExecMgr(args)

		this.netMgr = new NetMgr(this, DebugMode.launch, args)
		this.scopeMgr = new ScopeMgr(this.netMgr, this)
		//注册事件
		this.setupProcessHanlders()
		if (this.luaStartProc) {
			this.luaStartProc.kill()
		}
		this.sendResponse(response)

		let that: LuaDebug = this
		this.luaStartProc = proc.exec()
		this.luaStartProc.on("error", error => {
			this.sendEvent(new OutputEvent("LuaDebug->launchRequest.proc.error: " + error.message + "\n"))
		})
		this.luaStartProc.stderr.setEncoding("utf8")
		this.luaStartProc.stderr.on("data", error => {
			that.sendEvent(new OutputEvent(error + "\n"))
		})
		this.luaStartProc.on("close", function (code) {
			if (that.netMgr) {
				that.netMgr.sendMsg(LuaDebuggerEvent.S2C_DebugClose)
			}
			that.sendEvent(new TerminatedEvent())
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
		this.sendEvent(new OutputEvent("LuaDebug Server has been terminated!\n"))
		if (this.luaStartProc) {
			this.luaStartProc.kill()
		}
		super.disconnectRequest(response, args)
	}

	protected setBreakPointsRequest(response: DebugProtocol.SetBreakpointsResponse, args: DebugProtocol.SetBreakpointsArguments): void {
		let path = args.source.path
		path = path.substring(0, 1).toLowerCase() + path.substring(1, path.length)
		let lines = args.lines
		let bps = this.bpMgr.verifiedBreakPoint(path, lines, args.breakpoints)
		response.body = {
			breakpoints: bps
		}
		if (this.netMgr != null && this.netMgr.getSocketState() == ClientStatus.connected) {
			let data = this.bpMgr.getClientBreakPointInfo(path)
			this.netMgr.sendMsg(LuaDebuggerEvent.S2C_SetBreakPoints, data ? [data] : null, this.isHitBreak == true ? this.netMgr.mainSocket : this.netMgr.breakPointSocket)
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
		let stackInfos: Array<any> = this.scopeMgr.getStackInfos()
		const frames = new Array<StackFrame>()
		for (let i = 0; i < stackInfos.length; i++) {
			let info = stackInfos[i]
			let source: string = info.src
			if (source.endsWith("/lua")) {
				source = source.replace("/lua", this.fileExtname)
			} else if (source == "=[C]") {
				source = ospath.join(os.tmpdir(), "=[C]")
				source = source.replace(/\\/g, "/")
				try {
					if (fs.existsSync(source)) {
						fs.unlinkSync(source)
					}
					let json = JSON.stringify(info)
					fs.writeFileSync(source, json)
				} catch (e) { }
			} else {
				if (source.indexOf(this.fileExtname) == -1) {
					source = source + this.fileExtname
				}
				source = this.convertToServerPath(source)
			}
			if (source != null && source != "") {
				let tname = source.substring(source.lastIndexOf("/") + 1)
				let line = info.currentline
				frames.push(new StackFrame(i, info.scoreName, new Source(tname, source), line))
			}
		}
		response.body = {
			stackFrames: frames,
			totalFrames: frames.length
		}
		this.sendResponse(response)
	}

	protected scopesRequest(response: DebugProtocol.ScopesResponse, args: DebugProtocol.ScopesArguments): void {
		const scopes = this.scopeMgr.createScopes(args.frameId)
		response.body = {
			scopes: scopes
		}
		this.sendResponse(response)
	}

	protected variablesRequest(response: DebugProtocol.VariablesResponse, args: DebugProtocol.VariablesArguments): void {
		let that: LuaDebug = this
		let luaDebugVarInfo: LuaDebugVarInfo = this.scopeMgr.getDebugVarsInfoByVariablesReference(args.variablesReference)
		if (luaDebugVarInfo) {
			this.scopeMgr.getVarsInfos(args.variablesReference,
				function (variables) {
					let newVariables = []
					if (variables) {
						variables.forEach(element => {
							let newVariable = {
								name: element.name,
								type: element.type,
								value: element.value,
								variablesReference: element.variablesReference
							}
							if (newVariable.type == "number") {
								if (that.exConfig && that.exConfig["luaide-lite.numberRadix"]) {
									let radixes = that.exConfig["luaide-lite.numberRadix"]
									if (radixes && radixes.length > 0) {
										let newValue = ""
										for (let i = 0; i < radixes.length; i++) {
											let radix = radixes[i]
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
					that.sendResponse(response)
				})
		} else {
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
		let that: LuaDebug = this
		function callBackFun(isstep, isover) {
			if (isstep) {
				that.sendEvent(new StoppedEvent("step", 1))
			}
		}
		try {
			this.scopeMgr.stepReq(callBackFun, LuaDebuggerEvent.S2C_NextRequest)
		} catch (error) {
			this.sendEvent(new OutputEvent("LuaDebug->nextRequest: " + error))
		}
		this.sendResponse(response)
	}

	protected stepInRequest(response: DebugProtocol.StepInResponse): void {
		this.scopeMgr.clear()
		let that: LuaDebug = this
		this.scopeMgr.stepReq(function (isstep, isover) {
			if (isover) {
				this.sendEvent(new TerminatedEvent())
				return
			}
			if (isstep) {
				that.sendEvent(new StoppedEvent("step", 1))
			}
		}, LuaDebuggerEvent.S2C_StepInRequest)
		that.sendResponse(response)
	}

	protected pauseRequest(response: DebugProtocol.PauseResponse): void {
		this.netMgr.sendMsg(LuaDebuggerEvent.S2C_PauseThread, {})
		this.sendResponse(response)
	}

	protected stepOutRequest(response: DebugProtocol.StepInResponse): void {
		this.sendResponse(response)
		let that: LuaDebug = this
		this.scopeMgr.stepReq(function (isstep, isover) {
			if (isover) {
				this.sendEvent(new TerminatedEvent())
				return
			}
			that.sendResponse(response)
			if (isstep) {
				that.sendEvent(new StoppedEvent("step", 1))
			}
		}, LuaDebuggerEvent.S2C_StepOutRequest)
	}

	protected evaluateRequest(response: DebugProtocol.EvaluateResponse, args: DebugProtocol.EvaluateArguments): void {
		let luadebug: LuaDebug = this
		let frameId = args.frameId
		if (frameId == null) {
			frameId = 0
		}
		let expression = args.expression
		let eindex = expression.lastIndexOf("..")
		if (eindex > -1) {
			expression = expression.substring(eindex + 2)
		}
		eindex = expression.lastIndexOf('"')
		if (eindex == 0) {
			let body = {
				result: expression + '"',
				variablesReference: 0
			}
			response.body = body
			luadebug.sendResponse(response)
			return
		}
		if (parseInt(expression)) {
			if (luadebug.exConfig && luadebug.exConfig["luaide-lite.numberRadix"]) {
				let radixes = luadebug.exConfig["luaide-lite.numberRadix"]
				if (radixes && radixes.length > 0) {
					let newValue = ""
					for (let i = 0; i < radixes.length; i++) {
						let radix = radixes[i]
						if (radix == 16) {
							newValue += "0x" + parseInt(expression).toString(radix)
						} else {
							newValue += parseInt(expression).toString(radix)
						}
						if (i < radixes.length - 1) {
							newValue += " | "
						}
					}
					let body = {
						result: newValue,
						variablesReference: 0
					}
					response.body = body
					luadebug.sendResponse(response)
				} else {
					let body = {
						result: expression,
						variablesReference: 0
					}
					response.body = body
					luadebug.sendResponse(response)
				}
			}
			else {
				let body = {
					result: expression,
					variablesReference: 0
				}
				response.body = body
				luadebug.sendResponse(response)
			}
			return
		}
		let index: number = 1
		let scopesManager = this.scopeMgr
		const callBackFun = function (body) {
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
		let varInfo: LuaDebugVarInfo = this.scopeMgr.getDebugVarsInfoByVariablesReference(args.variablesReference)
		if (varInfo) {
			let that = this
			for (let i = 0; i < varInfo.variables.length; i++) {
				let temp = varInfo.variables[i]
				if (temp.name == args.name) {
					let msg = {
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
		} else {
			this.sendResponse(response)
		}
	}

	public convertToServerPath(path: string): string {
		if (path.indexOf('@') == 0) {
			path = path.substring(1)
		}
		path = path.replace(/\\/g, "/")
		path = path.replace(new RegExp("/./", "gm"), "/")
		let nindex: number = path.lastIndexOf("/")
		let fileName: string = path.substring(nindex + 1)

		fileName = fileName.substr(0, fileName.length - 4) + this.fileExtname
		path = path.substr(0, path.length - 4) + this.fileExtname

		let paths: Array<string> = this.pathMaps.get(fileName)
		if (paths == null) {
			return path
		}
		let clientPaths = path.split("/")
		let isHit: boolean = true
		let pathHitCount: Array<number> = new Array<number>()
		for (let index = 0; index < paths.length; index++) {
			let serverPath = paths[index]
			pathHitCount.push(0)
			let serverPaths = serverPath.split("/")
			let serverPathsCount = serverPaths.length
			let clientPathsCount = clientPaths.length
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
		let maxCount = 0
		let hitIndex = -1
		for (let j = 0; j < pathHitCount.length; j++) {
			let count = pathHitCount[j]
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
		let nindex: number = path.lastIndexOf("/")
		let fileName: string = path.substring(nindex + 1)
		let extname = ospath.extname(path)
		fileName = fileName.substr(0, fileName.length - extname.length) + ".lua"
		path = path.substr(0, path.length - extname.length) + ".lua"
		let pathinfo = {
			fileName: fileName,
			serverPath: path,
			lines: lines
		}
		return pathinfo
	}

	private checkArgs(args: any): any {
		let localRoot: string = args.localRoot
		if (!fs.existsSync(localRoot)) {
			return "localRoot: " + localRoot + " doesn't exist!"
		}
		let runtimeType: string = args.runtimeType
		if (runtimeType == "Lua51") {
			return true
		} else if (runtimeType == "Cocos2" || runtimeType == "Cocos3") {
			// Cocos
			if (!fs.existsSync(args.exePath)) {
				return "Exe does not exist: " + args.exePath
			}
			if (args.scripts) {
				for (let index = 0; index < args.scripts.length; index++) {
					let scriptsPath = args.scripts[index]
					if (!fs.existsSync(scriptsPath)) {
						return "Scripts does not exist: " + scriptsPath
					}
				}
			}
			return true
		}
	}

	private initPathMaps(scripts: Array<string>) {
		let paths: Array<string> = new Array<string>()
		if (scripts) {
			for (let index = 0; index < scripts.length; index++) {
				let scriptPath = scripts[index]
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
		let tempPaths: Array<string> = Array<string>()
		tempPaths.push(paths[0])
		for (let index = 1; index < paths.length; index++) {
			let addPath = paths[index]
			let isAdd = true
			for (let k = 0; k < tempPaths.length; k++) {
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
		for (let k = 0; k < tempPaths.length; k++) {
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
		let files = fs.readdirSync(path)
		for (let index = 0; index < files.length; index++) {
			let filePath = path + files[index]
			let stat = fs.statSync(filePath)
			if (stat.isDirectory()) {
				//递归读取文件
				this.readFileList(filePath)
			} else {
				if (filePath.indexOf(this.fileExtname) > -1) {
					let nindex: number = filePath.lastIndexOf("/")
					let fileName: string = filePath.substring(nindex + 1)
					let filePaths: Array<string> = null
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
		let port = 7003
		if (this.pathMaps) {
			try {
				this.pathMaps.forEach((v, k) => {
					if (k == "LuaDebug.lua" && v.length > 0) {
						let token = v[0]
						token = token.replace(/@/g, "")
						token = token.replace(/\\/g, "")
						token = token.replace(/\//g, "")
						token = token.replace(/:/g, "")
						token = token.replace("LuaDebug.lua", "")
						token = token.toLocaleLowerCase()
						port = 0
						for (let i = 0; i < token.length; i++) {
							port += token.charCodeAt(i)
						}
						port = port % 10000 + 50000
						throw port
					}
				})
			} catch { }
		}
		return port
	}

	private initEXCfg() {
		let cfgFile = ospath.join(this.localRoot, ".vscode/settings.json")
		if (fs.existsSync(cfgFile)) {
			try {
				this.exConfig = require(cfgFile)
			} catch { }
		}
	}

	public FormatDate(date: Date, fmt) {
		let o = {
			"M+": date.getMonth() + 1, //月份           
			"d+": date.getDate(), //日           
			"h+": date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, //小时           
			"H+": date.getHours(), //小时           
			"m+": date.getMinutes(), //分           
			"s+": date.getSeconds(), //秒           
			"q+": Math.floor((date.getMonth() + 3) / 3), //季度           
			"S": date.getMilliseconds() //毫秒           
		}
		let week = {
			"0": "/u65e5",
			"1": "/u4e00",
			"2": "/u4e8c",
			"3": "/u4e09",
			"4": "/u56db",
			"5": "/u4e94",
			"6": "/u516d"
		}
		if (/(y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
		}
		if (/(E+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[date.getDay() + ""]);
		}
		for (let k in o) {
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			}
		}
		return fmt
	}

}

DebugSession.run(LuaDebug)