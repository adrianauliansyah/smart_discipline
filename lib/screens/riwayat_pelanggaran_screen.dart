import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../theme/app_theme.dart';

class RiwayatPelanggaranScreen
    extends StatefulWidget {
  const RiwayatPelanggaranScreen({
    super.key,
  });

  @override
  State<RiwayatPelanggaranScreen>
      createState() =>
          _RiwayatPelanggaranScreenState();
}

class _RiwayatPelanggaranScreenState
    extends State<
        RiwayatPelanggaranScreen> {
  String query = '';

  String category = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filtered =
        violations.where((v) {
      final q =
          query.toLowerCase();

      final matchesText =
          v.studentName
                  .toLowerCase()
                  .contains(q) ||
              v.type
                  .toLowerCase()
                  .contains(q);

      final matchesCategory =
          category == 'Semua' ||
              v.category ==
                  category;

      return matchesText &&
          matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Pelanggaran',
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
            maxWidth: 980,
          ),

          child: ListView(
            padding:
                const EdgeInsets.all(
              20,
            ),

            children: [
              LayoutBuilder(
                builder: (
                  context,
                  constraints,
                ) {
                  final narrow =
                      constraints
                              .maxWidth <
                          600;

                  final search =
                      TextField(
                    onChanged:
                        (value) {
                      setState(() {
                        query =
                            value;
                      });
                    },

                    decoration:
                        const InputDecoration(
                      prefixIcon:
                          Icon(
                        Icons
                            .search_rounded,
                      ),
                      hintText:
                          'Cari siswa atau pelanggaran...',
                    ),
                  );

                  final filter =
                      DropdownButtonFormField<
                          String>(
                    initialValue:
                        category,

                    items: const [
                      'Semua',
                      'Ringan',
                      'Sedang',
                      'Berat'
                    ]
                        .map(
                          (e) =>
                              DropdownMenuItem(
                            value: e,
                            child:
                                Text(e),
                          ),
                        )
                        .toList(),

                    onChanged:
                        (value) {
                      if (value !=
                          null) {
                        setState(
                          () {
                            category =
                                value;
                          },
                        );
                      }
                    },
                  );

                  if (narrow) {
                    return Column(
                      children: [
                        search,
                        const SizedBox(
                          height: 10,
                        ),
                        filter,
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: search,
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      Expanded(
                        child: filter,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(
                height: 18,
              ),

              ...filtered.map(
                (v) => Padding(
                  padding:
                      const EdgeInsets
                          .only(
                    bottom: 10,
                  ),

                  child: Container(
                    padding:
                        const EdgeInsets
                            .all(
                      16,
                    ),

                    decoration:
                        BoxDecoration(
                      color:
                          Colors.white,

                      borderRadius:
                          BorderRadius
                              .circular(
                        20,
                      ),

                      border:
                          Border.all(
                        color:
                            AppColors
                                .border,
                      ),
                    ),

                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,

                         backgroundColor: _categoryColor(
  v.category,
).withAlpha(31),

                          child: Text(
                            v.initials,

                            style:
                                TextStyle(
                              color:
                                  _categoryColor(
                                v.category,
                              ),
                              fontWeight:
                                  FontWeight
                                      .w800,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 14,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                            children: [
                              Text(
                                v.studentName,

                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .w900,
                                ),
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              Text(
                                v.type,
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(
                                '${v.date} • ${v.time}',

                                style:
                                    const TextStyle(
                                  color:
                                      AppColors
                                          .muted,
                                  fontSize:
                                      12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .end,

                          children: [
                            Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal:
                                    8,
                                vertical:
                                    4,
                              ),

                              decoration:
                                  BoxDecoration(
                                color: _categoryColor(
  v.category,
).withAlpha(26),
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  12,
                                ),
                              ),

                              child: Text(
                                v.category,

                                style:
                                    TextStyle(
                                  color:
                                      _categoryColor(
                                    v.category,
                                  ),
                                  fontSize:
                                      11,
                                  fontWeight:
                                      FontWeight
                                          .w800,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            Text(
                              '-${v.points}',

                              style:
                                  const TextStyle(
                                color:
                                    AppColors
                                        .danger,
                                fontSize:
                                    16,
                                fontWeight:
                                    FontWeight
                                        .w900,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Color _categoryColor(
      String value) {
    if (value == 'Berat') {
      return AppColors.danger;
    }

    if (value == 'Sedang') {
      return AppColors.warning;
    }

    return AppColors.success;
  }
}