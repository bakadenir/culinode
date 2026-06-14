import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// 🔘 Primary Button — Culinode Design System
///
/// Button reusable dengan spek dari Figma:
/// - Width: 347px, padding: 15px
/// - Border radius: 50px (pill shape)
/// - Background: AppColors.primary (#FF6B35)
/// - Text: putih, Roboto semi-bold 14px, ALL CAPS
///
/// Cara pakai:
/// ```dart
/// PrimaryButton(text: 'mulai', onPressed: () {}),
/// PrimaryButton(text: 'login', onPressed: () {}, width: 300),
/// ```
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
  });

  /// Label button — akan otomatis diubah ke huruf kapital (ALL CAPS)
  final String text;

  /// Callback saat button ditekan
  final VoidCallback onPressed;

  /// Lebar button (default: mengisi penuh parent container — responsif)
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Background color — main color dari design system
          backgroundColor: AppColors.primary,
          // Border radius 50px — pill shape
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          // Padding internal
          padding: const EdgeInsets.symmetric(vertical: 15),
          // Hilangkan elevation (shadow)
          elevation: 0,
          // Warna saat ditekan (ripple)
          foregroundColor: Colors.white.withValues(alpha: 0.2),
          // Disable state
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
          disabledForegroundColor: Colors.white,
        ),
        child: Text(
          text.toUpperCase(), // ← Otomatis ALL CAPS
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w600, // semi-bold
            fontStyle: FontStyle.normal,
            height: 1.0,
            color: AppColors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
