-- Apply this script to `StarterCharacterScripts`

local config_invokeKey = Enum.KeyCode.LeftShift
local config_dashMaxforceLimit = 30_000
local config_dashVelocityAmplifier = 150

local config_waitLoopRange = 8
local config_durationEachOneLoopCycle = .05
local config_decreaseOffsetOneLoopCycle = .7

local userInputService = game:GetService("UserInputService")
local character = script.Parent

local nowDashing = false

function Dash(input, processed)
	if processed then return end
	if nowDashing then return end
	
	if input.KeyCode == config_invokeKey then
		nowDashing = true
		
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.MaxForce = Vector3.new(1, 0, 1) * config_dashMaxforceLimit
		bodyVelocity.Velocity = character.HumanoidRootPart.CFrame.lookVector * config_dashVelocityAmplifier
		bodyVelocity.Parent = character.HumanoidRootPart

		for count = 1, config_waitLoopRange do
			wait(config_durationEachOneLoopCycle)
			bodyVelocity.Velocity *= config_decreaseOffsetOneLoopCycle
		end
		bodyVelocity:Destroy()
		nowDashing = false
	end
end

userInputService.InputBegan:Connect(Dash)
