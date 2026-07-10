import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../core/theme/typography.dart';
import '../core/theme/shadows.dart';
import '../core/user_profile.dart';
import 'restoran_detail_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../models/restoran_model.dart';
import '../providers/restoran_provider.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  String _currentLocation = 'Sedang mencari lokasi...';

  @override
  void initState() {
    super.initState();
    _determinePosition();
    Future.microtask(() => Provider.of<RestoranProvider>(context, listen: false).fetchRestorans());
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) setState(() => _currentLocation = 'Layanan lokasi nonaktif');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) setState(() => _currentLocation = 'Izin lokasi ditolak');
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      if (mounted) setState(() => _currentLocation = 'Izin lokasi ditolak permanen');
      return;
    } 

    Position position = await Geolocator.getCurrentPosition();
    if (mounted) {
      setState(() {
        _currentLocation = '${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
      });
    }
  }

  // ── Daftar Kategori ────────────────────────────────────────────────────────
  final List<String> _categories = [
    'Semua',
    'Nasi Goreng',
    'Mie Ayam',
    'Aneka Roti',
    'Cepat Saji',
  ];
  int _selectedCategoryIndex = 0;

  // awal 8 item, tiap load +6
  static const int _initialCount = 8;
  static const int _loadStep = 6;
  int _visibleCount = _initialCount;
  bool _isLoadingMore = false;

  void _loadMore(int totalItems) async {
    setState(() => _isLoadingMore = true);
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      _isLoadingMore = false;
      _visibleCount = (_visibleCount + _loadStep).clamp(0, totalItems);
    });
  }

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
                                _currentLocation,
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
                      Consumer<RestoranProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return const SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.all(32.0),
                                child: Center(child: CircularProgressIndicator()),
                              ),
                            );
                          }

                          final restorans = provider.restorans;
                          if (restorans.isEmpty) {
                            return const SliverToBoxAdapter(
                              child: Center(child: Text('Tidak ada restoran')),
                            );
                          }

                          final visibleRestorans = restorans.take(_visibleCount).toList();

                          return SliverPadding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                            sliver: SliverGrid(
                              gridDelegate: _gridDelegate,
                              delegate: SliverChildBuilderDelegate(
                                (context, i) => _BerandaCard(
                                  item: visibleRestorans[i],
                                  onToggleFavorit: () => provider.toggleFavorit(i),
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => RestoranDetailScreen(
                                        restoran: visibleRestorans[i],
                                      ),
                                    ),
                                  ),
                                ),
                                childCount: visibleRestorans.length,
                              ),
                            ),
                          );
                        },
                      ),

                      // ── Load More footer ───────────────────────────────────
                      Consumer<RestoranProvider>(
                        builder: (context, provider, child) {
                          final hasMore = _visibleCount < provider.restorans.length;
                          if (provider.isLoading || provider.restorans.isEmpty) {
                            return const SliverToBoxAdapter(child: SizedBox());
                          }

                          return SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                              child: !hasMore
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
                                      onTap: _isLoadingMore ? null : () => _loadMore(provider.restorans.length),
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
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                            ),
                          );
                        },
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
  final RestoranModel item;
  final VoidCallback onToggleFavorit;
  final VoidCallback? onTap;

  const _BerandaCard({
    required this.item,
    required this.onToggleFavorit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavorit = item.favorit;
    final String gambar = item.gambar;

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
                      item.nama,
                      style: AppTextStyles.h5.copyWith(color: AppColors.text1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.kategori,
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
                          '${item.rating} -',
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
                          item.jarak,
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
