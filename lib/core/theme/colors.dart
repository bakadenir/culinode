import 'package:flutter/material.dart';

/// 🎨 Design System Warna — Culinode
/// Sesuai Figma Design Specification
///
/// Cara pakai:
/// ```dart
/// Container(color: AppColors.primary);
/// Text('Hello', style: TextStyle(color: AppColors.text1));
/// ```
class AppColors {
  AppColors._(); // Prevent instantiation

  // ─────────────────────────────────────────────
  // Primary
  // ─────────────────────────────────────────────

  /// #FF6B35 — Warna utama brand Culinode (oranye)
  static const Color primary = Color(0xFFFF6B35);

  // ─────────────────────────────────────────────
  // Text
  // ─────────────────────────────────────────────

  /// #232323 — Warna teks utama (gelap, untuk heading & body penting)
  static const Color text1 = Color(0xFF232323);

  /// #80869A — Warna teks sekunder (abu-abu, untuk subtitle & deskripsi)
  static const Color text2 = Color(0xFF80869A);

  // ─────────────────────────────────────────────
  // Background / Surface
  // ─────────────────────────────────────────────

  /// #E2E2E2 — Light Grey 1 (separator, border, disabled background)
  static const Color lightGrey1 = Color(0xFFE2E2E2);

  /// #EEF3FC — Light Grey 2 (card background, input field background)
  static const Color lightGrey2 = Color(0xFFEEF3FC);

  // ─────────────────────────────────────────────
  // Semantic / Aksi
  // ─────────────────────────────────────────────

  /// #FF3535 — Warna love/favorit & error
  static const Color love = Color(0xFFFF3535);

  // ─────────────────────────────────────────────
  // Utility (tambahan umum)
  // ─────────────────────────────────────────────

  /// Warna putih standar
  static const Color white = Color(0xFFFFFFFF);

  /// Warna hitam standar
  static const Color black = Color(0xFF000000);

  /// Warna transparent
  static const Color transparent = Color(0x00000000);
}
