1. 添加 LuaDebug.lua 文件
	参考 Assets/Lua/LuaDebug.lua 文件，这是调试的主文件
	
2. 添加 LuaDebug.cs 文件
	参考 Assets/LuaDebug.cs 文件，用于查看C#的值

3. 在 CustomSettings.cs 文件中的customTypeList添加元素
	_GT(typeof(LuaDebugTool)),
    _GT(typeof(LuaValueInfo)),
	用于注册luawrap

4. 在 LuaConst.cs 中设置 openLuaSocket = true; openLuaDebugger = true;
	如果是新版本tolua的话

5. 打开Assets/Main.unity 场景

6. 运行游戏, 在Main.lua下断点测试，注意要在第一个执行文件中加
	local BREAKINFOFUNC, XPCALLFUNC = require("LuaDebug")("localhost", 7003)
	coroutine.start(
	function()
		while true do
			coroutine.wait(0.1)
			BREAKINFOFUNC()
		end
	end)
	这样可以实时刷新断点数据，无需重启游戏，参考Main.lua 文件