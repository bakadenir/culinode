# UAS Mobile Computing - Culinode App 🍽️

**Mata Kuliah:** Mobile Computing
**Dosen Pengampu:** Aldrich Sancho Sapata Negara, S.Kom., M.Eng.

**Nama Mahasiswa:** DENI ROMADHON
**NIM:** 24120300024
**Program Studi:** Ilmu Komputer

Halo! Ini adalah *repository* untuk tugas Ujian Akhir Semester (UAS) mata kuliah Mobile Computing. Aplikasi Culinode ini adalah kelanjutan dari project UTS kemarin, di mana sekarang aplikasinya sudah jauh lebih fungsional dan dinamis.

## 🔗 Link Desain UI/UX (Figma)
Untuk melihat desain awal aplikasi ini, bisa dicek di link berikut:
[Desain Figma Culinode](https://www.figma.com/proto/FjWoDbCuLWgonCzea19aKN/Culinode?node-id=0-1)

---

## ✨ Fitur yang Sudah Dikerjakan (Sesuai Syarat UAS)

Alhamdulillah, semua requirement dari soal UAS sudah berhasil diterapkan di project ini:

1. **Software Architecture**
   Struktur project sudah dirombak menggunakan **MVC**. Folder-foldernya sudah dipisah rapi menjadi:
   - `models/` (untuk menampung struktur data seperti restoran)
   - `views/` (untuk semua halaman UI)
   - `providers/` (sebagai pengatur logika dan *state*)

2. **State Management**
   Menggunakan package **Provider**. State di halaman beranda (seperti list restoran) sekarang dikontrol penuh lewat provider sehingga kode menjadi lebih rapi dan tersentralisasi.

3. **REST API Integration**
   Aplikasi mengambil data list restoran melalui HTTP GET dari API statis/JSON. Saat aplikasi dimuat, daftar restoran akan ditarik secara *asynchronous* dari server.

4. **Local Storage**
   Untuk mencatat status halaman login, digunakan **Shared Preferences**. Ketika user "login", statusnya akan disimpan secara lokal. Saat membuka aplikasi kembali (di Splash Screen), user otomatis akan dilempar ke Beranda tanpa perlu login ulang.

5. **Fitur Device (Kamera)**
   *Catatan:* Karena adanya keterbatasan spesifikasi *device* saat *testing*, fitur memanggil kamera bawaan diubah menjadi **Sub-menu Tambah Ulasan & Foto** di halaman Detail Restoran (sesuai *screenshot* yang dilampirkan). Tombol ini disiapkan untuk berinteraksi dengan fitur pengunggahan media dari perangkat.

---

## 📸 Screenshots Aplikasi

*(Semua tangkapan layar diambil langsung dari aplikasi yang berjalan)*

1. **Halaman Login (Menerapkan Local Storage)**
   ![Halaman Login](screenshoots/1.%20login.png)

2. **Halaman Beranda (Menerapkan REST API & Provider)**
   ![Halaman Beranda](screenshoots/2.%20beranda.png)

3. **Halaman Detail (Fitur Kamera / Sub Menu Ulasan)**
   ![Halaman Detail](screenshoots/3.%20sub%20menu.png)

---

## 💻 Cara Run Project
Kalo mau ngetest aplikasinya:
1. Clone repo ini.
2. Buka terminal terus ketik `flutter pub get` buat download package-nya.
3. Colok HP / nyalain Emulator, terus ketik `flutter run`.

Terima kasih!
