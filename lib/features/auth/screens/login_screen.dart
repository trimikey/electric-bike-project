import 'package:flutter/material.dart';

import '../../../core/utils/storage.dart';
import '../services/auth_service.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _handleGoogleLogin(BuildContext context) async {
    final result = await AuthService().signInWithGoogle();
    if (result.success) {
      if (result.token != null) {
        await Storage.saveToken(result.token!);
      }
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message ?? "Đăng nhập Google thất bại")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('lib/core/assets/Logo_xe_dien_EV.png',
                    width: 80, height: 80),
                const SizedBox(height: 16),
                const Text(
                  "Đăng nhập",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // 🔑 Form login thường
                const LoginForm(),
                const SizedBox(height: 16),

                // Google login
                OutlinedButton.icon(
                  icon: Image.asset(
                    'lib/core/assets/Google_logo.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: const Text(
                    "Đăng nhập với Google",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                  ),
                  onPressed: () => _handleGoogleLogin(context),
                ),

                const SizedBox(height: 16),

                // Register link
                Column(
                  children: [
                    const Text("Bạn chưa có tài khoản?"),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/register"),
                      child: const Text("Đăng ký tài khoản"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
