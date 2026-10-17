import 'package:flutter/material.dart';
import '../login_screen.dart';

class DashboardOrangTua extends StatefulWidget {
  const DashboardOrangTua({super.key});

  @override
  State<DashboardOrangTua> createState() =>
      _DashboardOrangTuaState();
}

class _DashboardOrangTuaState extends State<DashboardOrangTua> {
  static const primaryBlue = Color(0xFF3563B8);
  static const primaryDark = Color(0xFF254A96);
  static const background = Color(0xFFF6F8FC);
  static const textColor = Color(0xFF172033);
  static const greyText = Color(0xFF8290AE);
  static const green = Color(0xFF63A85A);
  static const orange = Color(0xFFF0A13B);
  static const red = Color(0xFFE65B56);

  // 0 = Dashboard, 1 = Riwayat, 2 = Profil
  int selectedIndex = 0;
  String pencarian = '';
  String filter = 'Semua';

  final List<_PelanggaranAnak> pelanggaran = const [
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

  void bukaHalaman(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int get totalPoin => pelanggaran.fold(
        0,
        (jumlah, item) => jumlah + item.poin,
      );

  List<_PelanggaranAnak> get riwayatTampil {
    final kata = pencarian.toLowerCase();

    return pelanggaran.where((item) {
      final cocokCari =
          item.judul.toLowerCase().contains(kata) ||
          item.tanggal.toLowerCase().contains(kata);

      final cocokKategori =
          filter == 'Semua' || filter == item.kategori;

      return cocokCari && cocokKategori;
    }).toList();
  }

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

  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan)),
    );
  }

  // LOGOUT ORANG TUA
  Future<void> logout() async {
    final keluar = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari Smart Discipline?',
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, true),
            child: const Text('Ya, Keluar'),
          ),
        ],
      ),
    );

    if (!mounted || keluar != true) return;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  void lihatDetail(_PelanggaranAnak item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (context) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
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
              const SizedBox(height: 20),
              _detailBaris('Jenis Pelanggaran', item.judul),
              _detailBaris('Tanggal', item.tanggal),
              _detailBaris('Kategori', item.kategori),
              _detailBaris(
                'Poin Pelanggaran',
                '${item.poin} Poin',
              ),
              _detailBaris('Dicatat Oleh', item.petugas),
              _detailBaris('Keterangan', item.keterangan),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailBaris(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: greyText),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,

        // PANAH KEMBALI DI RIWAYAT DAN PROFIL
        leading: selectedIndex == 0
            ? null
            : IconButton(
                tooltip: 'Kembali ke Dashboard Orang Tua',
                icon: const Icon(Icons.arrow_back_rounded),
                color: primaryBlue,
                onPressed: () => bukaHalaman(0),
              ),

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
            tooltip: 'Notifikasi',
            onPressed: () {
              tampilkanPesan('Notifikasi belum tersedia.');
            },
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: primaryBlue,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final desktop = constraints.maxWidth >= 800;

            return SingleChildScrollView(
              padding: EdgeInsets.all(desktop ? 28 : 18),
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

      // MENU HOME DIHAPUS
      // HANYA RIWAYAT DAN PROFIL
      // MENU INI MUNCUL PADA DASHBOARD UTAMA
      bottomNavigationBar: selectedIndex == 0
          ? NavigationBar(
              backgroundColor: const Color(0xFFF0ECF5),
              indicatorColor: const Color(0xFFE0E3FA),
              onDestinationSelected: (index) {
                bukaHalaman(index + 1);
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.history_rounded),
                  label: 'Riwayat',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_rounded),
                  label: 'Profil',
                ),
              ],
            )
          : null,
    );
  }

  // DASHBOARD UTAMA ORANG TUA
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
          style: TextStyle(color: greyText),
        ),
        const SizedBox(height: 22),

        // KARTU INFORMASI ANAK
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [primaryBlue, primaryDark],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Anak',
                style: TextStyle(color: Colors.white70),
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
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              OutlinedButton.icon(
                onPressed: () => bukaHalaman(2),
                icon: const Icon(Icons.person_outline_rounded),
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
        _judul('Ringkasan Kedisiplinan Anak'),
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
                  child: _statistik(
                    'Skor Kedisiplinan',
                    '85',
                    Icons.star_rounded,
                    green,
                  ),
                ),
                SizedBox(
                  width: lebarKartu,
                  child: _statistik(
                    'Jumlah Pelanggaran',
                    '${pelanggaran.length}',
                    Icons.warning_rounded,
                    red,
                  ),
                ),
                SizedBox(
                  width: lebarKartu,
                  child: _statistik(
                    'Total Poin',
                    '$totalPoin',
                    Icons.remove_circle_rounded,
                    orange,
                  ),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 27),
        _judul('Status Kedisiplinan'),
        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: _boxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Skor kedisiplinan anak',
                      style: TextStyle(
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
              const LinearProgressIndicator(
                value: 0.85,
                minHeight: 13,
                color: green,
                backgroundColor: Color(0xFFE8F3E8),
              ),
              const SizedBox(height: 13),
              const Text(
                '✅ Status kedisiplinan anak baik. '
                'Terus berikan dukungan.',
                style: TextStyle(color: greyText),
              ),
            ],
          ),
        ),

        const SizedBox(height: 27),

        Row(
          children: [
            Expanded(
              child: _judul('Pelanggaran Terbaru'),
            ),
            TextButton(
              onPressed: () => bukaHalaman(1),
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

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                color: primaryBlue,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Dukungan Orang Tua\n'
                  'Dukung anak untuk hadir tepat waktu, '
                  'mematuhi peraturan sekolah, dan '
                  'bertanggung jawab terhadap kegiatan belajar.',
                  style: TextStyle(
                    color: primaryDark,
                    height: 1.5,
                  ),
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
            textAlign: TextAlign.center,
            style: TextStyle(
              color: greyText,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  // HALAMAN RIWAYAT ORANG TUA
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
          style: TextStyle(color: greyText),
        ),
        const SizedBox(height: 23),

        TextField(
          onChanged: (value) {
            setState(() => pencarian = value);
          },
          decoration: InputDecoration(
            hintText: 'Cari pelanggaran anak...',
            prefixIcon: const Icon(Icons.search_rounded),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 16),

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
                  ),
                  onSelected: (_) {
                    setState(() => filter = item);
                  },
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Ditemukan ${daftar.length} pelanggaran',
          style: const TextStyle(color: greyText),
        ),

        const SizedBox(height: 13),

        if (daftar.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(35),
            decoration: _boxDecoration(),
            child: const Column(
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 50,
                  color: greyText,
                ),
                SizedBox(height: 12),
                Text('Data tidak ditemukan'),
                SizedBox(height: 6),
                Text(
                  'Coba kata kunci atau kategori lain.',
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

        const SizedBox(height: 20),
      ],
    );
  }

  // HALAMAN PROFIL ORANG TUA
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
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),
        _judul('Informasi Orang Tua'),
        const SizedBox(height: 13),

        _infoProfil(
          Icons.person_outline_rounded,
          'Nama Orang Tua',
          'Siti Rahmawati',
        ),
        _infoProfil(
          Icons.family_restroom_rounded,
          'Hubungan dengan Siswa',
          'Ibu',
        ),
        _infoProfil(
          Icons.phone_outlined,
          'Nomor Telepon',
          'Belum tersedia',
        ),

        const SizedBox(height: 20),
        _judul('Informasi Anak'),
        const SizedBox(height: 13),

        _infoProfil(
          Icons.badge_outlined,
          'Nama Siswa',
          'Ahmad Rizky Pratama',
        ),
        _infoProfil(
          Icons.numbers_rounded,
          'NIS',
          'Belum tersedia',
        ),
        _infoProfil(
          Icons.school_outlined,
          'Kelas',
          'XII Multimedia 1',
        ),
        _infoProfil(
          Icons.verified_outlined,
          'Status Kedisiplinan',
          'Baik',
        ),

        const SizedBox(height: 18),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'Informasi profil masih menggunakan data contoh. '
            'Data asli akan tersedia setelah database dihubungkan.',
            style: TextStyle(
              color: primaryDark,
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 25),

        // TOMBOL LOGOUT
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: logout,
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Logout'),
            style: OutlinedButton.styleFrom(
              foregroundColor: red,
              side: const BorderSide(color: red),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildKartuPelanggaran(_PelanggaranAnak item) {
    final warna = warnaKategori(item.kategori);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => lihatDetail(item),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    warna.withValues(alpha: 0.12),
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
                    const SizedBox(height: 5),
                    Text(
                      item.kategori,
                      style: TextStyle(
                        color: warna,
                        fontWeight: FontWeight.w700,
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

  Widget _judul(String judul) {
    return Text(
      judul,
      style: const TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: const Color(0xFFE5EAF3),
      ),
    );
  }

  Widget _statistik(
    String judul,
    String nilai,
    IconData icon,
    Color warna,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                warna.withValues(alpha: 0.12),
            child: Icon(icon, color: warna),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nilai,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  judul,
                  style: const TextStyle(
                    color: greyText,
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

  Widget _infoProfil(
    IconData icon,
    String judul,
    String isi,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                primaryBlue.withValues(alpha: 0.08),
            child: Icon(icon, color: primaryBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    color: greyText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isi,
                  style: const TextStyle(
                    color: textColor,
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