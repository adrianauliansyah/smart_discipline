import 'package:flutter/material.dart';
import 'package:smart_discipline/screens/dashboard_guru.dart';

import 'package:smart_discipline/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final emailController =
      TextEditingController(
    text: 'teacher@school.edu',
  );

  final passwordController =
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

  void _login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text
            .trim()
            .isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Email dan password harus diisi.',
          ),
        ),
      );

      return;
    }

    if (role != 'Guru') {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Dashboard $role belum diaktifkan.',
          ),
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const DashboardGuru(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (
          context,
          constraints,
        ) {
          final desktop =
              constraints.maxWidth >= 850;

          // DESKTOP
          if (desktop) {
            return Row(
              children: [
                Expanded(
                  flex: 11,

                  child: Container(
                    color: AppColors.primary,
                    padding:
                        const EdgeInsets.all(
                      60,
                    ),
                    child:
                        const _BrandPanel(),
                  ),
                ),

                Expanded(
                  flex: 9,

                  child: Center(
                    child:
                        SingleChildScrollView(
                      padding:
                          const EdgeInsets.all(
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

                          onRoleChanged:
                              (value) {
                            setState(() {
                              role = value;
                            });
                          },

                          onTogglePassword:
                              () {
                            setState(() {
                              obscure =
                                  !obscure;
                            });
                          },

                          onLogin: _login,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // MOBILE
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width:
                        double.infinity,

                    padding:
                        const EdgeInsets
                            .fromLTRB(
                      24,
                      42,
                      24,
                      36,
                    ),

                    decoration:
                        const BoxDecoration(
                      color:
                          AppColors.primary,

                      borderRadius:
                          BorderRadius.only(
                        bottomLeft:
                            Radius.circular(
                          34,
                        ),
                        bottomRight:
                            Radius.circular(
                          34,
                        ),
                      ),
                    ),

                    child:
                        const _BrandPanel(
                      compact: true,
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.all(
                      24,
                    ),

                    child: _LoginForm(
                      emailController:
                          emailController,

                      passwordController:
                          passwordController,

                      role: role,
                      obscure: obscure,

                      onRoleChanged:
                          (value) {
                        setState(() {
                          role = value;
                        });
                      },

                      onTogglePassword:
                          () {
                        setState(() {
                          obscure =
                              !obscure;
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

        Text(
          'Smart Discipline',

          textAlign: compact
              ? TextAlign.center
              : TextAlign.start,

          style: TextStyle(
            color: Colors.white,
            fontSize:
                compact ? 25 : 38,
            fontWeight:
                FontWeight.w900,
          ),
        ),

        const SizedBox(height: 8),

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

        if (!compact) ...[
          const SizedBox(height: 36),

          const Text(
            'Pantau siswa, catat pelanggaran, dan lihat laporan kedisiplinan dalam satu dashboard modern.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.6,
              fontSize: 16,
            ),
          ),
        ],
      ],
    );
  }
}

class _LoginForm
    extends StatelessWidget {
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
        const Text(
          'Welcome Back',
          style: TextStyle(
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

        const _FieldLabel(
          'EMAIL / USERNAME',
        ),

        const SizedBox(height: 8),

        TextField(
          controller: emailController,
          decoration:
              const InputDecoration(
            prefixIcon: Icon(
              Icons.mail_outline_rounded,
            ),
          ),
        ),

        const SizedBox(height: 18),

        const _FieldLabel(
          'PASSWORD',
        ),

        const SizedBox(height: 8),

        TextField(
          controller:
              passwordController,
          obscureText: obscure,

          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
            ),

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

        const _FieldLabel(
          'LOGIN AS',
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(

  initialValue: role,

          items: const [
            'Guru',
            'Admin',
            'Siswa',
            'Orang Tua'
          ]
              .map(
                (e) =>
                    DropdownMenuItem(
                  value: e,
                  child: Text(e),
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

        ElevatedButton(
          onPressed: onLogin,
          child: const Text('LOGIN'),
        ),

        const SizedBox(height: 8),

        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password?',
            ),
          ),
        ),
      ],
    );
  }
}

class _FieldLabel
    extends StatelessWidget {
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