local BREAKINFOFUNC, XPCALLFUNC = require("LuaDebug")("localhost", 7003)
coroutine.start(
function()
    while true do
        coroutine.wait(0.1)
        BREAKINFOFUNC()
    end
end)

--主入口函数。从这里开始lua逻辑
function Main()
    print("logic start")
end

--场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
end