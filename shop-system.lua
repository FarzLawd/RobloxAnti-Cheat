-- Shop System - Sistem Toko dengan GUI & Server Validation
-- ServerScriptService

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- RemoteEvent untuk beli item (client -> server)
local buyEvent = Instance.new("RemoteEvent")
buyEvent.Name = "BuyItemEvent"
buyEvent.Parent = ReplicatedStorage

-- Daftar item toko
local SHOP_ITEMS = {
	SpeedBoost = { price = 50, attribute = "WalkSpeed", value = 20 },
	DoubleJump = { price = 100, attribute = "JumpPower", value = 100 },
}

-- Fungsi beli (validasi di server untuk anti-exploit)
buyEvent.OnServerEvent:Connect(function(player, itemName)
	local item = SHOP_ITEMS[itemName]
	if not item then
		return
	end

	local leaderstats = player:FindFirstChild("leaderstats")
	local coins = leaderstats and leaderstats:FindFirstChild("Coins")
	if not coins then
		return
	end

	-- Cek saldo cukup
	if coins.Value < item.price then
		return
	end

	-- Potong saldo & terapkan efek
	coins.Value = coins.Value - item.price

	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid:FindFirstChild(item.attribute) then
			humanoid[item.attribute].Value = item.value
		end
	end
end)
