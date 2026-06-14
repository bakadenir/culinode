import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/theme/shadows.dart';
import 'core/user_profile.dart';
import 'restoran_detail_screen.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  // ── Dummy Categories ────────────────────────────────────────────────────────
  final List<String> _categories = [
    'Semua',
    'Nasi Goreng',
    'Mie Ayam',
    'Aneka Roti',
    'Cepat Saji',
  ];
  int _selectedCategoryIndex = 0;

  // ── 22 dummy restoran dalam jangkauan ≤ 2 km ─────────────────────────────────
  final List<Map<String, dynamic>> _allItems = [
    {
      'nama': 'Donat Bahagiat',
      'kategori': 'Kue & Roti',
      'rating': 4.5,
      'jarak': '0.8 km',
      'gambar':
          'https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Seporsi Mie Kari',
      'kategori': 'Mie & Bakso',
      'rating': 4.7,
      'jarak': '1.2 km',
      'gambar':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=400&q=80',
      'favorit': true,
    },
    {
      'nama': 'Soes Surgawi',
      'kategori': 'Kue & Roti',
      'rating': 5.0,
      'jarak': '0.5 km',
      'gambar':
          'https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Nasi Goreng Kambing',
      'kategori': 'Nasi & Lauk',
      'rating': 4.6,
      'jarak': '1.7 km',
      'gambar':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Es Teh Tarik',
      'kategori': 'Minuman',
      'rating': 4.3,
      'jarak': '0.3 km',
      'gambar':
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Sate Padang Ajo Ramon',
      'kategori': 'Sate & Grill',
      'rating': 4.7,
      'jarak': '1.9 km',
      'gambar':
          'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Pisang Goreng Madu',
      'kategori': 'Jajanan Pasar',
      'rating': 4.4,
      'jarak': '0.6 km',
      'gambar':
          'https://images.unsplash.com/photo-1571091718767-18b5b1457add?auto=format&fit=crop&w=400&q=80',
      'favorit': true,
    },
    {
      'nama': 'Warung Bu Tini',
      'kategori': 'Nasi & Lauk',
      'rating': 4.5,
      'jarak': '1.1 km',
      'gambar':
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    // Batch 2 (+6)
    {
      'nama': 'Bakso Malang Cak Man',
      'kategori': 'Mie & Bakso',
      'rating': 4.8,
      'jarak': '0.9 km',
      'gambar':
          'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Kopi Kenangan',
      'kategori': 'Kafe & Kopi',
      'rating': 4.2,
      'jarak': '1.4 km',
      'gambar':
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Gado-gado Bonbin',
      'kategori': 'Sayur & Sehat',
      'rating': 4.6,
      'jarak': '0.7 km',
      'gambar':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Pecel Lele Lamongan',
      'kategori': 'Ayam & Bebek',
      'rating': 4.3,
      'jarak': '1.8 km',
      'gambar':
          'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Martabak Pecenongan',
      'kategori': 'Jajanan Pasar',
      'rating': 4.9,
      'jarak': '0.4 km',
      'gambar':
          'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?auto=format&fit=crop&w=400&q=80',
      'favorit': true,
    },
    {
      'nama': 'Soto Ayam Ambengan',
      'kategori': 'Sup & Soto',
      'rating': 4.7,
      'jarak': '1.6 km',
      'gambar':
          'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    // Batch 3 (+6)
    {
      'nama': 'Bubur Ayam Barito',
      'kategori': 'Bubur & Sarapan',
      'rating': 4.5,
      'jarak': '0.2 km',
      'gambar':
          'https://images.unsplash.com/photo-1585325701960-68d13f9f21dc?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Ayam Geprek Bu Rum',
      'kategori': 'Ayam & Bebek',
      'rating': 4.8,
      'jarak': '1.3 km',
      'gambar':
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Rujak Cingur Surabaya',
      'kategori': 'Sayur & Sehat',
      'rating': 4.4,
      'jarak': '1.0 km',
      'gambar':
          'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Nasi Uduk Kebon Kacang',
      'kategori': 'Nasi & Lauk',
      'rating': 4.6,
      'jarak': '1.5 km',
      'gambar':
          'https://images.unsplash.com/photo-1596797038530-2c107229654b?auto=format&fit=crop&w=400&q=80',
      'favorit': true,
    },
    {
      'nama': 'Siomay Bandung Pak Yana',
      'kategori': 'Jajanan Pasar',
      'rating': 4.3,
      'jarak': '0.9 km',
      'gambar':
          'https://images.unsplash.com/photo-1496116218417-1a781b1c416c?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Tahu Gejrot Cirebon',
      'kategori': 'Jajanan Pasar',
      'rating': 4.5,
      'jarak': '1.8 km',
      'gambar':
          'https://images.unsplash.com/photo-1565557623262-b51c2513a641?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Gudeg Yu Djum',
      'kategori': 'Nasi & Lauk',
      'rating': 4.9,
      'jarak': '0.8 km',
      'gambar':
          'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
    {
      'nama': 'Pempek Candy Palembang',
      'kategori': 'Jajanan Pasar',
      'rating': 4.7,
      'jarak': '1.1 km',
      'gambar':
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80',
      'favorit': false,
    },
  ];

  // awal 8 item, tiap load +6
  static const int _initialCount = 8;
  static const int _loadStep = 6;
  int _visibleCount = _initialCount;
  bool _isLoadingMore = false;

  void _loadMore() async {
    setState(() => _isLoadingMore = true);
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      _isLoadingMore = false;
      _visibleCount = (_visibleCount + _loadStep).clamp(0, _allItems.length);
    });
  }

  bool get _hasMore => _visibleCount < _allItems.length;

  void _toggleFavorit(int index) => setState(
    () => _allItems[index]['favorit'] = !(_allItems[index]['favorit'] as bool),
  );

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 0.82,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ── Orange Header ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey, Deni !',
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Jl. Sawo II, 12150, Jakarta Selatan',
                                style: AppTextStyles.body12.copyWith(
                                  color: AppColors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 37.5,
                    backgroundColor: AppColors.lightGrey2,
                    backgroundImage: UserProfile.instance.foto != null
                        ? AssetImage(UserProfile.instance.foto!)
                        : null,
                    child: UserProfile.instance.foto == null
                        ? const Icon(
                            Icons.person_rounded,
                            size: 32,
                            color: AppColors.text2,
                          )
                        : null,
                  ),
                ],
              ),
            ),

            // ── White body ──────────────────────────────────────────────────
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      // ── Search + Categories + Title ───────────────────────
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32),
                            // Search Bar
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(26),
                                  boxShadow: AppShadows.card,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.search,
                                      color: AppColors.text2,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText:
                                              'Cari resto, menu, lokasi...',
                                          hintStyle: AppTextStyles.body14
                                              .copyWith(color: AppColors.text2),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                          isDense: true,
                                        ),
                                        style: AppTextStyles.body14.copyWith(
                                          color: AppColors.text1,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Categories
                            SizedBox(
                              height: 36,
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: _categories.length,
                                separatorBuilder: (_, _) =>
                                    const SizedBox(width: 12),
                                itemBuilder: (context, index) {
                                  final isActive =
                                      index == _selectedCategoryIndex;
                                  return GestureDetector(
                                    onTap: () => setState(
                                      () => _selectedCategoryIndex = index,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? AppColors.primary
                                            : AppColors.primary.withValues(
                                                alpha: 0.12,
                                              ),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        _categories[index],
                                        style: AppTextStyles.body14.copyWith(
                                          color: isActive
                                              ? AppColors.white
                                              : AppColors.primary,
                                          fontWeight: isActive
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Text(
                                'Terdekat & Populer',
                                style: AppTextStyles.h4.copyWith(
                                  color: AppColors.text1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      // ── Grid items ────────────────────────────────────────
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                        sliver: SliverGrid(
                          gridDelegate: _gridDelegate,
                          delegate: SliverChildBuilderDelegate(
                            (context, i) => _BerandaCard(
                              item: _allItems[i],
                              onToggleFavorit: () => _toggleFavorit(i),
                              // hanya 2 item pertama yang bisa di-klik
                              onTap: i < 2
                                  ? () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RestoranDetailScreen(
                                          restoran: _allItems[i],
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            childCount: _visibleCount,
                          ),
                        ),
                      ),

                      // ── Load More footer ───────────────────────────────────
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                          child: !_hasMore
                              ? Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.location_off_rounded,
                                        size: 20,
                                        color: AppColors.text2,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Tidak ada lagi restoran\ndalam radius 2 km dari lokasimu',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.body14.copyWith(
                                          color: AppColors.text2,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : GestureDetector(
                                  onTap: _isLoadingMore ? null : _loadMore,
                                  child: Center(
                                    child: _isLoadingMore
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.primary,
                                            ),
                                          )
                                        : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.expand_more_rounded,
                                                size: 18,
                                                color: AppColors.primary,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                'Muat Lebih Banyak',
                                                style: AppTextStyles.body14
                                                    .copyWith(
                                                      color: AppColors.primary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Card Widget ───────────────────────────────────────────────────────────────

class _BerandaCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onToggleFavorit;
  final VoidCallback? onTap;

  const _BerandaCard({
    required this.item,
    required this.onToggleFavorit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavorit = item['favorit'] as bool;
    final String? gambar = item['gambar'] as String?;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.card,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Gambar + tombol hati overlay ────────────────────────────
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Gambar / placeholder
                    gambar != null
                        ? (gambar.startsWith('http')
                              ? Image.network(gambar, fit: BoxFit.cover)
                              : Image.asset(gambar, fit: BoxFit.cover))
                        : Container(
                            color: AppColors.lightGrey2,
                            child: const Icon(
                              Icons.restaurant_rounded,
                              size: 40,
                              color: AppColors.text2,
                            ),
                          ),

                    // Tombol hati — pojok kanan atas
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: onToggleFavorit,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: Icon(
                              isFavorit
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              key: ValueKey<bool>(isFavorit),
                              size: 18,
                              color: isFavorit
                                  ? const Color(0xFFE53935)
                                  : AppColors.text2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Nama, Kategori & Rating ──────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['nama'] as String,
                      style: AppTextStyles.h5.copyWith(color: AppColors.text1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['kategori'] as String,
                      style: AppTextStyles.body14.copyWith(
                        color: AppColors.text2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
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
                        const SizedBox(width: 6),
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
            ],
          ),
        ),
      ),
    );
  }
}
