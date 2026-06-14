import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/theme/shadows.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  bool _isLoadingMore = false;
  bool _hasMore = true;

  final List<Map<String, dynamic>> _items = [
    {
      'nama': 'Donat Bahagiat',
      'kategori': 'Kue & Roti',
      'rating': 4.5,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Seporsi Mie Kari',
      'kategori': 'Mie & Bakso',
      'rating': 4.7,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Kopi Calf Cipete',
      'kategori': 'Kafe & Kopi',
      'rating': 4.5,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Oma Frieda',
      'kategori': 'Restoran',
      'rating': 4.8,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Soes Surgawi',
      'kategori': 'Kue & Roti',
      'rating': 5.0,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Nasi Goreng Kambing',
      'kategori': 'Nasi & Lauk',
      'rating': 4.6,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Es Teh Tarik',
      'kategori': 'Minuman',
      'rating': 4.3,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Ayam Bakar Taliwang',
      'kategori': 'Ayam & Bebek',
      'rating': 4.9,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Sate Padang Ajo Ramon',
      'kategori': 'Sate & Grill',
      'rating': 4.7,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?auto=format&fit=crop&w=400&q=80',
    },
    {
      'nama': 'Pisang Goreng Madu',
      'kategori': 'Jajanan Pasar',
      'rating': 4.4,
      'favorit': true,
      'gambar':
          'https://images.unsplash.com/photo-1571091718767-18b5b1457add?auto=format&fit=crop&w=400&q=80',
    },
  ];

  void _toggleFavorit(int index) {
    setState(() {
      _items[index] = {
        ..._items[index],
        'favorit': !(_items[index]['favorit'] as bool),
      };
    });
  }

  void _loadMore() async {
    setState(() => _isLoadingMore = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoadingMore = false;
      _hasMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ── App Bar ───────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Favorit Saya',
                  style: AppTextStyles.h2.copyWith(color: AppColors.white),
                ),
              ),
            ),

            // ── White body ────────────────────────────────────────────────────
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
                  child: Stack(
                    children: [
                      // ── Scrollable content ────────────────────────────────
                      CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                            sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => _FavoritCard(
                                  item: _items[index],
                                  onToggleFavorit: () => _toggleFavorit(index),
                                ),
                                childCount: _items.length,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.82,
                                  ),
                            ),
                          ),

                          // ── Load More footer (inside scroll) ─────────────
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                24,
                                28,
                                24,
                                32,
                              ),
                              child: _hasMore
                                  ? GestureDetector(
                                      onTap: _isLoadingMore ? null : _loadMore,
                                      child: Center(
                                        child: _isLoadingMore
                                            ? SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
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
                                                          color:
                                                              AppColors.primary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        'Semua favorit sudah ditampilkan',
                                        style: AppTextStyles.body14.copyWith(
                                          color: AppColors.text2,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),

                      // ── Shadow fade overlay (hitam tipis, tidak scroll) ───
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 32,
                        child: IgnorePointer(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0x18000000), Color(0x00000000)],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ], // ← closes Stack children
                  ), // ← closes Stack
                ), // ← closes ClipRRect
              ), // ← closes Container
            ), // ← closes Expanded
          ], // ← closes Column children
        ), // ← closes Column
      ), // ← closes SafeArea
    ); // ← closes Scaffold
  }
}

// ── Favorit Card ──────────────────────────────────────────────────────────────

class _FavoritCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onToggleFavorit;

  const _FavoritCard({required this.item, required this.onToggleFavorit});

  @override
  Widget build(BuildContext context) {
    final bool isFavorit = item['favorit'] as bool;
    final String? gambar = item['gambar'] as String?;

    return Container(
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
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  gambar != null
                      ? (gambar.startsWith('http')
                            ? Image.network(
                                gambar,
                                fit: BoxFit.cover,
                                errorBuilder: (_, _, _) => Container(
                                  color: AppColors.lightGrey2,
                                  child: const Icon(
                                    Icons.restaurant_rounded,
                                    size: 40,
                                    color: AppColors.text2,
                                  ),
                                ),
                              )
                            : Image.asset(gambar, fit: BoxFit.cover))
                      : Container(
                          color: AppColors.lightGrey2,
                          child: const Icon(
                            Icons.restaurant_rounded,
                            size: 40,
                            color: AppColors.text2,
                          ),
                        ),
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
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(scale: animation, child: child),
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
                        '${item['rating']}',
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
    );
  }
}
