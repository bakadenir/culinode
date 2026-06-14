import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/widgets/primary_button.dart';
import 'core/widgets/form_field.dart';
import 'core/widgets/social_login_row.dart';
import 'masuk_screen.dart';
import 'main_screen.dart';

/// Formatter: kapital otomatis di setiap kata
class _CapitalizeEachWordFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;
    final capitalized = text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
    return TextEditingValue(
      text: capitalized,
      selection: TextSelection.collapsed(offset: capitalized.length),
    );
  }
}

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({super.key});

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  bool get _namaFilled => _namaController.text.trim().isNotEmpty;
  bool get _emailFilled => _emailController.text.trim().isNotEmpty;
  bool get _passwordFilled => _passwordController.text.isNotEmpty;
  bool get _confirmPasswordFilled => _confirmPasswordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _namaController.addListener(_rebuild);
    _emailController.addListener(_rebuild);
    _passwordController.addListener(_rebuild);
    _confirmPasswordController.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              child: Icon(
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
                'Daftar',
                style: AppTextStyles.h1.copyWith(color: AppColors.text1),
              ),
              const SizedBox(height: 40),

              // ── Nama Lengkap ──────────────────────────────
              AppFormField(
                label: 'Nama Lengkap',
                controller: _namaController,
                textCapitalization: TextCapitalization.words,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  _CapitalizeEachWordFormatter(),
                ],
                suffixIcon: _checkIcon(_namaFilled),
              ),
              const SizedBox(height: 32),

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
                  onTap: () => setState(() => _passwordVisible = !_passwordVisible),
                ),
              ),
              const SizedBox(height: 32),

              // ── Confirm Password ──────────────────────────
              AppFormField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: !_confirmPasswordVisible,
                suffixIcon: _eyeIcon(
                  visible: _confirmPasswordVisible,
                  onTap: () => setState(
                    () => _confirmPasswordVisible = !_confirmPasswordVisible,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              PrimaryButton(
                text: 'daftar',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: AppTextStyles.body16.copyWith(
                      color: AppColors.text2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MasukScreen()),
                      );
                    },
                    child: Text(
                      'Masuk',
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
