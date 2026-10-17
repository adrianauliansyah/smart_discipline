import 'package:flutter/material.dart';

import 'riwayat_siswa_screen.dart';
import 'profil_siswa_screen.dart';

class DashboardSiswa extends StatefulWidget {
  const DashboardSiswa({super.key});

  @override
  State<DashboardSiswa> createState() =>
      _DashboardSiswaState();
}

class _DashboardSiswaState extends State<DashboardSiswa> {
  static const Color primaryBlue = Color(0xFF3563B8);
  static const Color primaryDark = Color(0xFF254A96);
  static const Color background = Color(0xFFF6F8FC);
  static const Color textColor = Color(0xFF172033);
  static const Color greyText = Color(0xFF8290AE);
  static const Color green = Color(0xFF63A85A);
  static const Color orange = Color(0xFFF0A13B);
  static const Color red = Color(0xFFE65B56);

  void _bukaRiwayat() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RiwayatSiswaScreen(),
      ),
    );
  }

  void _bukaProfil() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfilSiswaScreen(),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 11) return 'Selamat Pagi';
    if (hour < 15) return 'Selamat Siang';
    if (hour < 18) return 'Selamat Sore';

    return 'Selamat Malam';
  }

  String getCurrentDate() {
    final now = DateTime.now();

    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];

    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    return '${days[now.weekday - 1]}, '
        '${now.day} ${months[now.month - 1]} ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // HEADER PUTIH SMART DISCIPLINE
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
            tooltip: 'Notifikasi',
            onPressed: () {
              _showMessage('Notifikasi belum tersedia.');
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
                    maxWidth: 1200,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),

                      const SizedBox(height: 22),

                      // STATISTIK SISWA
                      GridView.count(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        crossAxisCount: desktop ? 4 : 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio:
                            desktop ? 1.35 : 1.05,
                        children: const [
                          _StatisticCard(
                            icon: Icons.star_rounded,
                            value: '85',
                            title: 'Skor Kedisiplinan',
                            color: green,
                          ),
                          _StatisticCard(
                            icon: Icons.warning_rounded,
                            value: '3',
                            title: 'Pelanggaran',
                            color: red,
                          ),
                          _StatisticCard(
                            icon: Icons.remove_circle_rounded,
                            value: '18',
                            title: 'Total Poin',
                            color: orange,
                          ),
                          _StatisticCard(
                            icon: Icons.verified_rounded,
                            value: 'Baik',
                            title: 'Status Disiplin',
                            color: primaryBlue,
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Status Kedisiplinan',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 12),

                      _buildDisciplineProgress(),

                      const SizedBox(height: 25),

                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Pelanggaran Terbaru',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _bukaRiwayat,
                            child: const Text('Lihat Semua'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      const _ViolationCard(
                        icon: Icons.schedule_rounded,
                        title: 'Terlambat masuk kelas',
                        date: '15 Januari 2026 • 08:15',
                        category: 'Ringan',
                        point: '-5',
                        color: orange,
                      ),

                      const SizedBox(height: 10),

                      const _ViolationCard(
                        icon: Icons.checkroom_rounded,
                        title: 'Seragam tidak lengkap',
                        date: '10 Januari 2026 • 07:30',
                        category: 'Sedang',
                        point: '-3',
                        color: red,
                      ),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),

      // NAVIGASI BAWAH SISWA
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFFF0ECF5),
        indicatorColor: const Color(0xFFE0E3FA),
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 0) {
            _bukaRiwayat();
          } else {
            _bukaProfil();
          }
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
      ),
    );
  }

  // HEADER BIRU INFORMASI SISWA
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryBlue, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withValues(alpha: 0.20),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:
                      Colors.white.withValues(alpha: 0.16),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'AR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreeting(),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'Ahmad Rizky Pratama',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
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

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(
                alpha: 0.13,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 7),
                Text(
                  getCurrentDate(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // PROGRESS KEDISIPLINAN
  Widget _buildDisciplineProgress() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
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
                  'Skor kamu saat ini',
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

          const SizedBox(height: 15),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const LinearProgressIndicator(
              value: 0.85,
              minHeight: 13,
              color: green,
              backgroundColor: Color(0xFFE8F3E8),
            ),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Icon(
                Icons.verified_rounded,
                color: green,
                size: 18,
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  'Status kedisiplinan kamu baik. Pertahankan!',
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
    );
  }
}

// KARTU STATISTIK SISWA
class _StatisticCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String title;
  final Color color;

  const _StatisticCard({
    required this.icon,
    required this.value,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE5EAF3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
              size: 21,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF172033),
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF8290AE),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// KARTU PELANGGARAN TERBARU
class _ViolationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String category;
  final String point;
  final Color color;

  const _ViolationCard({
    required this.icon,
    required this.title,
    required this.date,
    required this.category,
    required this.point,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
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
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF8290AE),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  category,
                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          Text(
            point,
            style: const TextStyle(
              color: Color(0xFFE65B56),
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}