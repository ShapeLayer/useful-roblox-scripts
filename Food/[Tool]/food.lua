local config_healingOffset = 50
local config_isDisposable = true

local Tool = script.Parent
local Player = Tool.Parent.Parent;

local function min(a, b)
	if a > b then
		return b
	else
		return a
	end
end

local function Eat ()
	local Character = Player.Character or Player.Character:Wait();
	local Humanoid = Character:WaitForChild("Humanoid");
	Humanoid.Health = min(100, Humanoid.Health + config_healingOffset)
end

local function ActivateHandler ()
	Eat()
	if config_isDisposable then
		Tool:Destroy()
	end
end

Tool.Activated:Connect(ActivateHandler)
