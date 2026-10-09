# 🎮 Roblox Scripts

Kumpulan **script Luau** untuk game Roblox (digunakan di Roblox Studio). Script-script ini legal, aman, dan dibuat untuk fitur game — bukan bot/automasi akun.

## 📁 Daftar Script

| File | Keterangan | Tempat Pasang |
|------|-----------|---------------|
| `leaderstats.lua` | Leaderboard + save data pemain (DataStore) | ServerScriptService |
| `shop-system.lua` | Sistem toko dengan validasi server | ServerScriptService |
| `gui-shop.lua` | UI toko untuk pemain (client) | StarterGui (LocalScript) |
| `teleport-system.lua` | Pindah antar tempat (Place) | ServerScriptService |
| `anti-cheat.lua` | Deteksi speed/jump exploit sederhana | ServerScriptService |

## ⚙️ Cara Pakai

1. Buka **Roblox Studio**
2. Buka project game Anda
3. Klik tab **View → Explorer**
4. Sesuaikan lokasi script sesuai tabel di atas:
   - Script **server** → letakkan di `ServerScriptService`
   - Script **client** (`gui-shop.lua`) → letakkan di `StarterGui` (sebagai **LocalScript**)
5. Ganti nilai konfigurasi (Place ID, harga, dll) sesuai kebutuhan

## 🛠️ Konfigurasi yang Perlu Diubah

- `teleport-system.lua` → ganti `Place ID` dengan ID tempat Anda
- `shop-system.lua` → sesuaikan daftar item & harga
- `leaderstats.lua` → aktifkan **Enable Studio Access to API Services** di pengaturan game untuk DataStore

## 📝 Catatan

- Script dibuat dengan **validasi server** untuk mencegah exploit
- Semua fitur mematuhi Roblox Terms of Service
- Untuk mempelajari lebih lanjut: [Roblox Creator Documentation](https://create.roblox.com/docs)
