import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/teacher_shell.dart';

class LaporanGuruScreen
    extends StatelessWidget {
  const LaporanGuruScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TeacherShell(
      selectedIndex: 1,
      title:
          'Laporan Kedisiplinan',

      child: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          final wide =
              constraints.maxWidth >= 900;

          return SingleChildScrollView(
            padding:
                const EdgeInsets.all(
              20,
            ),

            child: Center(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(
                  maxWidth: 1200,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [
                    GridView.count(
                      shrinkWrap: true,

                      physics:
                          const NeverScrollableScrollPhysics(),

                      crossAxisCount:
                          wide ? 4 : 2,

                      crossAxisSpacing:
                          12,

                      mainAxisSpacing:
                          12,

                      childAspectRatio:
                          wide
                              ? 1.35
                              : 1.0,

                      children: const [
                        StatCard(
                          icon: Icons
                              .groups_rounded,
                          color: AppColors
                              .primary,
                          value: '350',
                          label:
                              'Total Siswa',
                          badge: '+12',
                        ),

                        StatCard(
                          icon: Icons
                              .warning_rounded,
                          color:
                              AppColors
                                  .danger,
                          value: '125',
                          label:
                              'Pelanggaran',
                          badge: '+8',
                        ),

                        StatCard(
                          icon: Icons
                              .verified_rounded,
                          color:
                              AppColors
                                  .success,
                          value: '225',
                          label:
                              'Tanpa Pelanggaran',
                          badge: '+4%',
                        ),

                        StatCard(
                          icon: Icons
                              .star_rounded,
                          color:
                              AppColors
                                  .warning,
                          value: '85%',
                          label:
                              'Rata-rata Skor',
                          badge: '+3%',
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    const Text(
                      'Pelanggaran per Bulan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight
                                .w900,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    const _FakeBarChart(),

                    const SizedBox(
                      height: 24,
                    ),

                    const Text(
                      'Kategori Terbanyak',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight
                                .w900,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    const _CategorySummary(),
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

class _FakeBarChart
    extends StatelessWidget {
  const _FakeBarChart();

  @override
  Widget build(BuildContext context) {
    const data = [
      15.0,
      22.0,
      18.0,
      27.0,
      20.0,
      31.0
    ];

    const labels = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun'
    ];

    final max = data.reduce(
      (a, b) => a > b ? a : b,
    );

    return Container(
      height: 280,

      padding:
          const EdgeInsets.fromLTRB(
        20,
        24,
        20,
        16,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(22),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.end,

        children: List.generate(
          data.length,
          (i) {
            final fraction =
                data[i] / max;

            return Expanded(
              child: Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 6,
                ),

                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .end,

                  children: [
                    Text(
                      '${data[i].toInt()}',

                      style:
                          const TextStyle(
                        fontSize: 11,
                        color:
                            AppColors
                                .muted,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Flexible(
                      child:
                          FractionallySizedBox(
                        heightFactor:
                            fraction,

                        alignment:
                            Alignment
                                .bottomCenter,

                        child: Container(
                          width: 38,

                          decoration:
                              BoxDecoration(
                            color: AppColors.primary.withAlpha(230),

                            borderRadius:
                                const BorderRadius
                                    .vertical(
                              top:
                                  Radius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Text(
                      labels[i],

                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight
                                .w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CategorySummary
    extends StatelessWidget {
  const _CategorySummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(22),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: const Column(
        children: [
          _CategoryRow(
            label: 'Ringan',
            value: 56,
            total: 125,
            color:
                AppColors.success,
          ),

          SizedBox(height: 14),

          _CategoryRow(
            label: 'Sedang',
            value: 43,
            total: 125,
            color:
                AppColors.warning,
          ),

          SizedBox(height: 14),

          _CategoryRow(
            label: 'Berat',
            value: 26,
            total: 125,
            color:
                AppColors.danger,
          ),
        ],
      ),
    );
  }
}

class _CategoryRow
    extends StatelessWidget {
  final String label;
  final int value;
  final int total;
  final Color color;

  const _CategoryRow({
    required this.label,
    required this.value,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,

          child: Text(
            label,
            style: const TextStyle(
              fontWeight:
                  FontWeight.w700,
            ),
          ),
        ),

        Expanded(
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(
              10,
            ),

            child:
                LinearProgressIndicator(
              minHeight: 12,

              value:
                  value / total,

              color: color,

              backgroundColor: color.withAlpha(26),
            ),
          ),
        ),

        const SizedBox(width: 12),

        SizedBox(
          width: 34,

          child: Text(
            '$value',

            textAlign:
                TextAlign.right,

            style: const TextStyle(
              fontWeight:
                  FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}