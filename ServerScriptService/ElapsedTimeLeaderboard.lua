-- Apply this script to `ServerScriptService`

local config_time_waits = .1

function LeaderboardHandler (player)

	local leaderboard = Instance.new("IntValue", player)
	leaderboard.Name = "leaderstats"

	local ratings = Instance.new("IntValue", leaderboard)
	ratings.Name = "Ratings"
	ratings.Value = 0


	while true do
		wait(config_time_waits)
		ratings.Value += 1
	end
end

game.Players.PlayerAdded:Connect(LeaderboardHandler)
