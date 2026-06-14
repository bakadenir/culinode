import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/shadows.dart';

/// 🔔 Reusable Notification Card — Culinode Design System
///
/// Menampilkan satu item notifikasi dengan layout:
/// [Icon Box Oranye Persegi] — [Judul + Deskripsi] — [Waktu]
///
/// - Icon box: selalu persegi (AspectRatio 1:1), kiri rounded, kanan siku
/// - Judul: 1 baris, ellipsis
/// - Deskripsi: max 2 baris, ellipsis
/// - Waktu: pojok kanan atas
///
/// Cara pakai:
/// ```dart
/// NotifCard(
///   icon: Icons.favorite_rounded,
///   judul: 'Resto Favorit Disimpan',
///   deskripsi: 'Sop Kambing Bang Anen berhasil ditambahkan.',
///   waktu: '2 jam lalu',
/// ),
/// ```
class NotifCard extends StatelessWidget {
  /// Icon yang tampil di kotak oranye kiri
  final IconData icon;

  /// Judul notifikasi (1 baris, auto ellipsis)
  final String judul;

  /// Deskripsi / body notifikasi (max 2 baris, auto ellipsis)
  final String deskripsi;

  /// Waktu relatif, contoh: '10 menit lalu', '2 jam lalu'
  final String waktu;

  const NotifCard({
    super.key,
    required this.icon,
    required this.judul,
    required this.deskripsi,
    required this.waktu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.card,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Icon box: lebar 80, tinggi stretch mengikuti konten ──────────
            Container(
              width: 80,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),

            const SizedBox(width: 14),

            // ── Konten ────────────────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      judul,
                      style: AppTextStyles.h5.copyWith(color: AppColors.text1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      deskripsi,
                      style: AppTextStyles.body14.copyWith(color: AppColors.text2),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // ── Waktu — pojok kanan atas ───────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 14),
              child: Text(
                waktu,
                style: AppTextStyles.body12.copyWith(color: AppColors.text2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
