import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/theme/shadows.dart';

/// 🍽️ Screen Detail Restoran — Culinode
///
/// Menampilkan info lengkap restoran: hero image, nama, rating,
/// alamat, tombol maps & ulasan, daftar review pengunjung.
class RestoranDetailScreen extends StatefulWidget {
  final Map<String, dynamic> restoran;

  const RestoranDetailScreen({super.key, required this.restoran});

  @override
  State<RestoranDetailScreen> createState() => _RestoranDetailScreenState();
}

class _RestoranDetailScreenState extends State<RestoranDetailScreen> {
  late bool _isFavorit;

  // ── Dummy detail per restoran ─────────────────────────────────────────────
  static const Map<String, String> _alamatMap = {
    'Donat Bahagiat':
        'Jl. Kemang Raya No.8, Bangka, Mampang Prapatan, Jakarta Selatan 12730',
    'Seporsi Mie Kari':
        'Jl. Senopati No.22, Kebayoran Baru, Jakarta Selatan 12110',
  };

  static const Map<String, int> _jumlahUlasanMap = {
    'Donat Bahagiat': 8,
    'Seporsi Mie Kari': 15,
  };

  static const List<Map<String, dynamic>> _reviews = [
    {
      'nama': 'Jihan Aulia',
      'rating': 4.7,
      'teks':
          'Ayamnya enak, harganya terjangkau. Tempatnya juga nyaman dan bersih.',
      'avatar':
          'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&q=80',
      'foto': [
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=200&q=80',
        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=200&q=80',
      ],
    },
    {
      'nama': 'Budi Santoso',
      'rating': 4.5,
      'teks': 'Porsinya besar, rasanya otentik. Suka banget sama sambalnya!',
      'avatar':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&q=80',
      'foto': [
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=200&q=80',
      ],
    },
    {
      'nama': 'Sari Dewi',
      'rating': 5.0,
      'teks':
          'Wajib coba! Kualitas bahan baku terjamin segar. Bakalan balik lagi.',
      'avatar':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&q=80',
      'foto': <String>[],
    },
  ];

  @override
  void initState() {
    super.initState();
    _isFavorit = widget.restoran['favorit'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.restoran;
    final String gambar = item['gambar'] as String;
    final String nama = item['nama'] as String;
    final String kategori = item['kategori'] as String;
    final double rating = (item['rating'] as num).toDouble();
    final String jarak = item['jarak'] as String;
    final String alamat = _alamatMap[nama] ?? 'Jakarta Selatan, DKI Jakarta';
    final int jumlahUlasan = _jumlahUlasanMap[nama] ?? 5;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Image ──────────────────────────────────────────────────
            Stack(
              children: [
                // Gambar utama
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: Image.network(
                    gambar,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      color: AppColors.lightGrey2,
                      child: const Icon(
                        Icons.restaurant_rounded,
                        size: 64,
                        color: AppColors.text2,
                      ),
                    ),
                  ),
                ),

                // Gradient gelap di atas untuk baca tombol
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.4, 1.0],
                        colors: [
                          Colors.black.withValues(alpha: 0.5),
                          Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                // White rounded cap di bawah image
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 36,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                ),

                // Back + Favorit buttons
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              shape: BoxShape.circle,
                              boxShadow: AppShadows.card,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                              color: AppColors.text1,
                            ),
                          ),
                        ),

                        // Favorit pill
                        GestureDetector(
                          onTap: () => setState(() => _isFavorit = !_isFavorit),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: AppShadows.card,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _isFavorit
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  size: 18,
                                  color: _isFavorit
                                      ? AppColors.love
                                      : AppColors.text2,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Favorit',
                                  style: AppTextStyles.body14.copyWith(
                                    color: _isFavorit
                                        ? AppColors.love
                                        : AppColors.text1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ── Info Restoran ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama
                  Text(
                    nama,
                    style: AppTextStyles.h1.copyWith(color: AppColors.text1),
                  ),
                  const SizedBox(height: 4),

                  // Kategori
                  Text(
                    kategori,
                    style: AppTextStyles.body14.copyWith(
                      color: AppColors.text2,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Rating + Jarak
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: Color(0xFFFFC107),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating -',
                        style: AppTextStyles.body14.copyWith(
                          color: AppColors.text2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.text2,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        jarak,
                        style: AppTextStyles.body14.copyWith(
                          color: AppColors.text2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Alamat
                  Text(
                    alamat,
                    style: AppTextStyles.body14.copyWith(
                      color: AppColors.text1,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // ── Buka Rute ─────────────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Text(
                        'BUKA RUTE DI MAPS',
                        style: AppTextStyles.body14.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── Tambah Ulasan ─────────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        'TAMBAH ULASAN & FOTO',
                        style: AppTextStyles.body14.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Ulasan Pengunjung ─────────────────────────────────────
                  Text(
                    'Ulasan Pengunjung ($jumlahUlasan)',
                    style: AppTextStyles.h4.copyWith(color: AppColors.text1),
                  ),
                  const SizedBox(height: 16),

                  // Review cards
                  ..._reviews.map((r) => _ReviewCard(review: r)),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Review Card ───────────────────────────────────────────────────────────────

class _ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;
  const _ReviewCard({required this.review});

  void _openPhoto(BuildContext context, List<String> fotos, int startIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) =>
          _PhotoViewerDialog(fotos: fotos, initialIndex: startIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fotos = (review['foto'] as List).cast<String>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: avatar + nama + rating
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.lightGrey2,
                  backgroundImage: NetworkImage(review['avatar'] as String),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    review['nama'] as String,
                    style: AppTextStyles.h5.copyWith(color: AppColors.text1),
                  ),
                ),
                const Icon(
                  Icons.star_rounded,
                  size: 14,
                  color: Color(0xFFFFC107),
                ),
                const SizedBox(width: 4),
                Text(
                  '${review['rating']}',
                  style: AppTextStyles.body14.copyWith(color: AppColors.text2),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Teks ulasan
            Text(
              review['teks'] as String,
              style: AppTextStyles.body14.copyWith(
                color: AppColors.text2,
                height: 1.5,
              ),
            ),

            // Foto-foto ulasan — tap untuk buka fullscreen
            if (fotos.isNotEmpty) ...[
              const SizedBox(height: 10),
              Row(
                children: fotos.asMap().entries.map((entry) {
                  final i = entry.key;
                  final url = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => _openPhoto(context, fotos, i),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          url,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            width: 80,
                            height: 80,
                            color: AppColors.lightGrey2,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Photo Viewer Dialog ───────────────────────────────────────────────────────

class _PhotoViewerDialog extends StatefulWidget {
  final List<String> fotos;
  final int initialIndex;

  const _PhotoViewerDialog({required this.fotos, required this.initialIndex});

  @override
  State<_PhotoViewerDialog> createState() => _PhotoViewerDialogState();
}

class _PhotoViewerDialogState extends State<_PhotoViewerDialog> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          // ── PageView foto ────────────────────────────────────────────────
          PageView.builder(
            controller: _pageController,
            itemCount: widget.fotos.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, i) {
              return Center(
                child: InteractiveViewer(
                  child: Image.network(
                    widget.fotos[i],
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const Icon(
                      Icons.broken_image_rounded,
                      color: Colors.white54,
                      size: 64,
                    ),
                  ),
                ),
              );
            },
          ),

          // ── Tombol tutup (X) ─────────────────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            right: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

          // ── Indikator halaman (dots) — hanya jika > 1 foto ───────────────
          if (widget.fotos.length > 1)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 24,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.fotos.length, (i) {
                  final isActive = i == _currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primary
                          : Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),

          // ── Swipe hint (hanya muncul jika > 1 foto) ──────────────────────
          if (widget.fotos.length > 1 && _currentIndex == 0)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.swipe_rounded,
                        color: Colors.white70,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Geser untuk foto lainnya',
                        style: AppTextStyles.body12.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
