1. *.txt ->*.lua 工作流改造
	参考 Assets/XLua/Examples/13_Debug/Main.cs 文件，主要就是自定义LuaEnv.CustomLoader
	
2. 添加 LuaDebug.cs 和 LuaDebug.lua 文件
	参考 Assets/XLua/Examples/13_Debug/ 目录

3. 打开Assets/XLua/Examples/13_Debug/Main.unity 场景

4. 运行游戏, 在Main.lua下断点测试，注意要在第一个执行文件中加
	local util = require 'xlua.util'
	local yield_return = (require 'xlua.cs_coroutine').yield_return
	local BREAKINFOFUNC, XPCALLFUNC = require("LuaDebug")("localhost", 7003)
	local co = coroutine.create(
		function()
			while true do
			yield_return(CS.UnityEngine.WaitForSeconds(0.1))
			BREAKINFOFUNC()
		end
	end)
	coroutine.resume(co)
	这样可以实时刷新断点数据，无需重启游戏，参考Main.lua 文件