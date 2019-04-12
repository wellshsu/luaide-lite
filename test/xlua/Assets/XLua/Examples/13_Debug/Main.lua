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

Main = {}

function Main.Awake(gameObject)
    print("Main.Awake")
end

function Main.Start()
    print("Main.Start")
end

function Main.Update()
    local a = 1
end

function Main.OnDestroy()
    print("Main.OnDestroy")
end