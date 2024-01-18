local config_eventName = "InvokeJump"

local rs = game:GetService("ReplicatedStorage")
local jumpEvent = rs:WaitForChild(config_eventName)
jumpEvent:FireServer()
