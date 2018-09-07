-- demo 1
local func1 = function(scene)
    self:GetBData().ciScenes.pause[tostring(params.tag)] = scene
end

-- demo 2
local class1 = {
    overCB = function()
    end,
    dieCB = function()
        BMediator:GetBData().ciScenes.pause[tostring(tag)] = nil
    end
}

-- demo 3
gameMgr:GetUserInfo().chef[k] = nil
gameMgr:GetUserInfo().employee[k] = nil


-- demo 4
checktable(self.userInfo.cards[tostring(id)].feedLeftTimes)[tostring(boxId)] = leftTimes

-- demo 5
local foo = {}
function foo:bar(tbl)
    return self
end
function foo:baz()
    self:bar {}:bar {}
end