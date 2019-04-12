import { Scope } from 'vscode-debugadapter'
import { NetMgr, LuaDebuggerEvent } from './NetMgr'
import { LuaDebug } from './LuaDebug'

export class LuaDebugVarInfo {
	public name: string
	public vars: any
	public frameId: number
	public parent: LuaDebugVarInfo
	public isRoot: boolean
	public variablesReference: number
	public variables
	public varInfos_: Array<LuaDebugVarInfo>

	public type: number
	constructor(frameId: number, name: string, type: number, parent: LuaDebugVarInfo) {
		this.frameId = frameId
		this.name = name
		this.type = type
		this.parent = parent
		this.isRoot = parent == null ? true : false
	}

	public getVarInfoByName(name: string): any {
		if (this.vars == null) {
			return -1
		} else {
			for (let i = 0; i < this.vars.length; i++) {
				let varName = this.vars[i].name
				if (name == varName) {
					return this.vars[i]
				}

			}
		}
		return 0
	}

	public getLuaDebugVarInfo(name: string): any {
		if (this.varInfos_ == null) return -1
		for (let i = 0; i < this.varInfos_.length; i++) {
			let luaDebugVarInfo: LuaDebugVarInfo = this.varInfos_[i]
			if (luaDebugVarInfo.name == name) {
				return luaDebugVarInfo
			}
		}
		return 0
	}

	/**
	 * 添加属于自己的 LuaDebugVarInfo
	 */
	public addLuaDebugVarInfo(luaDebugVarInfo: LuaDebugVarInfo) {
		if (this.varInfos_ == null) {
			this.varInfos_ = new Array<LuaDebugVarInfo>()
		}
		this.varInfos_.push(luaDebugVarInfo)
	}

	public pushVars(vars) {
		if (this.vars == null) {
			this.vars = []
		}
		for (let i = 0; i < vars.length; i++) {
			let element = vars[i]
			this.vars.push(element)
		}
	}

	public getVarKeys() {
		let keys: Array<string> = new Array<string>()
		let parent: LuaDebugVarInfo = this
		while (true) {
			if (parent.parent == null) {
				break
			}
			keys.push(parent.name)
			parent = parent.parent
		}
		keys = keys.reverse()
		return keys
	}
}

export class ScopeMgr {
	private stackInfos: Array<any>
	private variableHandles_: Array<LuaDebugVarInfo>
	private luaDebugVarInfos: Array<LuaDebugVarInfo>
	private luaProcess_: NetMgr
	private golbalLuaDebugVarInfo_: LuaDebugVarInfo
	private reqVarsCallFunMap: Map<number, Array<Function>>
	private localVarsLuaDebugVarInfos: Map<number, LuaDebugVarInfo>
	private upVarsLuaDebugVarInfos: Map<number, LuaDebugVarInfo>

	private variablesReferenceIndex = 0

	/**
	 * 下一步请求返回回调参数
	 */
	private reqStepCallFunction: Function
	private luaDebug: LuaDebug
	constructor(luaProcess: NetMgr, luaDebug: LuaDebug) {
		this.luaProcess_ = luaProcess
		this.variableHandles_ = new Array<LuaDebugVarInfo>()
		this.reqVarsCallFunMap = new Map<number, Array<Function>>()
		this.luaDebugVarInfos = new Array<LuaDebugVarInfo>()
		this.localVarsLuaDebugVarInfos = new Map<number, LuaDebugVarInfo>()
		this.upVarsLuaDebugVarInfos = new Map<number, LuaDebugVarInfo>()
		this.luaDebug = luaDebug
		this.setupProcessHanlders()
	}

	public clear() {
		this.variableHandles_ = new Array<LuaDebugVarInfo>()
		this.reqVarsCallFunMap.forEach((v, k) => {
			if (v != null && v.length > 0) {
				v.forEach(fun => {
					fun(null)
				})
			}
		})
		this.reqVarsCallFunMap.clear()
		this.luaDebugVarInfos = new Array<LuaDebugVarInfo>()
		this.localVarsLuaDebugVarInfos.clear()
		this.upVarsLuaDebugVarInfos.clear()
		this.golbalLuaDebugVarInfo_ = null
	}

	protected setupProcessHanlders() {
		this.luaProcess_.on('C2S_ReqVar', result => {
			this.resVarsInfos(result.data)
		})
		//
		this.luaProcess_.on('C2S_NextResponse', result => {

			this.setStackInfos(result.data.stack)
			this.stepRes(LuaDebuggerEvent.C2S_NextResponse)
		})
		//下一步结束
		this.luaProcess_.on('S2C_NextResponseOver', result => {
			this.stackInfos = null
			this.stepOverReq()
		})
		/**
		 * 单步跳出
		 */
		this.luaProcess_.on('C2S_StepInResponse', result => {

			this.setStackInfos(result.data.stack)
			this.stepRes(LuaDebuggerEvent.C2S_StepInResponse)
		})
		this.luaProcess_.on('C2S_StepOutResponse', result => {

			this.setStackInfos(result.data.stack)
			this.stepRes(LuaDebuggerEvent.C2S_StepOutResponse)
		})
	}

	public getNewVariablesReference(luaDebugVarInfo: LuaDebugVarInfo) {
		this.variablesReferenceIndex++
		this.variableHandles_.push(luaDebugVarInfo)
		luaDebugVarInfo.variablesReference = this.variablesReferenceIndex
		if (this.variablesReferenceIndex > 9001199254740992) {
			this.variablesReferenceIndex = 0
		}
	}

	public getDebugVarsInfoByVariablesReference(variablesReferenceIndex) {
		for (let i = 0; i < this.variableHandles_.length; i++) {
			let element = this.variableHandles_[i]
			if (element.variablesReference == variablesReferenceIndex) {
				return element
			}
		}
		return null
	}

	public setStackInfos(stackInfos: Array<any>) {
		this.stackInfos = stackInfos
	}

	public getStackInfos(): Array<any> {
		return this.stackInfos
	}

	public getLocalLuaDebugInfo(frameId: number) {
		let luaDebugInfo: LuaDebugVarInfo = this.localVarsLuaDebugVarInfos.get(frameId)
		if (luaDebugInfo == null) {
			luaDebugInfo = new LuaDebugVarInfo(frameId, "Local", 1, null)
			this.getNewVariablesReference(luaDebugInfo)
			this.localVarsLuaDebugVarInfos.set(frameId, luaDebugInfo)
		}
		return luaDebugInfo
	}

	public getUplLuaDebugInfo(frameId: number) {
		let luaDebugInfo: LuaDebugVarInfo = this.upVarsLuaDebugVarInfos.get(frameId)
		if (luaDebugInfo == null) {
			luaDebugInfo = new LuaDebugVarInfo(frameId, "Ups", 2, null)
			this.getNewVariablesReference(luaDebugInfo)
			this.upVarsLuaDebugVarInfos.set(frameId, luaDebugInfo)
		}
		return luaDebugInfo
	}

	public getGolbalLuaDebugVarInfo() {
		if (this.golbalLuaDebugVarInfo_ == null) {
			this.golbalLuaDebugVarInfo_ = new LuaDebugVarInfo(0, "Global", 3, null)
			this.getNewVariablesReference(this.golbalLuaDebugVarInfo_)
		}
		return this.golbalLuaDebugVarInfo_
	}

	public createScopes(frameId: number): Array<Scope> {
		const scopes = []
		//var stackInfo = this.stackInfos[frameId]
		//先检查local
		let localLuaDebugInfo = this.getLocalLuaDebugInfo(frameId)
		scopes.push({
			name: localLuaDebugInfo.name,
			variablesReference: localLuaDebugInfo.variablesReference,
			expensive: false
		})
		let upLuaDebugInfo = this.getUplLuaDebugInfo(frameId)
		scopes.push({
			name: upLuaDebugInfo.name,
			variablesReference: upLuaDebugInfo.variablesReference,
			expensive: false
		})
		let golbalLuaDebugVarInfo = this.getGolbalLuaDebugVarInfo()
		scopes.push({
			name: this.golbalLuaDebugVarInfo_.name,
			variablesReference: this.golbalLuaDebugVarInfo_.variablesReference,
			expensive: false
		})
		return scopes
	}

	//解码的方法
	private base64decode(str) {
		let base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
		let base64DecodeChars = new Array(
			-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
			-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
			-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
			52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
			-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
			15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
			-1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
			41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1)
		let c1, c2, c3, c4
		let i, len, out
		len = str.length
		i = 0
		out = ""
		while (i < len) {

			do {
				c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff]
			} while (i < len && c1 == -1)
			if (c1 == -1)
				break

			do {
				c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff]
			} while (i < len && c2 == -1)
			if (c2 == -1)
				break
			out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4))

			do {
				c3 = str.charCodeAt(i++) & 0xff
				if (c3 == 61)
					return out
				c3 = base64DecodeChars[c3]
			} while (i < len && c3 == -1)
			if (c3 == -1)
				break
			out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2))

			do {
				c4 = str.charCodeAt(i++) & 0xff
				if (c4 == 61)
					return out
				c4 = base64DecodeChars[c4]
			} while (i < len && c4 == -1)
			if (c4 == -1)
				break
			out += String.fromCharCode(((c3 & 0x03) << 6) | c4)
		}
		return out
	}

	public resVarsInfos(data) {
		let vars = data.vars
		let isComplete = data.isComplete
		let variablesReference = data.variablesReference
		let debugSpeedIndex = data.debugSpeedIndex

		let luaDebugInfo: LuaDebugVarInfo = this.getDebugVarsInfoByVariablesReference(variablesReference)
		if (luaDebugInfo == null) {
			return
		}

		luaDebugInfo.pushVars(vars)
		if (isComplete == 0) {
			return
		}
		const variables = []
		if (luaDebugInfo.vars.length == 0) {
			variables.push({
				name: "{}",
				type: "table",
				value: "",
				variablesReference: newvariablesReference
			})
		}
		for (let i = 0; i < luaDebugInfo.vars.length; i++) {
			let varInfo = luaDebugInfo.vars[i]
			var newvariablesReference = 0
			let valueStr = varInfo.valueStr

			valueStr = new Buffer(valueStr, 'base64').toString('utf8')
			varInfo.valueStr = valueStr

			if (varInfo.valueType == "table" || varInfo.valueType == "userdata") {
				let newVarInfo: LuaDebugVarInfo = new LuaDebugVarInfo(luaDebugInfo.frameId, varInfo.name, luaDebugInfo.type, luaDebugInfo)
				this.getNewVariablesReference(newVarInfo)
				newvariablesReference = newVarInfo.variablesReference
				luaDebugInfo.addLuaDebugVarInfo(newVarInfo)
			}

			if (varInfo.valueType == "string") {
				valueStr = '"' + valueStr + '"'
			}
			let name = varInfo.name
			if (name == null) {
				continue
			}
			if (!isNaN(parseInt(name))) {
				let nameType = typeof name
				if (nameType == "string") {
					name = '"' + name + '"'
				}
			}

			let valueType: string = varInfo.valueType
			name = String(name)
			variables.push({
				name: name,
				type: varInfo.valueType,
				value: valueStr,
				variablesReference: newvariablesReference
			})
		}
		luaDebugInfo.variables = variables

		let callFunctionArr: Array<Function> = this.reqVarsCallFunMap.get(variablesReference)
		if (callFunctionArr) {
			for (let i = 0; i < callFunctionArr.length; i++) {
				let callFunction = callFunctionArr[i]
				callFunction(luaDebugInfo)
			}
			this.reqVarsCallFunMap.delete(variablesReference)
		}
	}

	public getVarsInfos(variablesReference: number, callBack: Function): any {
		let luaDebugInfo: LuaDebugVarInfo = this.getDebugVarsInfoByVariablesReference(variablesReference)
		if (!this.luaProcess_.mainSocket) {
			callBack(null)
			return
		}
		if (luaDebugInfo != null && luaDebugInfo.variables != null) {
			callBack(luaDebugInfo.variables)
			return
		}
		let callFunArr: Array<Function> = this.reqVarsCallFunMap.get(variablesReference)
		if (callFunArr == null) {
			callFunArr = new Array<Function>()
			callFunArr.push(function (luaDebugInfo: LuaDebugVarInfo) {
				if (luaDebugInfo == null) {
					callBack(null)
				} else {
					callBack(luaDebugInfo.variables)
				}
			})
			this.reqVarsCallFunMap.set(variablesReference, callFunArr)
		} else {
			callFunArr.push(function (luaDebugInfo: LuaDebugVarInfo) {
				if (luaDebugInfo == null) {
					callBack(null)
				} else {
					callBack(luaDebugInfo.variables)
				}
			})
			return
		}
		//找到 luaDebugInfo
		let sendData = {
			variablesReference: variablesReference,
			frameId: luaDebugInfo.frameId,
			keys: luaDebugInfo.getVarKeys(),
			type: luaDebugInfo.type
		}
		this.luaProcess_.sendMsg(LuaDebuggerEvent.S2C_ReqVar, sendData)
	}

	public evaluateRequest(frameId: number, expression: string, varType: number, callFunction: Function, context: string) {
		let expressionStrs = []
		//先分解
		if (expression.indexOf('.') > -1) {
			expressionStrs = expression.split('.')
		} else {
			expressionStrs.push(expression)
		}
		//现在本地找如果本地没用再去 客户端找
		let localDebugVarInfo: LuaDebugVarInfo = null
		if (varType == 1) {
			localDebugVarInfo = this.getLocalLuaDebugInfo(frameId)
		} else if (varType == 2) {
			localDebugVarInfo = this.getUplLuaDebugInfo(frameId)
		} else if (varType == 3) {
			localDebugVarInfo = this.getGolbalLuaDebugVarInfo()
		}
		for (let i = 0; i < expressionStrs.length; i++) {
			let key = expressionStrs[i]
			let varInfo = localDebugVarInfo.getVarInfoByName(key)
			//表示还没有从客户端获取数据 需要获取
			if (varInfo == -1) {
				let scopesManager: ScopeMgr = this
				//进行数据请求
				let luaDebugInfo: LuaDebugVarInfo = this.getDebugVarsInfoByVariablesReference(localDebugVarInfo.variablesReference)
				if (luaDebugInfo) {
					this.getVarsInfos(localDebugVarInfo.variablesReference, function () {
						scopesManager.evaluateRequest(frameId, expression, varType, callFunction, context)
					})
				} else {
					callFunction(null)
				}
				return
			}
			else if (varInfo == 0) //有数据但是没找到直接忽略
			{
				callFunction(null)
				return
			} else {
				let variablesReference = 0
				//找到数据
				if (varInfo.valueType == "table" || varInfo.valueType == "userdata") {
					//找对应的 LuaDebugVarInfo
					let ldvInfo = localDebugVarInfo.getLuaDebugVarInfo(varInfo.name)
					localDebugVarInfo = ldvInfo
					if (ldvInfo == -1) {
						let scopesManager: ScopeMgr = this
						//进行数据请求
						let luaDebugInfo: LuaDebugVarInfo = this.getDebugVarsInfoByVariablesReference(localDebugVarInfo.variablesReference)
						if (luaDebugInfo) {
							this.getVarsInfos(localDebugVarInfo.variablesReference, function () {
								scopesManager.evaluateRequest(frameId, expression, varType, callFunction, context)
							})
						} else {
							callFunction(null)
						}
						return
						//数组为空
					} else if (ldvInfo == 0) {
						//没有找到
						callFunction(null)
						return
					} else if (localDebugVarInfo != null) {
						if (i == expressionStrs.length - 1) {
							let result: string = expression
							callFunction({
								result: result,
								variablesReference: localDebugVarInfo.variablesReference
							})
							return
						}
					} else {
						callFunction(null)
						return
					}
				} else {
					if (i == expressionStrs.length - 1) {
						let result: string = expression

						if (varInfo.valueType == "string") {
							result = '"' + varInfo.valueStr + '"'
						} else {
							result = varInfo.valueStr
						}
						callFunction({
							result: result,
							variablesReference: 0
						})
						return
					}
				}
			}
		}
	}

	public stepOverReq() {
		this.clear()
		if (this.reqStepCallFunction) {
			this.reqStepCallFunction(false, false)
		}
		this.reqStepCallFunction = null
		this.luaDebug.isHitBreak = false
		this.luaProcess_.sendMsg(LuaDebuggerEvent.S2C_RUN, {
			runTimeType: this.luaDebug.runtimeType,
		}
		)
	}

	/**
	 * 调试返回
	 */
	public stepRes(event: number) {
		this.clear()
		if (this.reqStepCallFunction) {
			this.reqStepCallFunction(true, false)
		}
		this.reqStepCallFunction = null
	}

	/**
	 * 下一步请求
	 */
	public stepReq(callFun: Function, event: number) {
		this.reqStepCallFunction = callFun
		this.luaProcess_.sendMsg(event)
	}
}