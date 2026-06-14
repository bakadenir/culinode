# 🍽️ Culinode

> **Temukan makanan enak di sekitarmu — kapan saja, di mana saja.**

Culinode adalah aplikasi mobile rekomendasi tempat makan berbasis lokasi yang lahir dari keresahan sehari-hari: *selesai nongkrong di satu tempat, mau pindah makan tapi bingung cari opsi di sekitar sini di mana?* Atau lagi di kafe, makanan beratnya kurang cocok — butuh tempat lain yang deket.

Dari situlah Culinode hadir: bantu kamu temukan tempat makan terbaik dalam radius **2 km** dari lokasi kamu saat ini, lengkap dengan ulasan jujur dari pengguna lain.

---

## 📱 Screenshots

> *Coming soon — aplikasi masih dalam tahap pengembangan aktif.*

---

## ✨ Fitur

### 🏠 Beranda
- Rekomendasi restoran terdekat dalam radius **≤ 2 km** dari lokasi kamu
- Tampilan grid card dengan foto, nama, kategori, rating bintang, dan jarak
- **Pagination progresif**: awal tampil 8 restoran, tiap "Muat Lebih Banyak" menambah 6 item
- Pesan informatif ketika semua restoran dalam radius 2 km sudah ditampilkan
- Filter kategori makanan (Semua, Nasi & Lauk, Mie & Bakso, dll.)
- Tombol favorit (❤️) langsung dari card

### 🔍 Detail Restoran
- Hero image restoran dengan overlay gradient
- Info lengkap: nama, kategori, rating, jarak, dan alamat
- Tombol **Buka Rute di Maps** *(coming soon — integrasi Google Maps)*
- Tombol **Tambah Ulasan & Foto**
- Daftar ulasan pengunjung dengan avatar, rating bintang, teks, dan foto
- **Galeri foto ulasan**: tap thumbnail → fullscreen viewer dengan:
  - Swipe kiri/kanan antar foto
  - Pinch-to-zoom
  - Indikator halaman (dots)
  - Tombol tutup

### ❤️ Favorit
- Daftar semua restoran yang pernah kamu simpan
- Tampilan card konsisten dengan beranda
- Pagination (load more)

### 📝 Riwayat Ulasan
- Histori semua ulasan yang pernah kamu tulis
- Tampilan lengkap: foto restoran, nama, kategori, rating, dan cuplikan ulasan

### 🔔 Notifikasi
- Dikelompokkan berdasarkan waktu: **Hari Ini**, **Minggu Lalu**, **Bulan Lalu**
- Tipe notifikasi:
  - 📸 Ulasan berhasil tayang
  - ❤️ Restoran berhasil disimpan ke favorit
  - 📍 Rekomendasi restoran baru di sekitar kamu

### 👤 Profil
- Foto profil, nama, dan email pengguna
- Edit profil: ganti nama, email, dan foto profil (dari galeri atau kamera)
- Avatar global — konsisten tampil di Beranda, Profil, dan Edit Profil

### 🔐 Autentikasi
- **Masuk** (Login): email & password, tombol "Lupa Password?"
- **Daftar** (Register): nama, email, password
- Login via Google & Facebook *(placeholder, belum terintegrasi)*
- **Onboarding**: 3 halaman intro sebelum masuk aplikasi
- **Splash Screen**

---

## 🚧 Fitur yang Belum Selesai

| Fitur | Status |
|---|---|
| Upload foto ulasan (kamera/galeri) | 🔧 Dummy |
| Google Maps — rute ke restoran | 🔧 Belum terintegrasi |
| GPS real-time — lokasi pengguna | 🔧 Belum terintegrasi |
| Backend & database (Supabase) | 🔧 Belum terintegrasi |
| Login Google & Facebook | 🔧 Placeholder |
| Pencarian restoran (search bar) | 🔧 Belum ada |
| Filter & sorting | 🔧 Belum fungsional |
| Reset password | 🔧 Belum ada |
| Rating & submit ulasan | 🔧 Belum ada |

---

## 🛠️ Tech Stack

| Layer | Teknologi |
|---|---|
| Framework | [Flutter](https://flutter.dev) |
| Bahasa | Dart |
| State Management | `setState` (lokal) |
| Design System | Custom — `AppColors`, `AppTextStyles`, `AppShadows` |
| Font | Roboto (Google Fonts) |
| Backend *(rencana)* | Supabase |
| Maps *(rencana)* | Google Maps API |

---

## 🗂️ Struktur Folder

```
lib/
├── core/
│   ├── theme/
│   │   ├── colors.dart         # Design tokens warna
│   │   ├── typography.dart     # Text styles
│   │   └── shadows.dart        # Box shadow presets
│   ├── user_profile.dart       # Singleton state user global
│   └── widgets/
│       ├── app_bottom_nav_bar.dart
│       ├── form_field.dart
│       ├── notif_card.dart
│       ├── primary_button.dart
│       └── social_login_row.dart
├── beranda_screen.dart
├── favorit_screen.dart
├── notifikasi_screen.dart
├── profil_screen.dart
├── edit_profil_screen.dart
├── restoran_detail_screen.dart
├── riwayat_ulasan_screen.dart
├── masuk_screen.dart
├── daftar_screen.dart
├── onboarding_screen.dart
├── splash_screen.dart
├── main_screen.dart
└── main.dart
```

---

## 🚀 Cara Menjalankan

```bash
# Clone repo
git clone https://github.com/bakadenir/culinode.git
cd culinode

# Install dependencies
flutter pub get

# Jalankan di emulator/device
flutter run
```

> **Requirement**: Flutter SDK ≥ 3.x, Dart ≥ 3.x

---

## 💡 Latar Belakang

> *"Biasanya abis nongkrong di suatu tempat pasti akan geser atau pindah. Atau lagi di kafe mau ngopi, tapi untuk makan berat cari opsi lain — karena makanannya ga ada atau kurang enak. Maka dari itu Culinode terlahir."*

Aplikasi ini dibangun untuk menjawab satu pertanyaan sederhana yang sering muncul:

**"Mau makan apa, dan di mana yang deket sini?"**

---

## 👨‍💻 Developer

**Deni Romadhon** — [@bakadenir](https://github.com/bakadenir)

---

## 📄 Lisensi

Proyek ini bersifat privat dan dibuat untuk keperluan personal/portfolio.
