import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../models/student.dart';
import '../../theme/app_theme.dart';

import 'detail_siswa_screen.dart';

class DataSiswaScreen
    extends StatefulWidget {
  const DataSiswaScreen({
    super.key,
  });

  @override
  State<DataSiswaScreen>
      createState() =>
          _DataSiswaScreenState();
}

class _DataSiswaScreenState
    extends State<DataSiswaScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered =
        students.where((s) {
      final q =
          query.toLowerCase();

      return s.name
              .toLowerCase()
              .contains(q) ||
          s.nis
              .toLowerCase()
              .contains(q) ||
          s.className
              .toLowerCase()
              .contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Siswa',
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
              TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },

                decoration:
                    const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                  ),
                  hintText:
                      'Cari nama, NIS, atau kelas...',
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              ...filtered.map(
                (student) =>
                    Padding(
                  padding:
                      const EdgeInsets
                          .only(
                    bottom: 10,
                  ),

                  child:
                      _StudentCard(
                    student:
                        student,
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

class _StudentCard
    extends StatelessWidget {
  final Student student;

  const _StudentCard({
    required this.student,
  });

  Color get scoreColor {
    if (student.disciplineScore >=
        90) {
      return AppColors.success;
    }

    if (student.disciplineScore >=
        80) {
      return AppColors.primary;
    }

    return AppColors.warning;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
          BorderRadius.circular(20),

      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) =>
                DetailSiswaScreen(
              student: student,
            ),
          ),
        );
      },

      child: Container(
        padding:
            const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(20),

          border: Border.all(
            color: AppColors.border,
          ),
        ),

        child: Row(
          children: [
            CircleAvatar(
              radius: 24,

              backgroundColor:
    AppColors.primary.withAlpha(31),

              child: Text(
                student.initials,

                style:
                    const TextStyle(
                  color:
                      AppColors.primary,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [
                  Text(
                    student.name,

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
                    '${student.nis} • ${student.className}',

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

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.end,

              children: [
                Text(
                  '${student.disciplineScore}',

                  style: TextStyle(
                    color:
                        scoreColor,
                    fontSize: 18,
                    fontWeight:
                        FontWeight
                            .w900,
                  ),
                ),

                const Text(
                  'Skor',
                  style: TextStyle(
                    color:
                        AppColors.muted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons
                  .chevron_right_rounded,
              color: AppColors.muted,
            ),
          ],
        ),
      ),
    );
  }
}