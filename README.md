# 🎮 Roblox Scripts

A collection of **Luau scripts** for Roblox games (used inside Roblox Studio). These scripts are safe, legitimate, and built for in-game features — not account bots or automation.

## 📁 Script List

| File | Description | Location |
|------|-------------|----------|
| `leaderstats.lua` | Leaderboard + player data saving (DataStore) | ServerScriptService |
| `shop-system.lua` | Shop system with server-side validation | ServerScriptService |
| `gui-shop.lua` | Shop UI for players (client) | StarterGui (LocalScript) |
| `teleport-system.lua` | Teleport between Places | ServerScriptService |
| `anti-cheat.lua` | Simple speed/jump exploit detection | ServerScriptService |

## ⚙️ Setup

1. Open **Roblox Studio**
2. Open your game project
3. Go to **View → Explorer**
4. Place each script according to the table above:
   - **Server** scripts → put in `ServerScriptService`
   - **Client** script (`gui-shop.lua`) → put in `StarterGui` (as a **LocalScript**)
5. Update the configuration values (Place IDs, prices, etc.) as needed

## 🛠️ Configuration You Should Change

- `teleport-system.lua` → replace the `Place IDs` with your own
- `shop-system.lua` → adjust the item list & prices
- `leaderstats.lua` → enable **Enable Studio Access to API Services** in your game settings for DataStore to work

## 🔒 How They Work Together

1. **`leaderstats.lua`** runs on the server and gives every player a `Coins` and `Level` stat, saved automatically via DataStore.
2. **`shop-system.lua`** listens for purchase requests and validates them server-side (so players can't cheat their coins).
3. **`gui-shop.lua`** (client) shows the shop button and fires the purchase request to the server.
4. **`teleport-system.lua`** lets you move players between different Places in your game.
5. **`anti-cheat.lua`** continuously monitors players and resets abnormal speed/jump values.

## 📝 Notes

- All scripts use **server-side validation** to prevent exploits.
- Everything complies with the Roblox Terms of Service.
- To learn more: [Roblox Creator Documentation](https://create.roblox.com/docs)
