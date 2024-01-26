-- Apply this script to `ServerScriptService`

-- `animateScript.run.RunAnim` is for R15 model.
-- `animateScript.walk.WalkAnim` is for R6 model.
-- If apply animation for R6 model to R15 model, animation cannot be played correctly.

local config_RunAnimID = '16120289806'

local Players = game:GetService('Players')

local function onCharacterAdded(character)
	-- Get animator on humanoid
	local humanoid = character:WaitForChild('Humanoid')
	local animator = humanoid:WaitForChild('Animator')

	-- Stop all animation tracks
	for _, playingTrack in animator:GetPlayingAnimationTracks() do
		playingTrack:Stop(0)
	end

	local animateScript = character:WaitForChild('Animate')
	animateScript.run.RunAnim.AnimationId = 'rbxassetid://' .. config_RunAnimID
	--animateScript.walk.WalkAnim.AnimationId = 'rbxassetid://16120289806'
	--animateScript.jump.JumpAnim.AnimationId = 'rbxassetid://'
	--animateScript.idle.Animation1.AnimationId = 'rbxassetid://'
	--animateScript.idle.Animation2.AnimationId = 'rbxassetid://'
	--animateScript.fall.FallAnim.AnimationId = 'rbxassetid://'
	--animateScript.swim.Swim.AnimationId = 'rbxassetid://'
	--animateScript.swimidle.SwimIdle.AnimationId = 'rbxassetid://'
	--animateScript.climb.ClimbAnim.AnimationId = 'rbxassetid://'
end

local function onPlayerAdded(player)
	player.CharacterAppearanceLoaded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)