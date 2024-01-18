local config_coolDown = .5
local config_eventName = "InvokeJump"

local rs = game:GetService("ReplicatedStorage")
local event = rs:WaitForChild(config_eventName)

-- Frame object named "ProgressBar" must be generated under the this script's parent.
local progressBar = script.Parent.ProgressBar
local progressBar_anchorPoint = Vector2.new(0, .5)
local progressBar_position_x = .01
local progressBar_position_y = .3
local progressBar_size_x = .1
local progressBar_size_y = .1

function Init()
	progressBar.AnchorPoint = progressBar_anchorPoint
	progressBar.Position = UDim2.new(progressBar_position_x, 0, progressBar_position_y, 0)
	progressBar.Size = UDim2.new(progressBar_size_x, 0, progressBar_size_x, 0)
end

function Handler ()
	progressBar.Size = UDim2.new(0, 0, progressBar_size_y, 0)
	progressBar:TweenSize(UDim2.new(progressBar_size_x, 0, progressBar_size_y, 0), "In", "Linear", config_coolDown, true)
end

Init()

event.OnServerEvent:Connect(Handler)
