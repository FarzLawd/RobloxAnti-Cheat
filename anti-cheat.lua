-- Anti-Cheat - Deteksi Exploit Sederhana (Server)
-- ServerScriptService

local Players = game:GetService("Players")

local MAX_SPEED = 50      -- Batas kecepatan normal
local MAX_JUMP = 120      -- Batas jump power normal
local CHECK_INTERVAL = 5  -- Cek setiap 5 detik

-- Fungsi cek exploit
local function checkPlayer(player)
	local character = player.Character
	if not character then
		return
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end

	-- Cek kecepatan tidak wajar
	if humanoid.WalkSpeed > MAX_SPEED then
		warn(player.Name .. " terdeteksi speed exploit! Speed: " .. humanoid.WalkSpeed)
		humanoid.WalkSpeed = 16 -- Reset ke default
	end

	-- Cek jump power tidak wajar
	if humanoid.JumpPower > MAX_JUMP then
		warn(player.Name .. " terdeteksi jump exploit! Jump: " .. humanoid.JumpPower)
		humanoid.JumpPower = 50 -- Reset ke default
	end
end

-- Loop pengecekan berkala
task.spawn(function()
	while true do
		for _, player in ipairs(Players:GetPlayers()) do
			pcall(checkPlayer, player)
		end
		task.wait(CHECK_INTERVAL)
	end
end)
