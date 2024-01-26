-- Apply this script under each Tool

local config_toolName = 'Example Item'
local config_toolTip = 'Example Item'
local config_hotbarIconAssetID = '92628145'

local config_replaceTerrainRange = 5
local config_replaceTerrainYMin = -500
local config_replaceTerrainYMax = 500
local config_replaceTerrainResolution = 10
local config_replaceTerrainReplaceTo = Enum.Material.Water

local tool = script.Parent
local handle = tool:FindFirstChild('Handle')
local clickDetector = tool.ClickDetector

local function Init()
	tool.Name = config_toolName
	tool.ToolTip = config_toolTip
end

local function ClickHandler(player)
	tool.Parent = player.Backpack
end

local function ActivateHandler(player)
	local pos = handle.Position
	local region = Region3.new(
		Vector3.new(pos.x - config_replaceTerrainRange, config_replaceTerrainYMin, pos.z - config_replaceTerrainRange),
		Vector3.new(pos.x + config_replaceTerrainRange, config_replaceTerrainYMax, pos.z + config_replaceTerrainRange)
	):ExpandToGrid(config_replaceTerrainResolution)
	print(region)
	game.Workspace.Terrain:FillRegion(
		region,
		config_replaceTerrainResolution,
		config_replaceTerrainReplaceTo
	)
end

Init()
clickDetector.MouseClick:Connect(ClickHandler)
tool.Activated:Connect(ActivateHandler)
