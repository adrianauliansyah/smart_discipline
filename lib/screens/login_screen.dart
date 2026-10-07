import 'package:flutter/material.dart';

import 'package:smart_discipline/screens/dashboard_guru.dart';
import 'package:smart_discipline/screens/siswa/dashboard_siswa.dart';
import 'package:smart_discipline/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController(
    text: 'teacher@school.edu',
  );

  final TextEditingController passwordController =
      TextEditingController(
    text: 'password123',
  );

  String role = 'Guru';

  bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  // =========================================================
  // LOGIN
  // =========================================================
  void _login() {
    // Cek email
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Email / Username harus diisi.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }

    // Cek password
    if (passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password harus diisi.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }

    // ===============================
    // LOGIN GURU
    // ===============================
    if (role == 'Guru') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardGuru(),
        ),
      );

      return;
    }

    // ===============================
    // LOGIN SISWA
    // ===============================
    if (role == 'Siswa') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardSiswa(),
        ),
      );

      return;
    }

    // ===============================
    // ORANG TUA
    // ===============================
    if (role == 'Orang Tua') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Dashboard Orang Tua belum dibuat.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }

    // ===============================
    // ADMIN
    // ===============================
    if (role == 'Admin') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Dashboard Admin akan dibuat terakhir.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          final bool desktop =
              constraints.maxWidth >= 850;

          // ===================================================
          // DESKTOP / WEB
          // ===================================================
          if (desktop) {
            return Row(
              children: [
                // =========================
                // BAGIAN KIRI
                // =========================
                Expanded(
                  flex: 11,
                  child: Container(
                    color: AppColors.primary,
                    padding: const EdgeInsets.all(
                      60,
                    ),
                    child: const _BrandPanel(),
                  ),
                ),

                // =========================
                // BAGIAN LOGIN
                // =========================
                Expanded(
                  flex: 9,
                  child: Container(
                    color: AppColors.background,
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(
                          40,
                        ),
                        child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(
                            maxWidth: 430,
                          ),
                          child: _LoginForm(
                            emailController:
                                emailController,
                            passwordController:
                                passwordController,
                            role: role,
                            obscure: obscure,

                            onRoleChanged: (value) {
                              setState(() {
                                role = value;
                              });
                            },

                            onTogglePassword: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },

                            onLogin: _login,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // ===================================================
          // MOBILE
          // ===================================================
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // =========================
                  // HEADER MOBILE
                  // =========================
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.fromLTRB(
                      24,
                      42,
                      24,
                      36,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.only(
                        bottomLeft:
                            Radius.circular(34),
                        bottomRight:
                            Radius.circular(34),
                      ),
                    ),
                    child: const _BrandPanel(
                      compact: true,
                    ),
                  ),

                  // =========================
                  // FORM MOBILE
                  // =========================
                  Padding(
                    padding: const EdgeInsets.all(
                      24,
                    ),
                    child: _LoginForm(
                      emailController:
                          emailController,
                      passwordController:
                          passwordController,
                      role: role,
                      obscure: obscure,

                      onRoleChanged: (value) {
                        setState(() {
                          role = value;
                        });
                      },

                      onTogglePassword: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },

                      onLogin: _login,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// =============================================================
// BRAND PANEL
// =============================================================
class _BrandPanel extends StatelessWidget {
  final bool compact;

  const _BrandPanel({
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center,

      crossAxisAlignment: compact
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,

      children: [
        // LOGO
        Container(
          width: compact ? 64 : 78,
          height: compact ? 64 : 78,

          decoration: BoxDecoration(
            color: Colors.white.withValues(
              alpha: 0.12,
            ),
            borderRadius:
                BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white30,
            ),
          ),

          child: Icon(
            Icons.school_rounded,
            color: Colors.white,
            size: compact ? 36 : 44,
          ),
        ),

        const SizedBox(height: 22),

        // NAMA APLIKASI
        Text(
          'Smart Discipline',

          textAlign: compact
              ? TextAlign.center
              : TextAlign.start,

          style: TextStyle(
            color: Colors.white,
            fontSize: compact ? 25 : 38,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 8),

        // SUBTITLE
        Text(
          'Student Discipline Monitoring System',

          textAlign: compact
              ? TextAlign.center
              : TextAlign.start,

          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),

        // DESKRIPSI DESKTOP
        if (!compact) ...[
          const SizedBox(height: 36),

          const Text(
            'Pantau siswa, catat pelanggaran, dan lihat '
            'laporan kedisiplinan dalam satu dashboard modern.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.6,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 35),

          // FITUR
          const _FeatureItem(
            icon: Icons.groups_rounded,
            title: 'Monitoring Siswa',
            description:
                'Pantau kedisiplinan siswa dengan mudah.',
          ),

          const SizedBox(height: 18),

          const _FeatureItem(
            icon: Icons.warning_amber_rounded,
            title: 'Pencatatan Pelanggaran',
            description:
                'Catat setiap pelanggaran secara terstruktur.',
          ),

          const SizedBox(height: 18),

          const _FeatureItem(
            icon: Icons.insights_rounded,
            title: 'Laporan Kedisiplinan',
            description:
                'Lihat perkembangan kedisiplinan siswa.',
          ),
        ],
      ],
    );
  }
}

// =============================================================
// FEATURE ITEM DESKTOP
// =============================================================
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            color: Colors.white.withValues(
              alpha: 0.12,
            ),
            borderRadius:
                BorderRadius.circular(14),
          ),

          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.w800,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                description,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================
// LOGIN FORM
// =============================================================
class _LoginForm extends StatelessWidget {
  final TextEditingController
      emailController;

  final TextEditingController
      passwordController;

  final String role;
  final bool obscure;

  final ValueChanged<String>
      onRoleChanged;

  final VoidCallback
      onTogglePassword;

  final VoidCallback onLogin;

  const _LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.role,
    required this.obscure,
    required this.onRoleChanged,
    required this.onTogglePassword,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        // =============================
        // TITLE
        // =============================
        const Text(
          'Welcome Back',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Masuk ke akun Smart Discipline.',
          style: TextStyle(
            color: AppColors.muted,
          ),
        ),

        const SizedBox(height: 28),

        // =============================
        // EMAIL
        // =============================
        const _FieldLabel(
          'EMAIL / USERNAME',
        ),

        const SizedBox(height: 8),

        TextField(
          controller: emailController,

          keyboardType:
              TextInputType.emailAddress,

          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.mail_outline_rounded,
            ),
            hintText:
                'Masukkan email atau username',
          ),
        ),

        const SizedBox(height: 18),

        // =============================
        // PASSWORD
        // =============================
        const _FieldLabel(
          'PASSWORD',
        ),

        const SizedBox(height: 8),

        TextField(
          controller: passwordController,

          obscureText: obscure,

          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
            ),

            hintText:
                'Masukkan password',

            suffixIcon: IconButton(
              onPressed:
                  onTogglePassword,

              icon: Icon(
                obscure
                    ? Icons
                        .visibility_off_outlined
                    : Icons
                        .visibility_outlined,
              ),
            ),
          ),
        ),

        const SizedBox(height: 18),

        // =============================
        // LOGIN AS
        // =============================
        const _FieldLabel(
          'LOGIN AS',
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: role,

          isExpanded: true,

          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle_outlined,
            ),
          ),

          items: const [
            'Guru',
            'Siswa',
            'Orang Tua',
            'Admin',
          ]
              .map(
                (item) =>
                    DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),

          onChanged: (value) {
            if (value != null) {
              onRoleChanged(value);
            }
          },
        ),

        const SizedBox(height: 24),

        // =============================
        // LOGIN BUTTON
        // =============================
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onLogin,

            icon: const Icon(
              Icons.login_rounded,
              size: 20,
            ),

            label: const Text(
              'LOGIN',
            ),
          ),
        ),

        const SizedBox(height: 8),

        // =============================
        // FORGOT PASSWORD
        // =============================
        Center(
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Fitur lupa password belum tersedia.',
                  ),
                  behavior:
                      SnackBarBehavior.floating,
                ),
              );
            },

            child: const Text(
              'Forgot Password?',
            ),
          ),
        ),

        const SizedBox(height: 10),

        // =============================
        // INFO PROTOTYPE
        // =============================
        Container(
          width: double.infinity,

          padding:
              const EdgeInsets.all(13),

          decoration: BoxDecoration(
            color: AppColors.primary
                .withValues(
              alpha: 0.06,
            ),

            borderRadius:
                BorderRadius.circular(14),

            border: Border.all(
              color: AppColors.primary
                  .withValues(
                alpha: 0.12,
              ),
            ),
          ),

          child: const Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.primary,
                size: 18,
              ),

              SizedBox(width: 9),

              Expanded(
                child: Text(
                  'Saat ini Dashboard Guru dan Dashboard '
                  'Siswa sudah aktif.',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================
// FIELD LABEL
// =============================================================
class _FieldLabel extends StatelessWidget {
  final String text;

  const _FieldLabel(this.text);

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