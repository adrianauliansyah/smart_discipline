import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController(text: 'teacher@school.edu');

  final TextEditingController passwordController =
      TextEditingController(text: 'password123');

  String selectedRole = 'Teacher';
  bool showPassword = false;

  final Color primaryBlue = const Color(0xFF3563B8);
  final Color buttonBlue = const Color(0xFF3975D1);
  final Color textGrey = const Color(0xFF7B88A8);
  final Color borderColor = const Color(0xFFE0E5F0);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FD),
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: primaryBlue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.35),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Smart Discipline',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Student Discipline Monitoring System',
                    style: TextStyle(
                      color: Color(0xFFCFD9F3),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // ================= FORM =================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 27,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color(0xFF101322),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Sign in to your account',
                      style: TextStyle(
                        color: textGrey,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ================= EMAIL =================
                    _buildLabel('EMAIL / USERNAME'),

                    const SizedBox(height: 7),

                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF27324A),
                      ),
                      decoration: _inputDecoration(
                        hintText: 'teacher@school.edu',
                      ),
                    ),

                    const SizedBox(height: 17),

                    // ================= PASSWORD =================
                    _buildLabel('PASSWORD'),

                    const SizedBox(height: 7),

                    TextField(
                      controller: passwordController,
                      obscureText: !showPassword,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF27324A),
                      ),
                      decoration: _inputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                            color: const Color(0xFFA9B3CA),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 17),

                    // ================= ROLE =================
                    _buildLabel('LOGIN AS'),

                    const SizedBox(height: 7),

                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF9AA8C4),
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF27324A),
                      ),
                      decoration: _inputDecoration(),
                      items: const [
                        DropdownMenuItem(
                          value: 'Admin',
                          child: Text('Admin'),
                        ),
                        DropdownMenuItem(
                          value: 'Teacher',
                          child: Text('Teacher'),
                        ),
                        DropdownMenuItem(
                          value: 'Student',
                          child: Text('Student'),
                        ),
                        DropdownMenuItem(
                          value: 'Parent',
                          child: Text('Parent'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedRole = value;
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 21),

                    // ================= LOGIN BUTTON =================
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonBlue,
                          foregroundColor: Colors.white,
                          elevation: 5,
                          shadowColor: buttonBlue.withOpacity(0.35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ================= FORGOT PASSWORD =================
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Nanti bisa diarahkan ke halaman Forgot Password
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= LABEL =================
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF7B88A8),
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // ================= INPUT STYLE =================
  InputDecoration _inputDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF9EA8BB),
        fontSize: 13,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: primaryBlue,
          width: 1.4,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}