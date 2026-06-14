import 'package:flutter/material.dart';
import 'package:culinode/daftar_screen.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/widgets/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  /// Halaman onboarding 1–3
  final List<OnboardingContent> _pages = const [
    OnboardingContent(
      image: 'assets/images/onboard_1.png',
      title: 'Temukan Kuliner Terdekat',
      description:
          'Dapatkan rekomendasi tempat makan hingga kedai kopi spesial terbaik di sekitarmu secara akurat',
    ),
    OnboardingContent(
      image: 'assets/images/onboard_2.png',
      title: 'Simpan Tempat Favoritmu',
      description:
          'Jangan sampai lupa tempat nongkrong atau restoran andalan. Masukkan ke daftar favorit dan kunjungi kapan saja',
    ),
    OnboardingContent(
      image: 'assets/images/onboard_3.png',
      title: 'Bagikan Pengalamanmu',
      description:
          'Potret momen kulinermu, tulis ulasan jujur, dan jadikan referensi bermanfaat bagi pencinta kuliner lainnya',
    ),
  ];

  void _goToNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DaftarScreen()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar: Back (halaman 2 & 3) + Lewati (halaman 1 & 2) ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back button — hanya halaman 2 & 3
                  if (_currentPage > 0)
                    GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const SizedBox(
                        height: 20,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: AppColors.text1,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 19, height: 19),

                  // Lewati — hanya halaman 1 & 2
                  if (_currentPage < _pages.length - 1)
                    GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          _pages.length - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: SizedBox(
                        height: 19,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Lewati',
                              style: AppTextStyles.body16.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 19, height: 19),
                ],
              ),
            ),

            // ── Halaman content (swipeable) ──
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gambar/illustrasi onboarding — selebar text
                        Image.asset(
                          page.image,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (_, _, _) => Container(
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey2,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.image_outlined,
                              size: 64,
                              color: AppColors.text2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          page.title,
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 26),
                        Text(
                          page.description,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            height: 1.5,
                            color: AppColors.text2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 26),
                        // Indicator dots — langsung di bawah text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_pages.length, (index) {
                            final isActive = index == _currentPage;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 7.5,
                              ),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.text2
                                    : Colors.transparent,
                                border: Border.all(
                                  color: AppColors.text2,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ── Button ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  // Button Next / Mulai
                  PrimaryButton(
                    text: _currentPage == _pages.length - 1
                        ? 'mulai'
                        : 'selanjutnya',
                    onPressed: _goToNext,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Model data untuk konten onboarding
class OnboardingContent {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}
