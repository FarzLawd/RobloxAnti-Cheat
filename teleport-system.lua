-- Teleport System - Pindah Antar Tempat (Place)
-- ServerScriptService

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Konfigurasi place ID
local PLACES = {
	Lobby = 1234567890,    -- Ganti dengan Place ID lobby
	Game = 1234567891,     -- Ganti dengan Place ID game
	Shop = 1234567892,     -- Ganti dengan Place ID shop
}

-- Fungsi teleport
local function teleportPlayer(player, placeName)
	local placeId = PLACES[placeName]
	if not placeId then
		warn("Place tidak ditemukan: " .. tostring(placeName))
		return
	end

	local success, errorMessage = pcall(function()
		TeleportService:Teleport(placeId, player)
	end)

	if not success then
		warn("Gagal teleport: " .. tostring(errorMessage))
	end
end

-- Teleport semua pemain
local function teleportAll(placeName)
	local players = Players:GetPlayers()
	for _, player in ipairs(players) do
		teleportPlayer(player, placeName)
	end
end

-- Contoh: teleport semua ke Lobby setelah 60 detik
-- task.wait(60)
-- teleportAll("Lobby")

return {
	teleportPlayer = teleportPlayer,
	teleportAll = teleportAll,
}
