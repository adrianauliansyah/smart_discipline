import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../theme/app_theme.dart';

class TambahPelanggaranScreen
    extends StatefulWidget {
  const TambahPelanggaranScreen({
    super.key,
  });

  @override
  State<TambahPelanggaranScreen>
      createState() =>
          _TambahPelanggaranScreenState();
}

class _TambahPelanggaranScreenState
    extends State<
        TambahPelanggaranScreen> {
  String? selectedStudent =
      students.first.name;

  String selectedType =
      'Terlambat masuk kelas';

  String selectedCategory =
      'Ringan';

  final pointsController =
      TextEditingController(
    text: '5',
  );

  final noteController =
      TextEditingController();

  @override
  void dispose() {
    pointsController.dispose();
    noteController.dispose();

    super.dispose();
  }

  void _save() {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Data pelanggaran berhasil disimpan.',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Pelanggaran',
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
            maxWidth: 760,
          ),

          child: ListView(
            padding:
                const EdgeInsets.all(
              20,
            ),

            children: [
              const _IntroCard(),

              const SizedBox(
                height: 18,
              ),

              const _Label('SISWA'),

              const SizedBox(
                height: 8,
              ),

              DropdownButtonFormField<
                  String>(
                initialValue: 
                    selectedStudent,

                isExpanded: true,

                items: students
                    .map(
                      (s) =>
                          DropdownMenuItem(
                        value: s.name,
                        child: Text(
                          '${s.name} • ${s.className}',
                        ),
                      ),
                    )
                    .toList(),

                onChanged: (value) {
                  setState(() {
                    selectedStudent =
                        value;
                  });
                },
              ),

              const SizedBox(
                height: 18,
              ),

              const _Label(
                'JENIS PELANGGARAN',
              ),

              const SizedBox(
                height: 8,
              ),

              DropdownButtonFormField<
                  String>(
     initialValue: 
                    selectedType,

                items: const [
                  'Terlambat masuk kelas',
                  'Seragam tidak lengkap',
                  'Menggunakan HP saat pelajaran',
                  'Tidak hadir tanpa keterangan',
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

                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedType =
                          value;
                    });
                  }
                },
              ),

              const SizedBox(
                height: 18,
              ),

              LayoutBuilder(
                builder: (
                  context,
                  constraints,
                ) {
                  final stacked =
                      constraints
                              .maxWidth <
                          520;

                  final category =
                      Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      const _Label(
                        'KATEGORI',
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      DropdownButtonFormField<
                          String>(
                        initialValue: selectedCategory,

                        items: const [
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
                                selectedCategory =
                                    value;
                              },
                            );
                          }
                        },
                      ),
                    ],
                  );

                  final points =
                      Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      const _Label(
                        'POIN',
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      TextField(
                        controller:
                            pointsController,

                        keyboardType:
                            TextInputType
                                .number,

                        decoration:
                            const InputDecoration(
                          prefixIcon:
                              Icon(
                            Icons
                                .remove_circle_outline_rounded,
                          ),
                        ),
                      ),
                    ],
                  );

                  if (stacked) {
                    return Column(
                      children: [
                        category,

                        const SizedBox(
                          height: 18,
                        ),

                        points,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [
                      Expanded(
                        child:
                            category,
                      ),

                      const SizedBox(
                        width: 14,
                      ),

                      Expanded(
                        child: points,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(
                height: 18,
              ),

              const _Label(
                'KETERANGAN',
              ),

              const SizedBox(
                height: 8,
              ),

              TextField(
                controller:
                    noteController,

                maxLines: 5,

                decoration:
                    const InputDecoration(
                  hintText:
                      'Tambahkan keterangan jika diperlukan...',
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              ElevatedButton.icon(
                onPressed: _save,

                icon: const Icon(
                  Icons.save_rounded,
                ),

                label: const Text(
                  'SIMPAN PELANGGARAN',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroCard
    extends StatelessWidget {
  const _IntroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.warning
            .withValues(alpha: 0.12),

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: AppColors.warning
              .withValues(alpha: 0.12),
        ),
      ),

      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor:
                Color(0xFFFFE8C7),

            child: Icon(
              Icons
                  .warning_amber_rounded,
              color:
                  AppColors.warning,
            ),
          ),

          SizedBox(width: 12),

          Expanded(
            child: Text(
              'Pastikan data siswa, jenis pelanggaran, kategori, dan poin sudah benar sebelum disimpan.',
              style: TextStyle(
                color: AppColors.text,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Label
    extends StatelessWidget {
  final String text;

  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: const TextStyle(
        color: AppColors.muted,
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
      ),
    );
  }
}