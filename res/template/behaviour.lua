--------------------------------------------
-- Copyright © {copyright}
-- File: {module}.lua
-- Author: {author}
-- Date: {date}
-- Desc:
--------------------------------------------
{module} = {
	transform = nil,
	gameObject = nil,
	enabled = false
}

local this = {module}

function {module}.Awake(go)
	this.gameObject = go
	this.transform = go.transform
end

function {module}.OnEnable()
	this.enabled = true
end

function {module}.Start()
end

function {module}.OnDisable()
	this.enabled = false
end

function {module}.OnDestroy()
	this.transform = nil
	this.gameObject = nil
end