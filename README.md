# 🌀 Blue Tor Helper

**Blue Tor Helper** adalah script bash sederhana untuk membantu kamu dalam mengelola layanan **TOR** di sistem Linux. Dengan tampilan CLI yang interaktif, script ini akan memeriksa apakah TOR sudah terinstal, serta memberikan opsi untuk mengaktifkannya dengan mudah.

---

## 📌 Fitur

- Mengecek apakah layanan TOR sudah diinstal.
- Menginstal TOR jika belum tersedia.
- Mengaktifkan layanan TOR jika belum aktif.
- Tampilan spinner sebagai indikator proses.
- Interface berbasis pertanyaan (prompt interaktif).
- Cek status layanan TOR menggunakan `systemctl`.

---

## 📂 Struktur File

- `BlueTorHelper.sh` — Script utama.
- `README.md` — Penjelasan dan dokumentasi tool ini.

---

## 🔧 Cara Penggunaan

1. **Clone Repository:**

```bash
git clone https://github.com/username/blueTorHelper.git
cd blueTorHelper
sudo chmod +x blueTorHelper.sh
sudo ./blueTorHelper.sh
