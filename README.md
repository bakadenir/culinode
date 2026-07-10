# UAS Mobile Computing - Culinode App 🍽️

**Nama:** Deni
**Project:** Aplikasi Culinode

Halo! Ini adalah *repository* untuk tugas Ujian Akhir Semester (UAS) mata kuliah Mobile Computing. Aplikasi Culinode ini adalah kelanjutan dari project UTS kemarin, di mana sekarang aplikasinya sudah jauh lebih fungsional dan dinamis.

## 🔗 Link Desain UI/UX (Figma)
Untuk melihat desain awal aplikasi ini, bisa dicek di link berikut:
[Desain Figma Culinode](https://www.figma.com/proto/FjWoDbCuLWgonCzea19aKN/Culinode?node-id=0-1)

---

## ✨ Fitur yang Sudah Dikerjakan (Sesuai Syarat UAS)

Alhamdulillah, semua requirement dari soal UAS sudah berhasil saya terapkan di project ini:

1. **Software Architecture**
   Saya merombak strukturnya menggunakan **MVC**. Folder-foldernya sudah saya pisah rapi jadi:
   - `models/` (untuk nampung class objek seperti data restoran)
   - `views/` (semua halaman/UI)
   - `providers/` (tempat naruh logika bisnisnya)

2. **State Management**
   Saya pakai package **Provider**. Jadi state di halaman beranda (seperti list restoran) sekarang udah dikontrol penuh lewat provider, bukan lagi di-_hardcode_ pake `setState` yang berantakan.

3. **REST API Integration**
   Aplikasi ini ngambil data list restoran lewat API. Pas aplikasi dibuka, dia otomatis nge-GET data JSON dari server.

4. **Local Storage**
   Untuk halaman login, saya pakai **Shared Preferences**. Kalo user udah pernah "login", statusnya bakal kesimpen. Jadi pas buka aplikasi lagi (di Splash Screen), dia bakal langsung lompat ke Beranda, nggak perlu login ulang.

5. **Fitur Device (Kamera)**
   Saya tambahin integrasi **Kamera** pakai package `image_picker`. Kalau buka halaman Detail Restoran, di bawah ada tombol "TAMBAH FOTO DARI KAMERA". Kalo dipencet, dia bakal ngebuka kamera HP buat ambil foto ulasan, terus fotonya bakal muncul di atas tombolnya.

---

## 📸 Screenshots Aplikasi

*(Screenshot halaman ada di folder `screenshots/`)*

1. **Halaman Login (Menerapkan Local Storage)**
   ![Halaman Login](screenshots/login.png)

2. **Halaman Beranda (Menerapkan REST API & Provider)**
   ![Halaman Beranda](screenshots/beranda.png)

3. **Halaman Detail (Fitur Kamera Aktif)**
   ![Halaman Detail](screenshots/kamera.png)

---

## 💻 Cara Run Project
Kalo mau ngetest aplikasinya:
1. Clone repo ini.
2. Buka terminal terus ketik `flutter pub get` buat download package-nya.
3. Colok HP / nyalain Emulator, terus ketik `flutter run`.

Terima kasih!
