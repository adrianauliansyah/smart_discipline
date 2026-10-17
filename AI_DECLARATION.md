# AI DECLARATION — SMART DISCIPLINE

## 1. Pendahuluan

Dokumen ini dibuat sebagai bentuk transparansi penggunaan Artificial Intelligence (AI) dalam pengembangan prototype aplikasi Smart Discipline untuk mata kuliah Mobile Programming.

AI digunakan sebagai alat bantu memahami sintaks Flutter, menyusun komponen antarmuka, memperbaiki navigasi, dan memberikan alternatif solusi terhadap kendala pemrograman.

Seluruh kode yang digunakan tetap menjadi tanggung jawab mahasiswa untuk dipahami, diperiksa, dan diuji sebelum digunakan.

## 2. Daftar Alat AI

| Alat AI | Kegunaan |
|---|---|
| ChatGPT (OpenAI) | Membantu penyusunan dan revisi kode Flutter/Dart, penjelasan logika program, navigasi, serta identifikasi kesalahan |

Alat AI lain: [Tuliskan jika benar-benar digunakan. Jika tidak ada, tulis "Tidak ada".]

## 3. Pembagian Modul Antaranggota

### Mahasiswa 1 — Fokus Guru

Nama: [Nama Mahasiswa 1]

NIM: [NIM Mahasiswa 1]

Modul yang dibahas:

- `dashboard_guru.dart`
- `data_siswa_screen.dart`
- `detail_siswa_screen.dart`
- `tambah_pelanggaran_screen.dart`
- `riwayat_pelanggaran_screen.dart`
- `laporan_guru_screen.dart`
- `profil_guru_screen.dart`

**Bantuan AI yang diketahui:**

AI digunakan untuk memberikan saran mengenai struktur antarmuka, navigasi halaman, dan revisi kode pada bagian Dashboard Guru.

**Kontribusi manual Mahasiswa 1:**

[Isi berdasarkan pekerjaan yang benar-benar dilakukan, misalnya penulisan fungsi tertentu, perubahan navigasi, pengujian, atau perbaikan error yang dilakukan sendiri.]

### Mahasiswa 2 — Fokus Siswa dan Orang Tua

Nama: [Nama Mahasiswa 2]

NIM: [NIM Mahasiswa 2]

Modul yang dibahas:

- `dashboard_siswa.dart`
- `riwayat_siswa_screen.dart`
- `profil_siswa_screen.dart`
- `dashboard_orang_tua.dart`
- `login_screen.dart`
- `splash_screen.dart.dart`

**Bantuan AI yang diketahui:**

AI digunakan untuk menyarankan penambahan Logout pada Profil Siswa dan Orang Tua, perubahan navigasi Dashboard Orang Tua, serta penyesuaian tampilan header Smart Discipline.

**Kontribusi manual Mahasiswa 2:**

[Isi pekerjaan manual yang benar-benar dilakukan, termasuk penyesuaian kode, pengujian, atau perbaikan masalah.]

**Catatan:** Pembagian di atas merupakan fokus modul. Klaim tentang siapa yang menulis kode harus sesuai dengan riwayat pengembangan dan Git commit yang sebenarnya.

## 4. Studi Kasus Prompting Pertama — Penambahan Logout dan Navigasi

### Permasalahan

Halaman Profil Siswa dan Orang Tua membutuhkan tombol Logout. Selain itu, navigasi Orang Tua perlu disederhanakan dengan menghilangkan menu Home dan menyediakan tombol panah kembali ke dashboard.

### Prompt yang Diberikan kepada AI

"Di bagian dalam profil tambahkan tombol log out pada siswa dan orang tua. Pada bagian orang tua yang home hilangin dan pada riwayat kasih tombol tanda panah kembali ke halaman utama orang tua dan profil kasih tombol tanda panah kembali ke halaman utama orang tua, bagian profil ada tombol log out."

### Hasil Awal dari AI

AI memberikan kode Flutter menggunakan:

- `showDialog<bool>()` untuk menampilkan konfirmasi Logout.
- `Navigator.pushAndRemoveUntil()` untuk berpindah ke Login dan menghapus riwayat halaman.
- Variabel `selectedIndex` untuk menentukan halaman Orang Tua yang sedang aktif.
- `setState()` untuk memperbarui halaman.
- `IconButton` dengan `Icons.arrow_back_rounded` untuk kembali ke Dashboard.

Salah satu bagian kode yang dihasilkan adalah:

`if (keluar != true || !context.mounted) return;`

`Navigator.of(context).pushAndRemoveUntil(...)`

Kondisi pertama mencegah navigasi ketika pengguna membatalkan Logout atau context sudah tidak aktif.

### Evaluasi Hasil AI

Solusi AI perlu diperiksa karena perubahan pada navigasi dapat menyebabkan pengguna tidak dapat kembali ke halaman utama jika state dan tombol kembali tidak sesuai.

Pengujian yang diperlukan:

- Memastikan Logout menampilkan konfirmasi.
- Memastikan tombol Batal tidak melakukan Logout.
- Memastikan tombol Ya, Keluar menuju Login.
- Memastikan menu Home tidak ditampilkan.
- Memastikan panah Riwayat dan Profil kembali ke Dashboard Orang Tua.

### Penyesuaian dan Pemeriksaan Manual

[Catat pengujian mana yang benar-benar dilakukan dan perubahan kode manual apa yang dilakukan setelah menerima jawaban AI.]

Jangan mengklaim kode ditulis manual apabila kode tersebut sebenarnya disalin dari hasil AI.

## 5. Studi Kasus Prompting Kedua — Penyesuaian Header Smart Discipline

### Permasalahan

Tampilan header Dashboard Guru dan Siswa perlu disesuaikan agar memiliki identitas visual Smart Discipline, seperti logo sekolah, nama aplikasi, dan ikon notifikasi.

### Prompt yang Diberikan kepada AI

"Dan pada bagian guru dan siswa itu kasih pada foto ke empat."

Prompt tersebut diberikan bersama screenshot referensi antarmuka.

### Hasil Awal dari AI

AI memberikan saran penggunaan komponen `AppBar`, `Row`, `Icons.school_rounded`, `Text('Smart Discipline')`, dan `IconButton` untuk notifikasi.

Pada Dashboard Siswa, header dapat ditambahkan melalui `AppBar` yang berada di dalam `Scaffold`.

Pada Dashboard Guru, kode menggunakan komponen `TeacherShell`, sehingga tampilan AppBar tidak sepenuhnya dikendalikan oleh `dashboard_guru.dart`.

### Evaluasi Keterbatasan AI

Saran mengubah judul pada Dashboard Guru saja belum tentu cukup untuk menghasilkan header yang sesuai referensi.

Hal ini disebabkan oleh pemisahan komponen antarmuka. Dashboard Guru menggunakan widget `TeacherShell`, sehingga struktur header perlu diperiksa pada `lib/widgets/teacher_shell.dart`.

Jika AI memberikan parameter widget yang tidak didukung oleh implementasi `TeacherShell`, kode dapat menyebabkan kesalahan kompilasi.

### Penyesuaian dan Pemeriksaan Manual

Langkah yang perlu diverifikasi:

- Memeriksa konstruktor dan isi `TeacherShell`.
- Memastikan parameter yang digunakan benar-benar tersedia.
- Memeriksa tampilan logo, judul, dan notifikasi pada emulator.
- Menjalankan `flutter analyze` untuk mendeteksi kesalahan.

[Isi hasil pengujian dan perbaikan manual yang benar-benar telah dilakukan. Jika belum selesai, tuliskan sebagai pekerjaan lanjutan.]

## 6. Keterbatasan Prototype yang Ditemukan

Berdasarkan pemeriksaan kode, terdapat beberapa bagian yang masih membutuhkan pengembangan:

**A. Login belum menggunakan autentikasi database**

Validasi yang tersedia masih memeriksa kolom kosong dan memilih dashboard berdasarkan peran pengguna.

**B. Penyimpanan pelanggaran belum permanen**

Fungsi Simpan pada formulir Tambah Pelanggaran masih menampilkan pesan lalu kembali ke halaman sebelumnya. Data belum disimpan ke database.

**C. Data Dashboard dan Riwayat Siswa belum konsisten**

Dashboard Siswa menampilkan 3 pelanggaran dan 18 poin, sedangkan halaman Riwayat Siswa menggunakan 5 pelanggaran dengan total 50 poin.

Perbedaan tersebut terjadi karena data contoh masih terpisah.

**D. Perlu pemeriksaan kode lanjutan**

Fungsi Login masih memiliki validasi yang berulang. Bagian tersebut dapat dirapikan agar lebih mudah dipelihara.

Masalah-masalah ini menunjukkan bahwa hasil kode, baik yang ditulis manual maupun yang dibantu AI, tetap perlu melalui proses pemeriksaan.

## 7. Rencana Perbaikan Menuju UAS

- Menambahkan database atau REST API.
- Menyimpan catatan pelanggaran secara permanen.
- Menggunakan satu sumber data untuk Dashboard dan Riwayat.
- Memperbaiki autentikasi dan validasi input.
- Merapikan kode yang berulang.
- Menguji seluruh navigasi dan tampilan aplikasi pada perangkat Android.

## 8. Pernyataan Transparansi

Penggunaan ChatGPT dalam pengembangan Smart Discipline bertujuan membantu proses belajar dan mempercepat penyelesaian kendala teknis.

Kami memahami bahwa jawaban AI tidak selalu benar dan perlu diperiksa berdasarkan kebutuhan aplikasi serta hasil pengujian.

Setiap mahasiswa bertanggung jawab atas pemahaman kode dan kontribusi pengembangan yang dinyatakan dalam dokumen ini.

**Mahasiswa 1**

Nama: [Nama Mahasiswa 1]

NIM: [NIM Mahasiswa 1]

**Mahasiswa 2**

Nama: [Nama Mahasiswa 2]

NIM: [NIM Mahasiswa 2]
