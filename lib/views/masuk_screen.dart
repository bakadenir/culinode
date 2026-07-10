import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/widgets/primary_button.dart';
import '../core/widgets/form_field.dart';
import '../core/widgets/social_login_row.dart';
import 'daftar_screen.dart';
import 'main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasukScreen extends StatefulWidget {
  const MasukScreen({super.key});

  @override
  State<MasukScreen> createState() => _MasukScreenState();
}

class _MasukScreenState extends State<MasukScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

  bool get _emailFilled => _emailController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_rebuild);
    _passwordController.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Icon centang — muncul jika field sudah terisi
  Widget _checkIcon(bool filled) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: filled
          ? Padding(
              key: const ValueKey('check'),
              padding: const EdgeInsets.only(right: 12),
              child: const Icon(
                Icons.check_circle,
                size: 20,
                color: AppColors.primary,
              ),
            )
          : const SizedBox(key: ValueKey('empty'), width: 32),
    );
  }

  /// Icon mata — toggle hide/unhide password
  Widget _eyeIcon({
    required bool visible,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            key: ValueKey(visible),
            size: 20,
            color: AppColors.text2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masuk',
                style: AppTextStyles.h1.copyWith(color: AppColors.text1),
              ),
              const SizedBox(height: 40),

              // ── Email ─────────────────────────────────────
              AppFormField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: _checkIcon(_emailFilled),
              ),
              const SizedBox(height: 32),

              // ── Password ──────────────────────────────────
              AppFormField(
                label: 'Password',
                controller: _passwordController,
                obscureText: !_passwordVisible,
                suffixIcon: _eyeIcon(
                  visible: _passwordVisible,
                  onTap: () =>
                      setState(() => _passwordVisible = !_passwordVisible),
                ),
              ),
              const SizedBox(height: 12),

              // ── Lupa Password ────────────────────────────
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // TODO: navigasi ke halaman reset password
                  },
                  child: Text(
                    'Lupa Password?',
                    style: AppTextStyles.body14.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              PrimaryButton(
                text: 'masuk',
                onPressed: () async {
                  if (_emailFilled && _passwordController.text.isNotEmpty) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', true);
                    
                    if (!mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  } else {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email dan password harus diisi')),
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: AppTextStyles.body16.copyWith(
                      color: AppColors.text2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const DaftarScreen()),
                      );
                    },
                    child: Text(
                      'Daftar',
                      style: AppTextStyles.body16.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              SocialLoginRow(
                onGoogleTap: () {
                  // TODO: Login via Google
                },
                onFacebookTap: () {
                  // TODO: Login via Facebook
                },
                onTwitterTap: () {
                  // TODO: Login via Twitter/X
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
