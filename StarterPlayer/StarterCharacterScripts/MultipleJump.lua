-- Apply this script to `StarterCharacterScripts`

local config_jumpCooldown = .2
local config_additionalJumps = 2
local config_additionalVelocity = Vector3.new(0, 100, 0)

local userInputService = game:GetService("UserInputService")
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

local additionalJumps = 2
local previousJump = tick()

local function MultipleJump()
	local now = tick()
	if now - previousJump >= config_jumpCooldown then
		if humanoid:GetState() == Enum.HumanoidStateType.Freefall and additionalJumps > 0 then
			additionalJumps -= 1
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			character.HumanoidRootPart.Velocity += config_additionalVelocity
		end
	end
end

humanoid.StateChanged:Connect(function(old, new)
	if new == Enum.HumanoidStateType.Landed then
		additionalJumps = config_additionalJumps
	elseif new == Enum.HumanoidStateType.Jumping then
		previousJump = tick()
	end
end)

userInputService.JumpRequest:Connect(MultipleJump)
