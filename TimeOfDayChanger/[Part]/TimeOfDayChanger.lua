local Lighting = game:GetService('Lighting')
local ClickDetector = script.Parent.ClickDetector

local function GetTimeofDay()
	local timeOfDay = Lighting.TimeOfDay
	local hours = string.sub(timeOfDay, 1, 2)
	local mins = string.sub(timeOfDay, 4, 5)
	local secs = string.sub(timeOfDay, 7, 8)
	return { tonumber(hours), tonumber(mins), tonumber(secs) }
end

local function toTimeOfDayFormat(hours, mins, secs)
	return string.format('%02.f', hours) .. ':' .. string.format('%02.f', mins) .. ':' .. string.format('%02.f', secs)
end

local function SetTimeOfDay(hours, mins, secs)
	Lighting.TimeOfDay = toTimeOfDayFormat(hours, mins, secs)
end

local function ClickHandler()
	local now = GetTimeofDay()
	local now_hours = now[1]
	local now_mins = now[2]
	local now_secs = now[3]
	
	if now_hours < 12 then
		SetTimeOfDay(12, 0, 0)
	else
		SetTimeOfDay(0, 0, 0)
	end
end

ClickDetector.MouseClick:Connect(ClickHandler)
