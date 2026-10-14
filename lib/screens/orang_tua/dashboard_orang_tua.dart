
import 'package:flutter/material.dart';

// ======================================================
// DASHBOARD ORANG TUA - SMART DISCIPLINE
// ======================================================

class DashboardOrangTua extends StatefulWidget {
  const DashboardOrangTua({super.key});

  @override
  State<DashboardOrangTua> createState() =>
      _DashboardOrangTuaState();
}

class _DashboardOrangTuaState
    extends State<DashboardOrangTua> {
  // ====================================================
  // WARNA APLIKASI
  // ====================================================
  static const Color primaryBlue = Color(0xFF3563B8);
  static const Color primaryDark = Color(0xFF254A96);
  static const Color background = Color(0xFFF6F8FC);
  static const Color textColor = Color(0xFF172033);
  static const Color greyText = Color(0xFF8290AE);
  static const Color green = Color(0xFF63A85A);
  static const Color orange = Color(0xFFF0A13B);
  static const Color red = Color(0xFFE65B56);

  int selectedIndex = 0;
  String pencarian = '';
  String filter = 'Semua';

  // ====================================================
  // DATA PELANGGARAN CONTOH
  // ====================================================
  static const List<_PelanggaranAnak> pelanggaran = [
    _PelanggaranAnak(
      judul: 'Terlambat masuk kelas',
      tanggal: '15 Januari 2026 • 08:15',
      kategori: 'Ringan',
      poin: 5,
      keterangan:
          'Siswa datang terlambat setelah pelajaran dimulai.',
      petugas: 'Guru Piket',
    ),
    _PelanggaranAnak(
      judul: 'Seragam tidak lengkap',
      tanggal: '10 Januari 2026 • 07:30',
      kategori: 'Sedang',
      poin: 3,
      keterangan:
          'Siswa tidak mengenakan atribut seragam lengkap.',
      petugas: 'Wali Kelas',
    ),
    _PelanggaranAnak(
      judul: 'Tidak membawa perlengkapan belajar',
      tanggal: '7 Januari 2026 • 07:45',
      kategori: 'Sedang',
      poin: 10,
      keterangan:
          'Siswa tidak membawa perlengkapan belajar.',
      petugas: 'Guru Mata Pelajaran',
    ),
  ];

  // ====================================================
  // FUNGSI MEMINDAHKAN TAB
  // ====================================================
  void bukaHalaman(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // ====================================================
  // TOTAL POIN
  // ====================================================
  int get totalPoin {
    return pelanggaran.fold(
      0,
      (jumlah, item) => jumlah + item.poin,
    );
  }

  // ====================================================
  // FILTER RIWAYAT
  // ====================================================
  List<_PelanggaranAnak> get riwayatTampil {
    return pelanggaran.where((item) {
      final kata = pencarian.toLowerCase();

      final cocokCari =
          item.judul.toLowerCase().contains(kata) ||
          item.tanggal.toLowerCase().contains(kata);

      final cocokKategori =
          filter == 'Semua' || filter == item.kategori;

      return cocokCari && cocokKategori;
    }).toList();
  }

  // ====================================================
  // PESAN NOTIFIKASI
  // ====================================================
  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ====================================================
  // WARNA KATEGORI
  // ====================================================
  Color warnaKategori(String kategori) {
    switch (kategori) {
      case 'Ringan':
        return green;
      case 'Sedang':
        return orange;
      case 'Berat':
        return red;
      default:
        return primaryBlue;
    }
  }

  // ====================================================
  // DETAIL PELANGGARAN
  // ====================================================
  void lihatDetail(_PelanggaranAnak item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              24, 12, 24, 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail Pelanggaran Anak',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 22),

                _InfoBaris(
                  label: 'Jenis Pelanggaran',
                  value: item.judul,
                ),

                _InfoBaris(
                  label: 'Tanggal',
                  value: item.tanggal,
                ),

                _InfoBaris(
                  label: 'Kategori',
                  value: item.kategori,
                ),

                _InfoBaris(
                  label: 'Poin Pelanggaran',
                  value: '${item.poin} Poin',
                ),

                _InfoBaris(
                  label: 'Dicatat Oleh',
                  value: item.petugas,
                ),

                const SizedBox(height: 10),

                const Text(
                  'Keterangan',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  item.keterangan,
                  style: const TextStyle(
                    color: greyText,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Tutup'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ====================================================
  // BUILD UTAMA
  // ====================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.school_rounded,
              color: primaryBlue,
              size: 27,
            ),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                'Smart Discipline',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              tampilkanPesan(
                'Notifikasi belum tersedia.',
              );
            },
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: primaryBlue,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ==================================================
      // KONTEN HALAMAN AKTIF
      // ==================================================
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final desktop = constraints.maxWidth >= 800;

            return SingleChildScrollView(
              padding: EdgeInsets.all(
                desktop ? 28 : 18,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: selectedIndex == 0
                      ? buildBeranda()
                      : selectedIndex == 1
                          ? buildRiwayat()
                          : buildProfil(),
                ),
              ),
            );
          },
        ),
      ),

      // ==================================================
      // BOTTOM NAVIGATION
      // ==================================================
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFFF0ECF5),
        indicatorColor: const Color(0xFFE0E3FA),
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          bukaHalaman(index);
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            label: 'Riwayat',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  // ====================================================
  // HALAMAN HOME / BERANDA
  // ====================================================
  Widget buildBeranda() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dashboard Orang Tua',
          style: TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Pantau perkembangan kedisiplinan anak '
          'dengan mudah dan terstruktur.',
          style: TextStyle(
            color: greyText,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 22),

        // ============================================
        // KARTU INFORMASI ANAK
        // ============================================
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                primaryBlue,
                primaryDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: primaryBlue.withValues(
                  alpha: 0.18,
                ),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Anak',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 16),

              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Text(
                      'AR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmad Rizky Pratama',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'XII Multimedia 1',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              OutlinedButton.icon(
                onPressed: () {
                  bukaHalaman(2);
                },
                icon: const Icon(
                  Icons.person_outline_rounded,
                ),
                label: const Text('Lihat Profil Anak'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 27),

        // ============================================
        // STATISTIK KEDISIPLINAN
        // ============================================
        const Text(
          'Ringkasan Kedisiplinan Anak',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 15),

        LayoutBuilder(
          builder: (context, ukuran) {
            final lebar = ukuran.maxWidth;

            final lebarKartu = lebar >= 750
                ? (lebar - 32) / 3
                : lebar >= 480
                    ? (lebar - 16) / 2
                    : lebar;

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: lebarKartu,
                  child: const _StatCard(
                    judul: 'Skor Kedisiplinan',
                    nilai: '85',
                    icon: Icons.star_rounded,
                    warna: green,
                  ),
                ),
                SizedBox(
                  width: lebarKartu,
                  child: _StatCard(
                    judul: 'Jumlah Pelanggaran',
                    nilai: '${pelanggaran.length}',
                    icon: Icons.warning_rounded,
                    warna: red,
                  ),
                ),
                SizedBox(
                  width: lebarKartu,
                  child: _StatCard(
                    judul: 'Total Poin',
                    nilai: '$totalPoin',
                    icon: Icons.remove_circle_rounded,
                    warna: orange,
                  ),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 27),

        // ============================================
        // STATUS KEDISIPLINAN
        // ============================================
        const Text(
          'Status Kedisiplinan',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(
              color: const Color(0xFFE5EAF3),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Skor kedisiplinan anak',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    '85%',
                    style: TextStyle(
                      color: green,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  value: 0.85,
                  minHeight: 13,
                  color: green,
                  backgroundColor: Color(0xFFE8F3E8),
                ),
              ),

              const SizedBox(height: 13),

              const Row(
                children: [
                  Icon(
                    Icons.verified_rounded,
                    color: green,
                    size: 19,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Status kedisiplinan anak baik. '
                      'Terus berikan dukungan.',
                      style: TextStyle(
                        color: greyText,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 27),

        // ============================================
        // RIWAYAT TERBARU
        // ============================================
        Row(
          children: [
            const Expanded(
              child: Text(
                'Pelanggaran Terbaru',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                bukaHalaman(1);
              },
              child: const Text('Lihat Semua'),
            ),
          ],
        ),

        const SizedBox(height: 12),

        ...pelanggaran.take(2).map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: buildKartuPelanggaran(item),
          ),
        ),

        const SizedBox(height: 17),

        // ============================================
        // INFORMASI UNTUK ORANG TUA
        // ============================================
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(18),
          ),

          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                color: primaryBlue,
                size: 25,
              ),

              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dukungan Orang Tua',
                      style: TextStyle(
                        color: primaryDark,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(height: 7),

                    Text(
                      'Dukung anak untuk selalu hadir '
                      'tepat waktu, mematuhi peraturan '
                      'sekolah, dan bertanggung jawab '
                      'terhadap kegiatan belajar.',
                      style: TextStyle(
                        color: primaryDark,
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        const Center(
          child: Text(
            'Data masih berupa contoh prototype '
            'dan belum terhubung ke database.',
            style: TextStyle(
              color: greyText,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // ====================================================
  // HALAMAN RIWAYAT ANAK
  // ====================================================
  Widget buildRiwayat() {
    final daftar = riwayatTampil;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Riwayat Pelanggaran Anak',
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          'Lihat seluruh catatan kedisiplinan anak.',
          style: TextStyle(
            color: greyText,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 23),

        // ============================================
        // KOLOM PENCARIAN
        // ============================================
        TextField(
          onChanged: (value) {
            setState(() {
              pencarian = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Cari pelanggaran anak...',
            prefixIcon: const Icon(
              Icons.search_rounded,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ============================================
        // FILTER KATEGORI
        // ============================================
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              'Semua',
              'Ringan',
              'Sedang',
              'Berat',
            ].map((item) {
              final dipilih = filter == item;

              return Padding(
                padding: const EdgeInsets.only(right: 9),
                child: ChoiceChip(
                  label: Text(item),
                  selected: dipilih,
                  selectedColor: primaryBlue,
                  backgroundColor: Colors.white,
                  side: BorderSide.none,
                  labelStyle: TextStyle(
                    color: dipilih
                        ? Colors.white
                        : textColor,
                    fontWeight: FontWeight.w700,
                  ),
                  onSelected: (_) {
                    setState(() {
                      filter = item;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Ditemukan ${daftar.length} pelanggaran',
          style: const TextStyle(
            color: greyText,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 13),

        // ============================================
        // HASIL PENCARIAN DAN FILTER
        // ============================================
        if (daftar.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 50,
                  color: greyText,
                ),
                SizedBox(height: 12),
                Text(
                  'Data tidak ditemukan',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Coba kata kunci atau kategori lain.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: greyText),
                ),
              ],
            ),
          )
        else
          ...daftar.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: buildKartuPelanggaran(item),
            ),
          ),
      ],
    );
  }

  // ====================================================
  // HALAMAN PROFIL ORANG TUA DAN ANAK
  // ====================================================
  Widget buildProfil() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profil Orang Tua',
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 20),

        // ============================================
        // KARTU PROFIL ORANG TUA
        // ============================================
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [primaryBlue, primaryDark],
            ),
            borderRadius: BorderRadius.circular(23),
          ),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white24,
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),

              SizedBox(height: 14),

              Text(
                'Siti Rahmawati',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                ),
              ),

              SizedBox(height: 6),

              Text(
                'Orang Tua / Wali Siswa',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          'Informasi Orang Tua',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 13),

        const _InfoCard(
          icon: Icons.person_outline_rounded,
          judul: 'Nama Orang Tua',
          isi: 'Siti Rahmawati',
        ),

        const _InfoCard(
          icon: Icons.family_restroom_rounded,
          judul: 'Hubungan dengan Siswa',
          isi: 'Ibu',
        ),

        const _InfoCard(
          icon: Icons.phone_outlined,
          judul: 'Nomor Telepon',
          isi: 'Belum tersedia',
        ),

        const SizedBox(height: 25),

        // ============================================
        // IDENTITAS ANAK
        // ============================================
        const Text(
          'Informasi Anak',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 13),

        const _InfoCard(
          icon: Icons.badge_outlined,
          judul: 'Nama Siswa',
          isi: 'Ahmad Rizky Pratama',
        ),

        const _InfoCard(
          icon: Icons.numbers_rounded,
          judul: 'NIS',
          isi: 'Belum tersedia',
        ),

        const _InfoCard(
          icon: Icons.school_outlined,
          judul: 'Kelas',
          isi: 'XII Multimedia 1',
        ),

        const _InfoCard(
          icon: Icons.verified_outlined,
          judul: 'Status Kedisiplinan',
          isi: 'Baik',
        ),

        const SizedBox(height: 18),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(15),
          ),

          child: const Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: primaryBlue,
              ),

              SizedBox(width: 12),

              Expanded(
                child: Text(
                  'Informasi profil masih menggunakan '
                  'data contoh. Data asli akan tersedia '
                  'setelah database dihubungkan.',
                  style: TextStyle(
                    color: primaryDark,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ====================================================
  // KARTU PELANGGARAN YANG BISA DIKLIK
  // ====================================================
  Widget buildKartuPelanggaran(_PelanggaranAnak item) {
    final warna = warnaKategori(item.kategori);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          lihatDetail(item);
        },

        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: warna.withValues(alpha: 0.12),
                  borderRadius:
                      BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.report_outlined,
                  color: warna,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.judul,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      item.tanggal,
                      style: const TextStyle(
                        color: greyText,
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      item.kategori,
                      style: TextStyle(
                        color: warna,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                '-${item.poin}',
                style: const TextStyle(
                  color: red,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(width: 5),

              const Icon(
                Icons.chevron_right_rounded,
                color: greyText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// MODEL DATA PELANGGARAN
// ======================================================
class _PelanggaranAnak {
  final String judul;
  final String tanggal;
  final String kategori;
  final int poin;
  final String keterangan;
  final String petugas;

  const _PelanggaranAnak({
    required this.judul,
    required this.tanggal,
    required this.kategori,
    required this.poin,
    required this.keterangan,
    required this.petugas,
  });
}

// ======================================================
// KARTU STATISTIK
// ======================================================
class _StatCard extends StatelessWidget {
  final String judul;
  final String nilai;
  final IconData icon;
  final Color warna;

  const _StatCard({
    required this.judul,
    required this.nilai,
    required this.icon,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE5EAF3),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: warna.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: warna),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  nilai,
                  style: const TextStyle(
                    color: Color(0xFF172033),
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  judul,
                  style: const TextStyle(
                    color: Color(0xFF8290AE),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// KARTU INFORMASI PROFIL
// ======================================================
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String judul;
  final String isi;

  const _InfoCard({
    required this.icon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5EAF3),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF3563B8),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    color: Color(0xFF8290AE),
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  isi,
                  style: const TextStyle(
                    color: Color(0xFF172033),
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// BARIS DETAIL PELANGGARAN
// ======================================================
class _InfoBaris extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBaris({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF8290AE),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF172033),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
