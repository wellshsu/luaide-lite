import { EventEmitter } from 'events'
import * as net from 'net'
import * as childProcess from 'child_process'
import { LuaDebug, DebugMode } from './LuaDebug'
var path = require('path')
var fs = require('fs')
import { TerminatedEvent, OutputEvent, Event, Breakpoint } from 'vscode-debugadapter'

export enum LuaDebuggerEvent {
    S2C_SetBreakPoints = 1, // 断点设置成功
    C2S_SetBreakPoints = 2,
    S2C_RUN = 3,
    C2S_HITBreakPoint = 4, // 命中断点
    S2C_ReqVar = 5,
    C2S_ReqVar = 6,
    S2C_NextRequest = 7, // 单步跳过
    C2S_NextResponse = 8, // 单步跳过反馈
    S2C_NextResponseOver = 9, // 没有单步跳过了 直接跳过
    S2C_StepInRequest = 10, // 单步跳入
    C2S_StepInResponse = 11, // 单步跳入返回
    S2C_StepOutRequest = 12, // 单步跳出
    C2S_StepOutResponse = 13, // 单步跳出返回
    C2S_LuaPrint = 14, // 打印
    S2C_LoadLuaScript = 16, // 执行lua字符串
    C2S_LoadLuaScript = 18,
    C2S_SetSocketName = 17, // 设置socket的名字
    C2S_DebugXpCall = 20,
    S2C_DebugClose = 21,
    S2C_SetVariable = 30, // 设置变量
    C2S_SetVariable = 31,
    S2C_PauseThread = 32, // 挂起
    S2S_EADDRINUSE = 99, // 端口占用
}

export enum ClientStatus {
    ready,
    connected,
    closed
}

export class NetMgr extends EventEmitter {
    private server: net.Server
    private luaDebug: LuaDebug
    public mainSocket: net.Socket
    public breakPointSocket: net.Socket
    public loadLuaCallBack: Function
    private jsonStrs: Map<net.Socket, string>
    public port: number
    private debugprocess: childProcess.ChildProcess
    private socketState: ClientStatus
    public delayMsgs: Array<any>

    public getSocketState(): ClientStatus {
        return this.socketState
    }

    public setSocketState(state: ClientStatus) {
        this.socketState = state
    }

    public close() {
        this.server.close()
        this.server = null
    }

    public runLuaScript(data, callBack: Function) {
        this.loadLuaCallBack = callBack
        var socket = this.luaDebug.isHitBreak == true ? this.mainSocket : this.breakPointSocket
        this.sendMsg(LuaDebuggerEvent.S2C_LoadLuaScript, data, socket)
    }

    public checkStackTopFileIsExist(stackInfo) {
        var path = stackInfo.src
        if (path.indexOf(".lua") == -1) {
            path = path + ".lua"
        }
        path = this.luaDebug.convertToServerPath(stackInfo.src)
        var isEx = fs.existsSync(path)
        if (path == "" || !fs.existsSync(path)) {
            return false
        } else {
            return true
        }
    }

    public createServer(restart) {
        var that = this
        this.jsonStrs = new Map<net.Socket, string>()
        var luaProcess: NetMgr = this
        var luaDebug: LuaDebug = this.luaDebug
        this.delayMsgs = new Array<any>()
        this.server = net.createServer(function (socket) {
            luaProcess.setSocketState(ClientStatus.connected)
            this.socketConnected = true
            socket.setEncoding('utf8')
            socket.on('data', function (data: string) {
                if (data) {
                } else {
                    luaDebug.sendEvent(new OutputEvent("Invalid socket data."))
                    return
                }
                var jsonStr: string = luaProcess.jsonStrs.get(socket)
                if (jsonStr) {
                    data = jsonStr + data
                }
                //消息分解
                var datas: string[] = data.split("__debugger_k0204__")
                var jsonDatas: Array<any> = new Array<any>()
                for (var index = 0; index < datas.length; index++) {
                    var element = datas[index]
                    if (element == "") {
                        continue
                    }
                    if (element == null) {
                        continue
                    }
                    try {
                        var jdata = JSON.parse(element)
                        jsonDatas.push(jdata)
                    } catch (error) {
                        jsonDatas = null
                        luaProcess.jsonStrs.set(socket, data)
                        return
                    }
                }
                luaProcess.jsonStrs.delete(socket)
                for (var index = 0; index < jsonDatas.length; index++) {
                    var jdata = jsonDatas[index]
                    var event: number = jdata.event
                    if (event == LuaDebuggerEvent.C2S_SetBreakPoints) {
                    } else if (event == LuaDebuggerEvent.C2S_HITBreakPoint) {
                        luaDebug.isHitBreak = true
                        luaProcess.emit("C2S_HITBreakPoint", jdata)
                    } else if (event == LuaDebuggerEvent.C2S_ReqVar) {
                        luaProcess.emit("C2S_ReqVar", jdata)
                    } else if (event == LuaDebuggerEvent.C2S_NextResponse) {
                        luaProcess.emit("C2S_NextResponse", jdata)
                    }
                    else if (event == LuaDebuggerEvent.S2C_NextResponseOver) {
                        luaProcess.emit("S2C_NextResponseOver", jdata)
                    } else if (event == LuaDebuggerEvent.C2S_StepInResponse) {
                        luaProcess.emit("C2S_StepInResponse", jdata)
                    } else if (event == LuaDebuggerEvent.C2S_StepOutResponse) {
                        luaProcess.emit("C2S_StepOutResponse", jdata)
                    } else if (event == LuaDebuggerEvent.C2S_LuaPrint) {
                        luaProcess.emit("C2S_LuaPrint", jdata)
                    } else if (event == LuaDebuggerEvent.C2S_LoadLuaScript) {
                        if (luaProcess.loadLuaCallBack) {
                            luaProcess.loadLuaCallBack(
                                {
                                    result: jdata.data.msg,
                                    variablesReference: 0
                                }
                            )
                            luaProcess.loadLuaCallBack = null
                        }
                    }
                    else if (event == LuaDebuggerEvent.C2S_DebugXpCall) {
                        luaDebug.isHitBreak = true
                        luaProcess.emit("C2S_HITBreakPoint", jdata)
                    }
                    else if (event == LuaDebuggerEvent.C2S_SetSocketName) {
                        if (jdata.data.name == "mainSocket") {
                            luaDebug.sendEvent(new OutputEvent("Client is connected.\n"))
                            luaProcess.mainSocket = socket
                            //发送断点信息
                            luaProcess.sendAllBreakPoint()
                            //发送运行程序的指令 发送run 信息时附带运行时信息 
                            luaDebug.isHitBreak = false
                            luaProcess.sendMsg(LuaDebuggerEvent.S2C_RUN,
                                {
                                    runTimeType: luaDebug.runtimeType,
                                    isProntToConsole: luaDebug.printType,
                                    printType: luaDebug.printType
                                })
                        } else if (jdata.data.name == "breakPointSocket") {
                            luaProcess.breakPointSocket = socket
                        }
                    } else if (event == LuaDebuggerEvent.C2S_SetVariable) {
                        luaProcess.emit("C2S_SetVariable", jdata)
                    } else if (event == LuaDebuggerEvent.S2S_EADDRINUSE) {
                        luaProcess.sendMsg(LuaDebuggerEvent.S2C_DebugClose)
                        luaDebug.sendEvent(new TerminatedEvent())
                        socket.end()
                    }
                }
            })
            socket.on('error', function (exception) {
                luaDebug.sendEvent(new OutputEvent("Socket: " + exception + "\n"))
                luaDebug.sendEvent(new TerminatedEvent())
                socket.end()
            })
            socket.on('close', function (data) {
                luaDebug.sendEvent(new OutputEvent('Client is disconnected.\n'))
            })
        }).listen(this.port)
        this.server.on('listening', function () {
            luaDebug.sendEvent(new OutputEvent("Server is listening " + luaProcess.server.address().port + ".\n"))
        })
        this.server.on("error", function (exception) {
            if (exception.message.indexOf("EADDRINUSE") > -1 && restart) {
                var client = new net.Socket()
                client.setEncoding("utf8")
                client.connect(that.port, "localhost", function () {
                    var sendMsg = { event: LuaDebuggerEvent.S2S_EADDRINUSE }
                    var msg = JSON.stringify(sendMsg)
                    if (client.writable) {
                        client.write(msg)
                    }
                })
                setTimeout(function () {
                    that.createServer(false)
                }, 200)
            } else {
                luaDebug.sendEvent(new OutputEvent("Socket: " + exception + "\n"))
                luaDebug.sendEvent(new TerminatedEvent())
            }
        })
    }

    public sendMsg(event: number, data?: any, socket?: net.Socket) {
        var sendMsg = {
            event: event,
            data: data
        }
        try {
            var msg = JSON.stringify(sendMsg)
            if (socket == null) {
                socket = this.mainSocket
            }
            if (socket && socket.writable) {
                socket.write(msg + "\n")
            }
        } catch (err) {
            this.luaDebug.sendEvent(new OutputEvent("Send msg: " + err + "\n"))
        }
    }

    public sendAllBreakPoint() {
        var infos = this.luaDebug.breakPointData.getAllClientBreakPointInfo()
        this.sendMsg(LuaDebuggerEvent.S2C_SetBreakPoints, infos, this.mainSocket)
    }

    public constructor(luaDebug: LuaDebug, mode: DebugMode, args: any) {
        super()
        this.port = args.port
        this.luaDebug = luaDebug
        this.createServer(true)
    }

}
