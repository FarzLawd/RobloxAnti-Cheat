-- GUI Shop - Script Client (LocalScript) untuk UI Toko
-- Letakkan di StarterGui (LocalScript)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local buyEvent = ReplicatedStorage:WaitForChild("BuyItemEvent")

-- Buat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ShopGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame utama
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = screenGui

-- Judul
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "🛒 Shop"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

-- Tombol beli SpeedBoost
local buyButton = Instance.new("TextButton")
buyButton.Size = UDim2.new(0.8, 0, 0, 40)
buyButton.Position = UDim2.new(0.1, 0, 0.3, 0)
buyButton.Text = "Beli Speed Boost (50 Coins)"
buyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
buyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
buyButton.Parent = frame

buyButton.MouseButton1Click:Connect(function()
	buyEvent:FireServer("SpeedBoost")
end)
