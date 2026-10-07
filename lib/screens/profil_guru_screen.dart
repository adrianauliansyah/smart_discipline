import 'package:flutter/material.dart';
import 'package:smart_discipline/screens/login_screen.dart';

import '../../theme/app_theme.dart';
import '../../widgets/teacher_shell.dart';

class ProfilGuruScreen
    extends StatelessWidget {
  const ProfilGuruScreen({
    super.key,
  });

  void _logout(
    BuildContext context,
  ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title:
              const Text('Logout'),

          content: const Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },

              child:
                  const Text('Batal'),
            ),

            FilledButton(
              onPressed: () {
                Navigator.of(context)
                    .pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) =>
                        const LoginScreen(),
                  ),
                  (route) => false,
                );
              },

              child: const Text(
                'Ya, Keluar',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TeacherShell(
      selectedIndex: 2,
      title: 'Profil Guru',

      child: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(
              maxWidth: 760,
            ),

            child: Column(
              children: [
                Container(
                  width:
                      double.infinity,

                  padding:
                      const EdgeInsets.all(
                    24,
                  ),

                  decoration:
                      BoxDecoration(
                    gradient:
                        const LinearGradient(
                      colors: [
                        AppColors
                            .primary,
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

                  child:
                      const Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor:
                            Colors
                                .white24,

                        child: Text(
                          'BW',
                          style:
                              TextStyle(
                            color: Colors
                                .white,
                            fontSize:
                                24,
                            fontWeight:
                                FontWeight
                                    .w900,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 14,
                      ),

                      Text(
                        'Budi Wicaksono',
                        style:
                            TextStyle(
                          color: Colors
                              .white,
                          fontSize: 22,
                          fontWeight:
                              FontWeight
                                  .w900,
                        ),
                      ),

                      SizedBox(
                        height: 4,
                      ),

                      Text(
                        'Guru Multimedia',
                        style:
                            TextStyle(
                          color: Colors
                              .white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                const _ProfileInfo(
                  icon: Icons
                      .badge_outlined,
                  label: 'NIP',
                  value:
                      '19890512 201501 1 001',
                ),

                const SizedBox(
                  height: 10,
                ),

                const _ProfileInfo(
                  icon: Icons
                      .mail_outline_rounded,
                  label: 'Email',
                  value:
                      'teacher@school.edu',
                ),

                const SizedBox(
                  height: 10,
                ),

                const _ProfileInfo(
                  icon: Icons
                      .phone_outlined,
                  label:
                      'Nomor Telepon',
                  value:
                      '0812 3456 7890',
                ),

                const SizedBox(
                  height: 10,
                ),

                const _ProfileInfo(
                  icon: Icons
                      .school_outlined,
                  label: 'Sekolah',
                  value:
                      'SMK Smart Discipline',
                ),

                const SizedBox(
                  height: 18,
                ),

                _MenuTile(
                  icon:
                      Icons.edit_outlined,
                  title:
                      'Edit Profil',
                  onTap: () {},
                ),

                _MenuTile(
                  icon: Icons
                      .lock_outline_rounded,
                  title:
                      'Ubah Password',
                  onTap: () {},
                ),

                _MenuTile(
                  icon: Icons
                      .info_outline_rounded,
                  title:
                      'Tentang Aplikasi',
                  onTap: () {},
                ),

                _MenuTile(
                  icon:
                      Icons.logout_rounded,
                  title: 'Logout',
                  danger: true,
                  onTap: () {
                    _logout(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileInfo
    extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(16),

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
                AppColors.primary
                    .withValues(alpha: 0.12),

            child: Icon(
              icon,
              color:
                  AppColors.primary,
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
                  label,

                  style:
                      const TextStyle(
                    color:
                        AppColors.muted,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(
                  height: 3,
                ),

                Text(
                  value,

                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight
                            .w800,
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

class _MenuTile
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool danger;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 8,
      ),

      child: ListTile(
        onTap: onTap,

        tileColor: Colors.white,

        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
            18,
          ),

          side: const BorderSide(
            color: AppColors.border,
          ),
        ),

        leading: Icon(
          icon,

          color: danger
              ? AppColors.danger
              : AppColors.primary,
        ),

        title: Text(
          title,

          style: TextStyle(
            fontWeight:
                FontWeight.w800,

            color: danger
                ? AppColors.danger
                : AppColors.text,
          ),
        ),

        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.muted,
        ),
      ),
    );
  }
}