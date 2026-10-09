-- Teleport System - Move players between Places
-- Place in ServerScriptService

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Place ID configuration
local PLACES = {
	Lobby = 1234567890,    -- Replace with your lobby Place ID
	Game = 1234567891,     -- Replace with your game Place ID
	Shop = 1234567892,     -- Replace with your shop Place ID
}

-- Teleport a single player
local function teleportPlayer(player, placeName)
	local placeId = PLACES[placeName]
	if not placeId then
		warn("Place not found: " .. tostring(placeName))
		return
	end

	local success, errorMessage = pcall(function()
		TeleportService:Teleport(placeId, player)
	end)

	if not success then
		warn("Teleport failed: " .. tostring(errorMessage))
	end
end

-- Teleport all players
local function teleportAll(placeName)
	local players = Players:GetPlayers()
	for _, player in ipairs(players) do
		teleportPlayer(player, placeName)
	end
end

-- Example: teleport everyone to the Lobby after 60 seconds
-- task.wait(60)
-- teleportAll("Lobby")

return {
	teleportPlayer = teleportPlayer,
	teleportAll = teleportAll,
}
