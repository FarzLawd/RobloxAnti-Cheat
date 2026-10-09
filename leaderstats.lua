-- Leaderstats - Sistem Leaderboard & Leaderstats
-- Letakkan di ServerScriptService

local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local coinsStore = DataStoreService:GetDataStore("CoinsStore")

Players.PlayerAdded:Connect(function(player)
	-- Buat folder leaderstats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	-- Stat Coins
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Parent = leaderstats

	-- Stat Level
	local level = Instance.new("IntValue")
	level.Name = "Level"
	level.Value = 1
	level.Parent = leaderstats

	-- Load data
	local success, savedCoins = pcall(function()
		return coinsStore:GetAsync(player.UserId)
	end)

	if success and savedCoins then
		coins.Value = savedCoins
	else
		coins.Value = 100 -- Nilai awal
	end
end)

-- Simpan data saat pemain keluar
Players.PlayerRemoving:Connect(function(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			pcall(function()
				coinsStore:SetAsync(player.UserId, coins.Value)
			end)
		end
	end
end)
