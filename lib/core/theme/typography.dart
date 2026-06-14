import 'package:flutter/material.dart';

/// 🔤 Design System Typography — Culinode
/// Sesuai Figma Design Specification
/// Font: Roboto
///
/// Cara pakai:
/// ```dart
/// Text('Judul', style: AppTextStyles.h1);
/// Text('Deskripsi', style: AppTextStyles.body14);
/// ```
class AppTextStyles {
  AppTextStyles._(); // Prevent instantiation

  // ─────────────────────────────────────────────
  // Heading (H1 - H5)
  // ─────────────────────────────────────────────

  /// H1 — font-size: 28px, font-weight: 600 (semi-bold)
  static const TextStyle h1 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  /// H2 — font-size: 22px, font-weight: 600 (semi-bold)
  static const TextStyle h2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  /// H3 — font-size: 20px, font-weight: 600 (semi-bold)
  static const TextStyle h3 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  /// H4 — font-size: 18px, font-weight: 600 (semi-bold)
  static const TextStyle h4 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  /// H5 — font-size: 16px, font-weight: 600 (semi-bold)
  static const TextStyle h5 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  // ─────────────────────────────────────────────
  // Body
  // ─────────────────────────────────────────────

  /// Body 16 — font-size: 16px, font-weight: 400 (regular)
  static const TextStyle body16 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  /// Body 14 — font-size: 14px, font-weight: 400 (regular)
  static const TextStyle body14 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );

  /// Body 12 — font-size: 12px, font-weight: 400 (regular)
  static const TextStyle body12 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );
}
