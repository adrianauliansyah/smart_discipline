import 'package:flutter/material.dart';
import 'package:smart_discipline/theme/app_theme.dart';

class RiwayatSiswaScreen extends StatefulWidget {
  const RiwayatSiswaScreen({super.key});

  @override
  State<RiwayatSiswaScreen> createState() =>
      _RiwayatSiswaScreenState();
}

class _RiwayatSiswaScreenState
    extends State<RiwayatSiswaScreen> {
  String pencarian = '';
  String filter = 'Semua';

  // DATA CONTOH SEMENTARA
  // Nanti diganti dengan data dari Firebase.
  final List<_Pelanggaran> data = const [
    _Pelanggaran(
      judul: 'Terlambat Masuk Sekolah',
      tanggal: '12 September 2026',
      kategori: 'Ringan',
      poin: 5,
      deskripsi:
          'Siswa datang setelah bel masuk sekolah berbunyi.',
      petugas: 'Guru Piket',
    ),
    _Pelanggaran(
      judul: 'Tidak Menggunakan Atribut Lengkap',
      tanggal: '10 September 2026',
      kategori: 'Ringan',
      poin: 5,
      deskripsi:
          'Siswa tidak menggunakan atribut sekolah sesuai peraturan.',
      petugas: 'Wali Kelas',
    ),
    _Pelanggaran(
      judul: 'Tidak Mengerjakan Tugas',
      tanggal: '8 September 2026',
      kategori: 'Sedang',
      poin: 10,
      deskripsi:
          'Siswa tidak mengerjakan tugas yang diberikan guru.',
      petugas: 'Guru Mata Pelajaran',
    ),
    _Pelanggaran(
      judul: 'Meninggalkan Kelas Tanpa Izin',
      tanggal: '5 September 2026',
      kategori: 'Sedang',
      poin: 10,
      deskripsi:
          'Siswa meninggalkan ruang kelas tanpa izin guru.',
      petugas: 'Guru Piket',
    ),
    _Pelanggaran(
      judul: 'Membolos Sekolah',
      tanggal: '2 September 2026',
      kategori: 'Berat',
      poin: 20,
      deskripsi:
          'Siswa tidak mengikuti kegiatan sekolah tanpa keterangan.',
      petugas: 'Guru BK',
    ),
  ];

  List<_Pelanggaran> get dataTampil {
    return data.where((item) {
      final kata = pencarian.toLowerCase();

      final cocokPencarian =
          item.judul.toLowerCase().contains(kata) ||
          item.tanggal.toLowerCase().contains(kata) ||
          item.deskripsi.toLowerCase().contains(kata);

      final cocokFilter =
          filter == 'Semua' || item.kategori == filter;

      return cocokPencarian && cocokFilter;
    }).toList();
  }

  int get totalPoin {
    return data.fold(
      0,
      (jumlah, item) => jumlah + item.poin,
    );
  }

  int get totalBerat {
    return data
        .where((item) => item.kategori == 'Berat')
        .length;
  }

  Color warnaKategori(String kategori) {
    switch (kategori) {
      case 'Ringan':
        return const Color(0xFF16A34A);
      case 'Sedang':
        return const Color(0xFFF59E0B);
      case 'Berat':
        return const Color(0xFFDC2626);
      default:
        return AppColors.primary;
    }
  }

  void tampilkanDetail(_Pelanggaran item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (context) {
        final warna = warnaKategori(item.kategori);

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              24, 12, 24, 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail Pelanggaran',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  item.judul,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 16),

                _DetailBaris(
                  label: 'Tanggal',
                  isi: item.tanggal,
                ),

                _DetailBaris(
                  label: 'Kategori',
                  isi: item.kategori,
                ),

                _DetailBaris(
                  label: 'Poin Pelanggaran',
                  isi: '${item.poin} Poin',
                ),

                _DetailBaris(
                  label: 'Dicatat Oleh',
                  isi: item.petugas,
                ),

                const SizedBox(height: 14),

                const Text(
                  'Keterangan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  item.deskripsi,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
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
                      backgroundColor: warna,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16),
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

  @override
  Widget build(BuildContext context) {
    final daftar = dataTampil;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Riwayat Pelanggaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.circular(22),
                    ),

                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.history_edu_rounded,
                          size: 36,
                          color: Colors.white,
                        ),

                        SizedBox(height: 16),

                        Text(
                          'Riwayat Kedisiplinan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          'Pantau catatan pelanggaran dan '
                          'perkembangan kedisiplinan kamu '
                          'selama bersekolah.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // RINGKASAN DATA
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final lebar = constraints.maxWidth;

                      final lebarKartu = lebar >= 750
                          ? (lebar - 32) / 3
                          : lebar >= 500
                              ? (lebar - 16) / 2
                              : lebar;

                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          SizedBox(
                            width: lebarKartu,
                            child: _StatCard(
                              judul: 'Total Pelanggaran',
                              nilai: '${data.length}',
                              icon: Icons.assignment_rounded,
                              warna: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            width: lebarKartu,
                            child: _StatCard(
                              judul: 'Total Poin',
                              nilai: '$totalPoin',
                              icon: Icons.stars_rounded,
                              warna: const Color(
                                0xFFF59E0B,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: lebarKartu,
                            child: _StatCard(
                              judul: 'Pelanggaran Berat',
                              nilai: '$totalBerat',
                              icon: Icons.warning_rounded,
                              warna: const Color(
                                0xFFDC2626,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  // JUDUL DAFTAR
                  const Text(
                    'Daftar Riwayat',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF172B4D),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Cari dan lihat detail catatan pelanggaran.',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PENCARIAN
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        pencarian = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari pelanggaran...',
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // FILTER
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
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: ChoiceChip(
                            label: Text(item),
                            selected: dipilih,
                            onSelected: (_) {
                              setState(() {
                                filter = item;
                              });
                            },
                            selectedColor:
                                AppColors.primary,
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: dipilih
                                  ? Colors.white
                                  : const Color(0xFF475569),
                              fontWeight: FontWeight.w600,
                            ),
                            side: BorderSide.none,
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // DAFTAR PELANGGARAN
                  if (daftar.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 52,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Data tidak ditemukan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Coba gunakan kata kunci atau '
                            'filter lainnya.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  else
                    ...daftar.map((item) {
                      final warna =
                          warnaKategori(item.kategori);

                      return Card(
                        color: Colors.white,
                        elevation: 0,
                        margin: const EdgeInsets.only(
                          bottom: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: InkWell(
                          borderRadius:
                              BorderRadius.circular(18),

                          onTap: () {
                            tampilkanDetail(item);
                          },

                          child: Padding(
                            padding: const EdgeInsets.all(
                              18,
                            ),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                // ICON
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: warna.withValues(
                                      alpha: 0.10,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(
                                      14,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.report_outlined,
                                    color: warna,
                                  ),
                                ),

                                const SizedBox(width: 14),

                                // INFORMASI
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.judul,
                                        style: const TextStyle(
                                          fontWeight:
                                              FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      Text(
                                        item.tanggal,
                                        style: const TextStyle(
                                          color: Color(
                                            0xFF64748B,
                                          ),
                                          fontSize: 12,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: [
                                          Container(
                                            padding:
                                                const EdgeInsets
                                                    .symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration:
                                                BoxDecoration(
                                              color: warna
                                                  .withValues(
                                                alpha: 0.10,
                                              ),
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                20,
                                              ),
                                            ),
                                            child: Text(
                                              item.kategori,
                                              style: TextStyle(
                                                color: warna,
                                                fontSize: 12,
                                                fontWeight:
                                                    FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding:
                                                const EdgeInsets
                                                    .symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration:
                                                BoxDecoration(
                                              color:
                                                  const Color(
                                                0xFFF1F5F9,
                                              ),
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                20,
                                              ),
                                            ),
                                            child: Text(
                                              '${item.poin} Poin',
                                              style:
                                                  const TextStyle(
                                                color: Color(
                                                  0xFF475569,
                                                ),
                                                fontSize: 12,
                                                fontWeight:
                                                    FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      const Text(
                                        'Ketuk untuk melihat detail',
                                        style: TextStyle(
                                          color: Color(
                                            0xFF94A3B8,
                                          ),
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// MODEL DATA PELANGGARAN
// ======================================================
class _Pelanggaran {
  final String judul;
  final String tanggal;
  final String kategori;
  final int poin;
  final String deskripsi;
  final String petugas;

  const _Pelanggaran({
    required this.judul,
    required this.tanggal,
    required this.kategori,
    required this.poin,
    required this.deskripsi,
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE8EDF5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: warna.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: warna,
              size: 24,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nilai,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
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
class _DetailBaris extends StatelessWidget {
  final String label;
  final String isi;

  const _DetailBaris({
    required this.label,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              isi,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}