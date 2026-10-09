-- Anti-Cheat - Simple exploit detection (server)
-- Place in ServerScriptService

local Players = game:GetService("Players")

local MAX_SPEED = 50      -- Normal speed limit
local MAX_JUMP = 120      -- Normal jump power limit
local CHECK_INTERVAL = 5  -- Check every 5 seconds

-- Exploit check function
local function checkPlayer(player)
	local character = player.Character
	if not character then
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end

	-- Check for abnormal speed
	if humanoid.WalkSpeed > MAX_SPEED then
		warn(player.Name .. " detected with speed exploit! Speed: " .. humanoid.WalkSpeed)
		humanoid.WalkSpeed = 16 -- Reset to default
	end

	-- Check for abnormal jump power
	if humanoid.JumpPower > MAX_JUMP then
		warn(player.Name .. " detected with jump exploit! Jump: " .. humanoid.JumpPower)
		humanoid.JumpPower = 50 -- Reset to default
	end
end

-- Periodic check loop
task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			pcall(checkPlayer, player)
		end
		task.wait(CHECK_INTERVAL)
	end
end)
