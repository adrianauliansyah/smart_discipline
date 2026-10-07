import 'package:flutter/material.dart';
import 'package:smart_discipline/screens/data_siswa_screen.dart';

import '../../data/mock_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/teacher_shell.dart';

import 'laporan_guru_screen.dart';
import 'profil_guru_screen.dart';
import 'riwayat_pelanggaran_screen.dart';
import 'tambah_pelanggaran_screen.dart';

class DashboardGuru
    extends StatelessWidget {
  const DashboardGuru({super.key});

  String _greeting() {
    final hour =
        DateTime.now().hour;

    if (hour < 11) {
      return 'Selamat Pagi';
    }

    if (hour < 15) {
      return 'Selamat Siang';
    }

    if (hour < 18) {
      return 'Selamat Sore';
    }

    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
    return TeacherShell(
      selectedIndex: 0,
      title: 'Dashboard Guru',

      actions: [
        IconButton(
          onPressed: () {},

          icon: const Badge(
            smallSize: 8,

            child: Icon(
              Icons
                  .notifications_none_rounded,
            ),
          ),
        ),

        const SizedBox(width: 8),
      ],

      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          final wide =
              constraints.maxWidth >= 900;

          final padding =
              wide ? 28.0 : 18.0;

          return SingleChildScrollView(
            padding:
                EdgeInsets.all(padding),

            child: Center(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(
                  maxWidth: 1280,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [
                    _HeroHeader(
                      greeting:
                          _greeting(),
                    ),

                    const SizedBox(
                      height: 22,
                    ),

                    _StatisticsGrid(
                      wide: wide,
                    ),

                    const SizedBox(
                      height: 26,
                    ),

                    const _SectionHeader(
                      title:
                          'Quick Actions',
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    _QuickActions(
                      wide: wide,
                    ),

                    const SizedBox(
                      height: 28,
                    ),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [
                        const _SectionHeader(
                          title:
                              'Pelanggaran Terbaru',
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    const RiwayatPelanggaranScreen(),
                              ),
                            );
                          },

                          child: const Text(
                            'Lihat Semua',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    ...violations
                        .take(3)
                        .map(
                          (v) =>
                              Padding(
                            padding:
                                const EdgeInsets
                                    .only(
                              bottom: 10,
                            ),

                            child:
                                _ViolationRow(
                              initials:
                                  v.initials,
                              name: v
                                  .studentName,
                              description:
                                  v.type,
                              time: v.time,
                              points:
                                  v.points,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeroHeader
    extends StatelessWidget {
  final String greeting;

  const _HeroHeader({
    required this.greeting,
  });

  String _dateText() {
    final d = DateTime.now();

    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
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
      'Desember'
    ];

    return '${days[d.weekday - 1]}, '
        '${d.day} '
        '${months[d.month - 1]} '
        '${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding:
          const EdgeInsets.all(24),

      decoration: BoxDecoration(
        gradient:
            const LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
          begin: Alignment.topLeft,
          end:
              Alignment.bottomRight,
        ),

        borderRadius:
            BorderRadius.circular(26),
      ),

      child: Wrap(
        spacing: 20,
        runSpacing: 16,

        alignment:
            WrapAlignment.spaceBetween,

        crossAxisAlignment:
            WrapCrossAlignment.center,

        children: [
          Row(
            mainAxisSize:
                MainAxisSize.min,

            children: [
              const CircleAvatar(
                radius: 27,
                backgroundColor:
                    Colors.white24,

                child: Text(
                  'BW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.w800,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  Text(
                    greeting,

                    style:
                        const TextStyle(
                      color:
                          Colors.white70,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(
                    height: 3,
                  ),

                  const Text(
                    'Bpk. Budi Wicaksono',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Container(
            padding:
                const EdgeInsets
                    .symmetric(
              horizontal: 14,
              vertical: 9,
            ),

            decoration: BoxDecoration(
              color: Colors.white
                  .withValues(alpha: 0.12),

              borderRadius:
                  BorderRadius.circular(
                18,
              ),
            ),

            child: Row(
              mainAxisSize:
                  MainAxisSize.min,

              children: [
                const Icon(
                  Icons
                      .calendar_month_rounded,
                  color: Colors.white,
                  size: 18,
                ),

                const SizedBox(width: 8),

                Text(
                  _dateText(),

                  style:
                      const TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.w600,
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

class _StatisticsGrid
    extends StatelessWidget {
  final bool wide;

  const _StatisticsGrid({
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    final cards = const [
      StatCard(
        icon:
            Icons.school_rounded,
        color: AppColors.primary,
        value: '350',
        label: 'Total Siswa',
        badge: '+12',
      ),

      StatCard(
        icon:
            Icons.warning_rounded,
        color: AppColors.danger,
        value: '125',
        label:
            'Total Pelanggaran',
        badge: '+8',
      ),

      StatCard(
        icon: Icons.star_rounded,
        color: AppColors.success,
        value: '85%',
        label:
            'Skor Kedisiplinan',
        badge: '+3%',
      ),

      StatCard(
        icon:
            Icons.description_rounded,
        color: AppColors.warning,
        value: '20',
        label: 'Laporan Aktif',
        badge: '-2',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,

      physics:
          const NeverScrollableScrollPhysics(),

      itemCount: cards.length,

      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            wide ? 4 : 2,

        crossAxisSpacing: 12,
        mainAxisSpacing: 12,

        childAspectRatio:
            wide ? 1.35 : 1.0,
      ),

      itemBuilder: (
        context,
        index,
      ) {
        return cards[index];
      },
    );
  }
}

class _QuickActions
    extends StatelessWidget {
  final bool wide;

  const _QuickActions({
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionData(
        icon:
            Icons.groups_rounded,
        title: 'Data Siswa',
        subtitle:
            'Lihat daftar siswa',
        color: AppColors.purple,

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const DataSiswaScreen(),
            ),
          );
        },
      ),

      _ActionData(
        icon:
            Icons.add_alert_rounded,
        title:
            'Tambah Pelanggaran',
        subtitle:
            'Catat pelanggaran baru',
        color: AppColors.warning,

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const TambahPelanggaranScreen(),
            ),
          );
        },
      ),

      _ActionData(
        icon: Icons.history_rounded,
        title:
            'Riwayat Pelanggaran',
        subtitle:
            'Lihat semua catatan',
        color: AppColors.danger,

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const TambahPelanggaranScreen(),
            ),
          );
        },
      ),

      _ActionData(
        icon:
            Icons.insights_rounded,
        title: 'Laporan',
        subtitle:
            'Analisis kedisiplinan',
        color: AppColors.success,

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const LaporanGuruScreen(),
            ),
          );
        },
      ),

      _ActionData(
        icon:
            Icons.person_rounded,
        title: 'Profil Guru',
        subtitle:
            'Kelola informasi akun',
        color: AppColors.primary,

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const ProfilGuruScreen(),
            ),
          );
        },
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,

      physics:
          const NeverScrollableScrollPhysics(),

      itemCount: actions.length,

      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            wide ? 5 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio:
            wide ? 1.15 : 1.25,
      ),

      itemBuilder: (
        context,
        index,
      ) {
        final item =
            actions[index];

        return InkWell(
          borderRadius:
              BorderRadius.circular(20),

          onTap: item.onTap,

          child: Container(
            padding:
                const EdgeInsets.all(
              16,
            ),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(
                20,
              ),

              border: Border.all(
                color:
                    AppColors.border,
              ),
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [
                Container(
                  width: 42,
                  height: 42,

                  decoration:
                      BoxDecoration(
                    color: item.color
                        .withValues(alpha: 0.12),
           

                    borderRadius:
                        BorderRadius
                            .circular(
                      14,
                    ),
                  ),

                  child: Icon(
                    item.icon,
                    color:
                        item.color,
                  ),
                ),

                const Spacer(),

                Text(
                  item.title,

                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight
                            .w800,
                  ),
                ),

                const SizedBox(
                  height: 4,
                ),

                Text(
                  item.subtitle,

                  style:
                      const TextStyle(
                    color:
                        AppColors.muted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActionData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ActionData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });
}

class _SectionHeader
    extends StatelessWidget {
  final String title;

  const _SectionHeader({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,

      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w900,
        color: AppColors.text,
      ),
    );
  }
}

class _ViolationRow
    extends StatelessWidget {
  final String initials;
  final String name;
  final String description;
  final String time;
  final int points;

  const _ViolationRow({
    required this.initials,
    required this.name,
    required this.description,
    required this.time,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(18),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
    AppColors.primary.withValues(alpha: 0.12),

            child: Text(
              initials,

              style:
                  const TextStyle(
                color:
                    AppColors.primary,
                fontWeight:
                    FontWeight.w800,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [
                Text(
                  name,

                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight
                            .w800,
                  ),
                ),

                const SizedBox(
                  height: 3,
                ),

                Text(
                  '$description • $time',

                  style:
                      const TextStyle(
                    color:
                        AppColors.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Text(
            '-$points',

            style: const TextStyle(
              color: AppColors.danger,
              fontWeight:
                  FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}