import { DebugProtocol } from 'vscode-debugprotocol'
import { readFileSync } from 'fs'
import { LuaDebug } from './LuaDebug'
import { Breakpoint } from 'vscode-debugadapter'

export class BPMgr {
	private currentText: string
	private vindex: number
	private bpLines = new Map<string, Array<number>>()
	private bpMetas = new Map<string, Array<DebugProtocol.SourceBreakpoint>>()
	private bpID = 111000
	private length: number
	private line: number
	private isAddLine: boolean
	private lines: Array<number>
	private lineContent: string = ""
	private luaDebug: LuaDebug

	constructor(luaDebug: LuaDebug) {
		this.luaDebug = luaDebug
	}

	public getNextBPID() {
		return ++this.bpID
	}

	public getAllClientBreakPointInfo() {
		let data = []
		this.bpLines.forEach((v, k) => {
			let path = k
			let info = this.getClientBreakPointInfo(path)
			data.push(info)
		})
		return data
	}

	public getClientBreakPointInfo(path): any {
		path = path.replace(/\\/g, "/")
		if (this.bpLines.has(path)) {
			let lines = this.bpLines.get(path)
			let info = this.luaDebug.convertToClientPath(path, lines)
			if (info) {
				let meta = this.bpMetas.get(path)
				if (meta) {
					for (let i = 0; i < info.lines.length; i++) {
						for (let j = 0; j < meta.length; j++) {
							let bp = meta[j]
							if (bp.line == info.lines[i]) {
								// condition and hitCondition means different between Win8.1 and Win7 & OS X
								if (bp.condition) {
									if (parseInt(bp.condition)) {
										if (info.countConditions == null) {
											info.countConditions = {}
										}
										info.countConditions[bp.line] = parseInt(bp.condition)
									} else {
										if (info.hitConditions == null) {
											info.hitConditions = {}
										}
										info.hitConditions[bp.line] = bp.condition.trim()
									}
								}
								if (bp.hitCondition) {
									if (parseInt(bp.hitCondition)) {
										if (info.countConditions == null) {
											info.countConditions = {}
										}
										info.countConditions[bp.line] = parseInt(bp.hitCondition)
									} else {
										if (info.hitConditions == null) {
											info.hitConditions = {}
										}
										info.hitConditions[bp.line] = bp.hitCondition.trim()
									}
								}
								break
							}
						}
					}
				}
			}
			return info
		}
		return null
	}

	public verifiedBreakPoint(path: string, berakLines: Array<number>, sbps: Array<DebugProtocol.SourceBreakpoint>) {
		this.line = 1
		this.currentText = readFileSync(path).toString()
		this.length = this.currentText.length
		this.vindex = 0
		this.lines = new Array<number>()
		while (true) {
			this.isAddLine = true
			let charCode = this.currentText.charCodeAt(this.vindex)
			let next = this.currentText.charCodeAt(this.vindex + 1)
			if (charCode == 45 && next == 45) {
				this.scanComment()
				this.skipWhiteSpace()
			} else {
				this.lineContent += this.currentText.charAt(this.vindex)
				if (!this.consumeEOL()) {
					this.vindex++
				}
			}
			if (this.vindex >= this.length) {
				this.addLine()
				break
			}
		}
		let count = this.lines.length
		let bps = new Array<Breakpoint>()
		let lines = new Array<number>()
		for (let index = 0; index < berakLines.length; index++) {
			this.addBreakPoint(berakLines[index], bps, lines)
		}
		path = path.replace(/\\/g, "/")
		this.bpLines.set(path, lines)
		this.bpMetas.set(path, sbps)
		return bps
	}

	private addBreakPoint(line: number, bps: Array<Breakpoint>, lines: Array<number>) {
		for (let index = 0; index < this.lines.length; index++) {
			let fline = this.lines[index]
			if (fline >= line) {
				if (lines.indexOf(fline) == -1) {
					const bp: DebugProtocol.Breakpoint = new Breakpoint(true, fline)
					lines.push(fline)
					bps.push(bp)
					bp.id = this.getNextBPID()
					bp.verified = true
				}
				break
			}
		}
	}

	private addLine() {
		this.lineContent = this.lineContent.trim()
		if (this.lineContent.length > 0) {
			this.lines.push(this.line)
			this.lineContent = ""
		}
	}

	private scanComment(): void {
		//  this.tokenStart = this.vindex
		this.isAddLine = false
		this.vindex += 2
		//当前字符
		let character = this.currentText.charAt(this.vindex)
		//注释内容
		let content
		// 是否为长注释  --[[  长注释 ]]
		let isLong = false
		let commentStart = this.vindex
		if ('[' == character) {
			content = this.readLongString()
			if (content == false) {
				content = character
			}
			else {
				isLong = true
			}
		}
		if (!isLong) {
			while (this.vindex < this.length) {
				if (this.isLineTerminator(this.currentText.charCodeAt(this.vindex))) break
				this.vindex++
			}
		}
	}

	private readLongString(): any {
		//多少个  等于符号
		let level: number = 0
		//注释内容  
		let content: string = ''
		let terminator: boolean = false
		let character: string = null
		let stringStart: number = 0
		this.vindex++ //将位置移到 需要判断的字符  上已阶段以及判断到了 [
		// 获取等于符号的多少
		while ('=' === this.currentText.charAt(this.vindex + level)) {
			level++
		}
		// 如果是[ 那么继续 如果不为 [ 那么 直接返回
		if ('[' !== this.currentText.charAt(this.vindex + level)) {
			return false
		}
		this.vindex += level + 1
		if (this.isLineTerminator(this.currentText.charCodeAt(this.vindex))) {
			this.consumeEOL()
		}
		//注释开始的位置
		stringStart = this.vindex
		// 读取注释内容
		while (this.vindex < this.length) {
			while (true) {
				if (this.isLineTerminator(this.currentText.charCodeAt(this.vindex))) {
					this.consumeEOL()
				} else {
					break
				}
			}
			character = this.currentText.charAt(this.vindex++)
			if (']' == character) {
				terminator = true
				for (let i = 0; i < level; i++) {
					if ('=' !== this.currentText.charAt(this.vindex + i)) {
						terminator = false
					}
				}
				if (']' !== this.currentText.charAt(this.vindex + level)) {
					terminator = false
				}
			}
			if (terminator) break
		}
		if (terminator) {
			content += this.currentText.slice(stringStart, this.vindex - 1)
			this.vindex += level + 1
			this.lineContent = ""
			return content
		}
		return false
	}

	public isLineTerminator(charCode): boolean {
		return 10 === charCode || 13 === charCode
	}

	private skipWhiteSpace(): void {
		while (this.vindex < this.length) {
			let charCode = this.currentText.charCodeAt(this.vindex)
			if (this.isWhiteSpace(charCode)) {
				this.vindex++
			}
			else if (!this.consumeEOL()) {
				break
			}
		}
	}

	private consumeEOL(): boolean {
		let charCode = this.currentText.charCodeAt(this.vindex)
		let peekCharCode = this.currentText.charCodeAt(this.vindex + 1)
		if (this.isLineTerminator(charCode)) {
			if (10 === charCode && 13 === peekCharCode) this.vindex++
			if (13 === charCode && 10 === peekCharCode) this.vindex++
			if (this.isAddLine) {
				this.addLine()
			}
			this.line++
			++this.vindex
			return true
		}
		return false
	}

	public isWhiteSpace(charCode): boolean {
		return 9 === charCode || 32 === charCode || 0xB === charCode || 0xC === charCode
	}

}