-- Shop System - Shop with server-side validation
-- Place in ServerScriptService

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- RemoteEvent for buying items (client -> server)
local buyEvent = Instance.new("RemoteEvent")
buyEvent.Name = "BuyItemEvent"
buyEvent.Parent = ReplicatedStorage

-- Shop item list
local SHOP_ITEMS = {
	SpeedBoost = { price = 50, attribute = "WalkSpeed", value = 20 },
	DoubleJump = { price = 100, attribute = "JumpPower", value = 100 },
}

-- Purchase handler (validated on server to prevent exploits)
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

	-- Check if the player has enough coins
	if coins.Value < item.price then
		return
	end

	-- Deduct coins & apply the effect
	coins.Value = coins.Value - item.price

	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid:FindFirstChild(item.attribute) then
			humanoid[item.attribute].Value = item.value
		end
	end
end)
