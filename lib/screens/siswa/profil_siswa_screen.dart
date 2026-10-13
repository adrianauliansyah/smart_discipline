
import 'package:flutter/material.dart';

class ProfilSiswaScreen extends StatelessWidget {
  const ProfilSiswaScreen({super.key});

  // =====================================================
  // WARNA
  // =====================================================
  static const Color primaryBlue = Color(0xFF3563B8);
  static const Color primaryDark = Color(0xFF254A96);
  static const Color background = Color(0xFFF6F8FC);
  static const Color textColor = Color(0xFF172033);
  static const Color greyText = Color(0xFF8290AE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // =================================================
      // APP BAR
      // =================================================
      appBar: AppBar(
        title: const Text(
          'Profil Siswa',
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        foregroundColor: textColor,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 850,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  // ===============================
                  // HEADER PROFIL
                  // ===============================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(26),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          primaryBlue,
                          primaryDark,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      borderRadius:
                          BorderRadius.circular(24),
                    ),

                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 37,
                          backgroundColor:
                              Colors.white24,

                          child: Text(
                            'AR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.w900,
                            ),
                          ),
                        ),

                        SizedBox(height: 14),

                        Text(
                          'Ahmad Rizky Pratama',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'XII Multimedia 1',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ===============================
                  // INFORMASI SISWA
                  // ===============================
                  const Text(
                    'Informasi Siswa',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const _ProfilInfo(
                    icon: Icons.badge_outlined,
                    label: 'Nama Lengkap',
                    value: 'Ahmad Rizky Pratama',
                  ),

                  const _ProfilInfo(
                    icon: Icons.numbers_rounded,
                    label: 'NIS',
                    value: 'Belum tersedia',
                  ),

                  const _ProfilInfo(
                    icon: Icons.school_outlined,
                    label: 'Kelas',
                    value: 'XII Multimedia 1',
                  ),

                  const _ProfilInfo(
                    icon: Icons.person_outline_rounded,
                    label: 'Wali Kelas',
                    value: 'Belum tersedia',
                  ),

                  const SizedBox(height: 12),

                  // ===============================
                  // KETERANGAN DATABASE
                  // ===============================
                  Container(
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: primaryBlue.withValues(
                        alpha: 0.07,
                      ),
                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: const Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: primaryBlue,
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            'Data profil masih contoh. '
                            'Informasi siswa akan diperbarui '
                            'setelah database dihubungkan.',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: greyText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// KARTU INFORMASI PROFIL
// =====================================================
class _ProfilInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfilInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 11,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(17),

        border: Border.all(
          color: const Color(0xFFE5EAF3),
        ),
      ),

      child: Row(
        children: [
          // ICON
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color:
                  ProfilSiswaScreen.primaryBlue
                      .withValues(
                alpha: 0.08,
              ),

              borderRadius:
                  BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color:
                  ProfilSiswaScreen.primaryBlue,
            ),
          ),

          const SizedBox(width: 12),

          // INFORMASI
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color:
                        ProfilSiswaScreen.greyText,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color:
                        ProfilSiswaScreen.textColor,
                    fontSize: 15,
                    fontWeight:
                        FontWeight.w700,
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
