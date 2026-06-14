import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'core/theme/colors.dart';
import 'onboarding_screen.dart'; // Pastikan Anda sudah membuat file onboarding_screen.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Ini adalah timer untuk menunggu selama 2 detik
    Timer(const Duration(seconds: 2), () {
      // Setelah 2 detik, otomatis pindah ke halaman OnboardingScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Warna oranye dari design system
      body: Center(
        child: SvgPicture.asset(
          'assets/logo.svg',
          width: 284,
          height: 96,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
