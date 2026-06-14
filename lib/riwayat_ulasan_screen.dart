import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/theme/shadows.dart';

class RiwayatUlasanScreen extends StatelessWidget {
  const RiwayatUlasanScreen({super.key});

  // ── Dummy local data (nanti diganti JSON / API) ───────────────────────────
  static const List<Map<String, dynamic>> _dummyData = [
    {
      'nama': 'Seafood45',
      'kategori': 'Cepat Saji',
      'rating': 4.5,
      'jarak': '1.1 km',
      'highlighted': false,
      'gambar':
          'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Mail Lesehan Fatmawati',
      'kategori': 'Cepat Saji',
      'rating': 4.4,
      'jarak': '0.7 km',
      'highlighted': true,
      'gambar':
          'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Sop Kambing Bang Anen',
      'kategori': 'Cepat Saji',
      'rating': 4.3,
      'jarak': '1.3 km',
      'highlighted': false,
      'gambar':
          'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Bebek Carok - Jakarta Selatan',
      'kategori': 'Cepat Saji',
      'rating': 4.6,
      'jarak': '3.3 km',
      'highlighted': false,
      'gambar':
          'https://images.unsplash.com/photo-1626200419199-391ae4be7a41?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Waroeng 80',
      'kategori': 'Cepat Saji',
      'rating': 4.8,
      'jarak': '3.4 km',
      'highlighted': false,
      'gambar':
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=400&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────────
            _buildHeader(context),

            // ── List ─────────────────────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                itemCount: _dummyData.length,
                separatorBuilder: (_, _) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return _UlasanCard(item: _dummyData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: AppColors.text1,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Riwayat Ulasan',
              textAlign: TextAlign.center,
              style: AppTextStyles.h4.copyWith(color: AppColors.text1),
            ),
          ),
          const SizedBox(width: 28), // balance back button
        ],
      ),
    );
  }
}

// ── Card item ─────────────────────────────────────────────────────────────────

class _UlasanCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const _UlasanCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final bool highlighted = item['highlighted'] as bool;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.card,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            // ── Gambar makanan ──────────────────────────────────────────────
            _buildImage(),

            // ── Konten ─────────────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nama restoran
                    Text(
                      item['nama'] as String,
                      style: AppTextStyles.h5.copyWith(color: AppColors.text1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Kategori
                    Text(
                      item['kategori'] as String,
                      style: AppTextStyles.body14.copyWith(
                        color: AppColors.text2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Rating + jarak
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 14,
                          color: Color(0xFFFFC107),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${item['rating']} -',
                          style: AppTextStyles.body14.copyWith(
                            color: AppColors.text2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: AppColors.text2,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          item['jarak'] as String,
                          style: AppTextStyles.body14.copyWith(
                            color: AppColors.text2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Chevron ─────────────────────────────────────────────────────
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.text2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final String? gambar = item['gambar'] as String?;

    if (gambar != null) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        child: gambar.startsWith('http')
            ? Image.network(gambar, width: 90, height: 100, fit: BoxFit.cover)
            : Image.asset(gambar, width: 90, height: 100, fit: BoxFit.cover),
      );
    }

    // Placeholder jika gambar belum tersedia
    return Container(
      width: 90,
      height: 100,
      color: AppColors.lightGrey2,
      child: const Icon(
        Icons.restaurant_rounded,
        size: 32,
        color: AppColors.text2,
      ),
    );
  }
}
