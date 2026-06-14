import 'package:flutter/material.dart';

/// 🌑 Design System Shadow — Culinode
/// Sesuai Figma Design Specification
///
/// Cara pakai:
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     boxShadow: AppShadows.card,
///   ),
/// );
/// ```
class AppShadows {
  AppShadows._(); // Prevent instantiation

  // ─────────────────────────────────────────────
  // Card Shadow
  // ─────────────────────────────────────────────

  /// Shadow utama untuk card / container
  /// X: 0 | Y: 4 | Blur: 24 | Spread: 0 | Color: #062664 @ 10%
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x1A062664), // #062664 @ 10% opacity (hex: 0x1A = 26 ≈ 10%)
      offset: Offset(0, 4),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];
}
