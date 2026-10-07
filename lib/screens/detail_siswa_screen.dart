import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../models/student.dart';
import '../../theme/app_theme.dart';

class DetailSiswaScreen
    extends StatelessWidget {
  final Student student;

  const DetailSiswaScreen({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final studentViolations =
        violations
            .where(
              (v) =>
                  v.studentName ==
                  student.name,
            )
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Siswa',
          style: TextStyle(
            fontWeight:
                FontWeight.w800,
          ),
        ),
      ),

      body: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(
            maxWidth: 900,
          ),

          child: ListView(
            padding:
                const EdgeInsets.all(
              20,
            ),

            children: [
              Container(
                padding:
                    const EdgeInsets.all(
                  22,
                ),

                decoration:
                    BoxDecoration(
                  gradient:
                      const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors
                          .primaryDark,
                    ],
                  ),

                  borderRadius:
                      BorderRadius
                          .circular(
                    24,
                  ),
                ),

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor:
                          Colors.white24,

                      child: Text(
                        student
                            .initials,

                        style:
                            const TextStyle(
                          color:
                              Colors.white,
                          fontSize: 20,
                          fontWeight:
                              FontWeight
                                  .w800,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 16,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [
                          Text(
                            student
                                .name,

                            style:
                                const TextStyle(
                              color: Colors
                                  .white,
                              fontSize:
                                  20,
                              fontWeight:
                                  FontWeight
                                      .w900,
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          Text(
                            '${student.nis} • ${student.className}',

                            style:
                                const TextStyle(
                              color: Colors
                                  .white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              Row(
                children: [
                  Expanded(
                    child:
                        _InfoCard(
                      label:
                          'Skor Kedisiplinan',
                      value:
                          '${student.disciplineScore}',
                      icon: Icons
                          .star_rounded,
                      color: AppColors
                          .success,
                    ),
                  ),

                  const SizedBox(
                    width: 12,
                  ),

                  Expanded(
                    child:
                        _InfoCard(
                      label:
                          'Pelanggaran',
                      value:
                          '${student.violations}',
                      icon: Icons
                          .warning_rounded,
                      color:
                          AppColors.danger,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              const Text(
                'Riwayat Pelanggaran',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight:
                      FontWeight.w900,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              if (studentViolations
                  .isEmpty)
                const _EmptyState()
              else
                ...studentViolations
                    .map(
                      (v) => Padding(
                        padding:
                            const EdgeInsets
                                .only(
                          bottom: 10,
                        ),

                        child:
                            ListTile(
                          tileColor:
                              Colors.white,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              18,
                            ),
                            side:
                                const BorderSide(
                              color:
                                  AppColors
                                      .border,
                            ),
                          ),

                          leading:
                              const CircleAvatar(
                            backgroundColor:
                                Color(
                              0xFFFFECEB,
                            ),
                            child: Icon(
                              Icons
                                  .warning_rounded,
                              color:
                                  AppColors
                                      .danger,
                            ),
                          ),

                          title: Text(
                            v.type,
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight
                                      .w800,
                            ),
                          ),

                          subtitle:
                              Text(
                            '${v.date} • ${v.time} • ${v.category}',
                          ),

                          trailing:
                              Text(
                            '-${v.points}',
                            style:
                                const TextStyle(
                              color:
                                  AppColors
                                      .danger,
                              fontWeight:
                                  FontWeight
                                      .w900,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard
    extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _InfoCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Icon(
            icon,
            color: color,
          ),

          const SizedBox(height: 12),

          Text(
            value,

            style: const TextStyle(
              fontSize: 26,
              fontWeight:
                  FontWeight.w900,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,

            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState
    extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(28),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: const Column(
        children: [
          Icon(
            Icons.verified_rounded,
            size: 44,
            color: AppColors.success,
          ),

          SizedBox(height: 10),

          Text(
            'Belum ada pelanggaran',
            style: TextStyle(
              fontWeight:
                  FontWeight.w800,
            ),
          ),

          SizedBox(height: 4),

          Text(
            'Siswa ini belum memiliki catatan pelanggaran.',
            style: TextStyle(
              color: AppColors.muted,
            ),
            textAlign:
                TextAlign.center,
          ),
        ],
      ),
    );
  }
}