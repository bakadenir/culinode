import 'package:flutter/material.dart';
import 'core/theme/colors.dart';
import 'core/theme/typography.dart';
import 'core/theme/shadows.dart';
import 'core/user_profile.dart';
import 'edit_profil_screen.dart';
import 'onboarding_screen.dart';
import 'riwayat_ulasan_screen.dart';

class ProfilScreen extends StatelessWidget {
  final ValueChanged<int>? onSwitchTab;
  const ProfilScreen({super.key, this.onSwitchTab});

  static const double _cardHeight  = 104;
  static const double _cardOverlap = _cardHeight / 2;

  UserProfile get _p => UserProfile.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Orange header (title) ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Text(
                'Profil Saya',
                style: AppTextStyles.h2.copyWith(color: AppColors.white),
              ),
            ),


            // ── White body — kartu profil overlap ke atas ─────────────────
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kartu profil di dalam white body
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                          child: _buildProfileCard(context),
                        ),
                        const SizedBox(height: 24),
                        _buildMenuList(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Profile card ──────────────────────────────────────────────────────────
  Widget _buildProfileCard(BuildContext context) {
    return Container(
      height: _cardHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.card,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.lightGrey1,
              backgroundImage: _p.foto != null ? AssetImage(_p.foto!) : null,
              child: _p.foto == null
                  ? const Icon(Icons.person_rounded, size: 36, color: AppColors.text2)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_p.nama,
                      style: AppTextStyles.h4.copyWith(color: AppColors.text1)),
                  const SizedBox(height: 4),
                  Text(_p.email,
                      style: AppTextStyles.body14.copyWith(color: AppColors.text2)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditProfilScreen(
                    nama: _p.nama,
                    email: _p.email,
                  ),
                ),
              ),
              child: const Icon(Icons.edit_square, size: 22, color: AppColors.text2),
            ),
          ],
        ),
      ),
    );
  }

  // ── Menu list ─────────────────────────────────────────────────────────────
  Widget _buildMenuList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _MenuItem(
            icon: Icons.calendar_today_outlined,
            label: 'Riwayat Ulasan',
            showChevron: true,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RiwayatUlasanScreen()),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.lightGrey1),
          _MenuItem(
            icon: Icons.logout_rounded,
            label: 'Keluar',
            showChevron: false,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                (route) => false,
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.lightGrey1),
        ],
      ),
    );
  }
}

// ── Menu Item ─────────────────────────────────────────────────────────────────

class _MenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool showChevron;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.showChevron,
    required this.onTap,
  });

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        opacity: _pressed ? 0.5 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              Icon(widget.icon, size: 22, color: AppColors.text2),
              const SizedBox(width: 16),
              Expanded(
                child: Text(widget.label,
                    style: AppTextStyles.h5.copyWith(color: AppColors.text1)),
              ),
              if (widget.showChevron)
                const Icon(Icons.chevron_right_rounded,
                    size: 22, color: AppColors.text2),
            ],
          ),
        ),
      ),
    );
  }
}
