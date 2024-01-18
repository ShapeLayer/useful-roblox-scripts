-- Apply this script to `StarterCharacterScripts`

local config_invoke_key = Enum.KeyCode.LeftShift
local config_dash_maxforce_limit = 30_000
local config_dash_velocity_amplifier = 150

local config_wait_loop_range = 8
local config_duration_each_one_loop_cycle = .05

local userInputService = game:GetService("UserInputService")
local character = script.Parent

local now_dashing = false

function Dash(input, processed)
	if processed then return end
	if now_dashing then return end
	
	if input.KeyCode == config_invoke_key then
		now_dashing = true
		
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.MaxForce = Vector3.new(1,0,1) * 30000
		bodyVelocity.Velocity = character.HumanoidRootPart.CFrame.lookVector * config_dash_velocity_amplifier
		bodyVelocity.Parent = character.HumanoidRootPart

		for count = 1, config_wait_loop_range do
			wait(config_duration_each_one_loop_cycle)
			bodyVelocity.Velocity*= 0.7
		end
		bodyVelocity:Destroy()
		now_dashing = false
	end
end

userInputService.InputBegan:Connect(Dash)
