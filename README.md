# 🛡️ Roblox Anti-Cheat

A collection of **Luau scripts** for keeping your Roblox game secure and exploit-resistant. Includes an **anti-cheat system** plus supporting game systems built with **server-side validation** to prevent cheating.

> ⚠️ All scripts are safe and legitimate — built to *protect* your game, and fully compliant with the Roblox Terms of Service.

## 🛡️ Security Features

### `anti-cheat.lua` — Exploit Detection

- Monitors players continuously and resets abnormal **WalkSpeed** & **JumpPower**
- Detects common speed / jump hacks in real time
- Configurable limits (`MAX_SPEED`, `MAX_JUMP`, `CHECK_INTERVAL`)

### Server-Side Validation

Every script that affects gameplay validates data on the **server**, so players can't tamper with values from the client:

- **`shop-system.lua`** — checks coin balance server-side before applying purchases
- **`leaderstats.lua`** — stats are managed server-side with DataStore saving

## 📁 Script List

| File | Description | Location |
|------|-------------|----------|
| `anti-cheat.lua` | Speed/jump exploit detection & auto-reset | ServerScriptService |
| `shop-system.lua` | Shop with server-side purchase validation | ServerScriptService |
| `leaderstats.lua` | Leaderboard + player data saving (DataStore) | ServerScriptService |
| `teleport-system.lua` | Teleport between Places | ServerScriptService |
| `gui-shop.lua` | Shop UI for players (client) | StarterGui (LocalScript) |

## ⚙️ Setup

1. Open **Roblox Studio**
2. Open your game project
3. Go to **View → Explorer**
4. Place each script according to the table above:
   - **Server** scripts → put in `ServerScriptService`
   - **Client** script (`gui-shop.lua`) → put in `StarterGui` (as a **LocalScript**)
5. Update the configuration values as needed

## 🛠️ Configuration

| File | What to change |
|------|----------------|
| `anti-cheat.lua` | `MAX_SPEED`, `MAX_JUMP`, `CHECK_INTERVAL` thresholds |
| `teleport-system.lua` | Replace `Place IDs` with your own |
| `shop-system.lua` | Adjust the item list & prices |
| `leaderstats.lua` | Enable **Enable Studio Access to API Services** for DataStore |

## 🔒 How They Work Together

1. **`anti-cheat.lua`** is the core — it continuously monitors players and resets abnormal speed/jump values.
2. **`leaderstats.lua`** gives every player a `Coins` and `Level` stat, saved automatically via DataStore.
3. **`shop-system.lua`** validates purchases server-side (so players can't cheat their coins).
4. **`gui-shop.lua`** (client) shows the shop button and fires the request to the server.
5. **`teleport-system.lua`** moves players between different Places in your game.

## 📝 Notes

- All gameplay logic runs with **server-side validation** to prevent exploits.
- Everything complies with the Roblox Terms of Service.
- To learn more: [Roblox Creator Documentation](https://create.roblox.com/docs)
