local part = script.Parent
local clickDetector = part.ClickDetector

local tools = game.ReplicatedStorage.tools:GetChildren()

local function PickRandomItems()
	local rand = math.random(1, #tools)
	local clone = tools[rand]:Clone()
	return clone
end

local function ClickHandler(player)
	local clone = PickRandomItems()
	clone.Parent = game.Workspace
	clone.Handle.Position = part.Position
	part:Destroy()
end

clickDetector.MouseClick:Connect(ClickHandler)
