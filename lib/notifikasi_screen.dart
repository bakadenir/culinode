import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/widgets/notif_card.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  bool _isLoadingMore = false;
  bool _hasMore = true;

  static const List<_NotifSection> _sections = [
    _NotifSection(label: 'Hari Ini', items: [
      _NotifItem(judul: 'Ulasan Berhasil!', deskripsi: 'Ulasan di Sederhana Padang sudah tayang.', waktu: '10 menit lalu', icon: Icons.camera_alt_rounded),
      _NotifItem(judul: 'Resto Favorit Disimpan', deskripsi: 'Sop Kambing Bang Anen berhasil ditambahkan.', waktu: '2 jam lalu', icon: Icons.favorite_rounded),
    ]),
    _NotifSection(label: 'Minggu Lalu', items: [
      _NotifItem(judul: 'Lapar? Cek Sekitarmu!', deskripsi: 'Ada 3 resto Cepat Saji dalam radius 1 km dari lokasimu.', waktu: '3 hari lalu', icon: Icons.location_on_rounded),
      _NotifItem(judul: 'Ulasan Berhasil!', deskripsi: 'Ulasan kamu di Kopi Calf Cipete sudah berhasil tayang.', waktu: '5 hari lalu', icon: Icons.camera_alt_rounded),
      _NotifItem(judul: 'Resto Favorit Disimpan', deskripsi: 'Oma Frieda Bistro berhasil ditambahkan ke favorit kamu.', waktu: '6 hari lalu', icon: Icons.favorite_rounded),
    ]),
    _NotifSection(label: 'Bulan Lalu', items: [
      _NotifItem(judul: 'Ulasan Berhasil!', deskripsi: 'Ulasan kamu di Restoran Sederhana Padang Jl. Fatmawati No. 12 Jakarta Selatan sudah berhasil tayang dan bisa dilihat oleh pengguna lain.', waktu: '32 hari lalu', icon: Icons.camera_alt_rounded),
      _NotifItem(judul: 'Resto Favorit Disimpan', deskripsi: 'Warung Bebek Goreng Carok Cabang Jakarta Selatan berhasil ditambahkan ke daftar favorit kamu. Kamu bisa menemukannya kapan saja di tab Favorit.', waktu: '35 hari lalu', icon: Icons.favorite_rounded),
      _NotifItem(judul: 'Lapar? Cek Sekitarmu!', deskripsi: 'Kami menemukan 7 restoran baru dalam radius 2 km dari lokasi kamu saat ini di Jl. Sawo II, Cipete, Jakarta Selatan. Yuk coba salah satunya!', waktu: '40 hari lalu', icon: Icons.location_on_rounded),
      _NotifItem(judul: 'Ulasan Berhasil!', deskripsi: 'Ulasan kamu di Mie Kari Aceh Bang Udin sudah tayang dan mendapatkan 3 likes dari pengguna lain.', waktu: '42 hari lalu', icon: Icons.camera_alt_rounded),
      _NotifItem(judul: 'Resto Favorit Disimpan', deskripsi: 'Donat Bahagiat Blok M berhasil ditambahkan. Jangan lupa cek jam buka sebelum berkunjung ya!', waktu: '45 hari lalu', icon: Icons.favorite_rounded),
      _NotifItem(judul: 'Lapar? Cek Sekitarmu!', deskripsi: 'Ada promo spesial di 4 restoran terdekatmu hari ini. Yuk pesan sebelum habis!', waktu: '50 hari lalu', icon: Icons.location_on_rounded),
    ]),
  ];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Text('Notifikasi',
                  style: AppTextStyles.h2.copyWith(color: AppColors.white)),
            ),

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
                      // ── List ─────────────────────────────────────────────
                      ListView.builder(
                        padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                        itemCount: _sections.length + 1,
                        itemBuilder: (context, sIndex) {
                          if (sIndex == _sections.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 28),
                              child: _hasMore
                                  ? GestureDetector(
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
                                                  Icon(Icons.expand_more_rounded,
                                                      size: 18, color: AppColors.primary),
                                                  const SizedBox(width: 4),
                                                  Text('Muat Lebih Banyak',
                                                      style: AppTextStyles.body14.copyWith(
                                                        color: AppColors.primary,
                                                        fontWeight: FontWeight.w600,
                                                      )),
                                                ],
                                              ),
                                      ),
                                    )
                                  : Center(
                                      child: Text('Semua notifikasi sudah ditampilkan',
                                          style: AppTextStyles.body14
                                              .copyWith(color: AppColors.text2)),
                                    ),
                            );
                          }

                          final section = _sections[sIndex];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (sIndex > 0) const SizedBox(height: 28),
                              Text(section.label,
                                  style: AppTextStyles.h4.copyWith(color: AppColors.text1)),
                              const SizedBox(height: 12),
                              ...List.generate(section.items.length, (iIndex) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: iIndex < section.items.length - 1 ? 16 : 0),
                                  child: NotifCard(
                                    icon: section.items[iIndex].icon,
                                    judul: section.items[iIndex].judul,
                                    deskripsi: section.items[iIndex].deskripsi,
                                    waktu: section.items[iIndex].waktu,
                                  ),
                                );
                              }),
                            ],
                          );
                        },
                      ),

                      // ── Shadow fade overlay (hitam tipis, tidak scroll) ───
                      Positioned(
                        top: 0, left: 0, right: 0,
                        height: 32,
                        child: IgnorePointer(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0x18000000), // hitam ~9% opacity
                                  Color(0x00000000),
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

// ── Data Models ───────────────────────────────────────────────────────────────

class _NotifSection {
  final String label;
  final List<_NotifItem> items;
  const _NotifSection({required this.label, required this.items});
}

class _NotifItem {
  final String judul;
  final String deskripsi;
  final String waktu;
  final IconData icon;
  const _NotifItem({
    required this.judul,
    required this.deskripsi,
    required this.waktu,
    required this.icon,
  });
}
