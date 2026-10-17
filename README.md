# Smart Discipline

**Aplikasi Mobile Monitoring Pelanggaran dan Kedisiplinan Siswa Berbasis Android**

## Deskripsi Aplikasi

Smart Discipline merupakan prototype aplikasi mobile berbasis Flutter yang dirancang untuk membantu sekolah memantau kedisiplinan siswa secara lebih praktis dan terstruktur.

Aplikasi ini menyediakan beberapa tampilan pengguna, yaitu Guru, Siswa, dan Orang Tua. Melalui aplikasi ini, guru dapat melihat data siswa dan catatan pelanggaran, siswa dapat memantau riwayat kedisiplinannya, sedangkan orang tua dapat melihat perkembangan kedisiplinan anak.

Project dikembangkan sebagai bagian dari tugas Ujian Tengah Semester (UTS) mata kuliah Mobile Programming.

## Teknologi yang Digunakan

- Flutter sebagai framework pengembangan aplikasi
- Dart sebagai bahasa pemrograman
- Material Design untuk komponen antarmuka
- Visual Studio Code sebagai editor kode
- Android Studio dan Android Emulator untuk pengujian
- Git dan GitHub untuk pengelolaan versi serta kolaborasi

## Fitur Aplikasi

### 1. Login

- Input email atau username dan password
- Pemilihan peran Guru, Siswa, dan Orang Tua
- Validasi kolom yang tidak boleh kosong
- Navigasi menuju dashboard sesuai peran

Pada tahap prototype, autentikasi pengguna belum terhubung ke database.

### 2. Dashboard Guru

- Ringkasan statistik kedisiplinan
- Melihat daftar data siswa
- Pencarian siswa berdasarkan nama, NIS, atau kelas
- Melihat detail identitas dan pelanggaran siswa
- Formulir penambahan pelanggaran
- Riwayat pelanggaran beserta pencarian dan filter kategori
- Tampilan laporan kedisiplinan
- Profil Guru dan Logout

### 3. Dashboard Siswa

- Informasi identitas siswa
- Skor kedisiplinan
- Jumlah pelanggaran dan total poin
- Riwayat pelanggaran
- Pencarian dan filter pelanggaran
- Detail catatan pelanggaran
- Profil Siswa dan Logout

### 4. Dashboard Orang Tua

- Informasi identitas anak
- Ringkasan skor kedisiplinan
- Jumlah pelanggaran dan total poin
- Riwayat pelanggaran anak
- Pencarian dan filter kategori
- Detail pelanggaran anak
- Profil Orang Tua
- Logout dengan konfirmasi

## Screenshot Aplikasi

### Halaman Login

![Halaman Login](docs/screenshots/login.png)

### Dashboard Guru

![Dashboard Guru](docs/screenshots/dashboard_guru.png)

### Dashboard Siswa

![Dashboard Siswa](docs/screenshots/dashboard_siswa.png)

### Dashboard Orang Tua

![Dashboard Orang Tua](docs/screenshots/dashboard_orang_tua.png)

**Catatan:** Semua gambar harus disimpan pada folder `docs/screenshots/` dengan nama yang sesuai agar dapat ditampilkan di GitHub.

## Struktur Folder

- `lib/screens/` — halaman aplikasi seperti Login dan Dashboard Guru
- `lib/screens/siswa/` — halaman khusus pengguna Siswa
- `lib/screens/orang_tua/` — halaman khusus pengguna Orang Tua
- `lib/models/` — model data
- `lib/data/` — data contoh untuk prototype
- `lib/widgets/` — komponen UI yang dapat digunakan kembali
- `lib/theme/` — pengaturan warna dan tema aplikasi

## Cara Menjalankan Project

### Persyaratan

Pastikan Flutter SDK, Android Studio, Android SDK, dan emulator Android telah tersedia.

### Langkah Menjalankan

**1. Clone repository**

`git clone https://github.com/adrianauliansyah/smart_discipline.git`

**2. Masuk ke direktori project**

`cd smart_discipline`

**3. Instal dependensi Flutter**

`flutter pub get`

**4. Periksa perangkat Android**

`flutter devices`

**5. Jalankan aplikasi**

`flutter run`

Jika terdapat beberapa perangkat, gunakan:

`flutter run -d <ID_PERANGKAT_ANDROID>`

ID perangkat mengikuti hasil `flutter devices`.

**6. Periksa kode**

`flutter analyze`

## Status Pengembangan

Aplikasi saat ini berada pada tahap prototype.

Fitur tampilan, navigasi, pencarian, dan filter sudah dibuat, tetapi sebagian data masih menggunakan mock data atau data contoh.

Formulir penambahan pelanggaran belum menyimpan data secara permanen. Sistem autentikasi, database, serta sinkronisasi informasi antarhalaman masih perlu dikembangkan.

Menu Admin juga belum tersedia sebagai dashboard fungsional.

## Rencana Pengembangan Menuju UAS

- Integrasi database atau REST API
- Penyimpanan dan pembaruan data pelanggaran
- Autentikasi pengguna yang lebih aman
- Sinkronisasi data Guru, Siswa, dan Orang Tua
- Penyempurnaan validasi formulir
- Pengujian kestabilan dan navigasi aplikasi

## Tim Pengembang

**Mahasiswa 1**

Nama: [Nama Mahasiswa 1]

NIM: [NIM Mahasiswa 1]

Fokus modul: Dashboard Guru dan pengelolaan data siswa.

**Mahasiswa 2**

Nama: [Nama Mahasiswa 2]

NIM: [NIM Mahasiswa 2]

Fokus modul: Dashboard Siswa dan Dashboard Orang Tua.

Pembagian di atas merupakan fokus modul presentasi. Kontribusi kode masing-masing dicantumkan sesuai pekerjaan sebenarnya pada `AI_DECLARATION.md`.

## Transparansi Penggunaan AI

Selama pengembangan, AI digunakan sebagai alat bantu pemrograman.

Penjelasan mengenai alat yang digunakan, kontribusi AI, dan evaluasi kode tersedia pada berkas `AI_DECLARATION.md`.
