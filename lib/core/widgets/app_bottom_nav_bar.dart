import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

/// Reusable Bottom Navigation Bar — Culinode
/// Background : AppColors.lightGrey2
/// Active     : AppColors.primary  |  Inactive: AppColors.text2
/// Icon size  : 24×24 (lebar menyesuaikan)
/// Gap icon–label : 8px
/// Padding all    : 15px
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItem(
      label: 'Beranda',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
    ),
    _NavItem(
      label: 'Favorit',
      icon: Icons.favorite_border_rounded,
      activeIcon: Icons.favorite_rounded,
    ),
    _NavItem(
      label: 'Notifikasi',
      icon: Icons.notifications_none_rounded,
      activeIcon: Icons.notifications_rounded,
    ),
    _NavItem(
      label: 'Profil',
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightGrey2,
        border: Border(
          top: BorderSide(color: AppColors.lightGrey1, width: 1),
        ),
      ),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 36),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            return _AnimatedNavButton(
              item: _items[index],
              isActive: index == currentIndex,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

// ── Animated Nav Button ───────────────────────────────────────────────────────

class _AnimatedNavButton extends StatefulWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _AnimatedNavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_AnimatedNavButton> createState() => _AnimatedNavButtonState();
}

class _AnimatedNavButtonState extends State<_AnimatedNavButton>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;

  void _onTapDown(_) => setState(() => _pressed = true);
  void _onTapUp(_) => setState(() => _pressed = false);
  void _onTapCancel() => setState(() => _pressed = false);

  @override
  Widget build(BuildContext context) {
    final color = widget.isActive ? AppColors.primary : AppColors.text2;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon: scale bounce saat press + animasi switch outline ↔ filled
          AnimatedScale(
            scale: _pressed ? 0.82 : 1.0,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOut,
            child: AnimatedSwitcher(
              duration: widget.isActive 
                  ? const Duration(milliseconds: 220)
                  : Duration.zero,
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: FadeTransition(opacity: animation, child: child),
              ),
              child: Icon(
                widget.isActive ? widget.item.activeIcon : widget.item.icon,
                key: ValueKey(widget.isActive),
                size: 24,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Label: hanya warna berubah, tidak ada animasi gerak
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            style: AppTextStyles.body14.copyWith(
              color: color,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
            ),
            child: Text(widget.item.label),
          ),
        ],
      ),
    );
  }
}

// ── Nav Item Data ─────────────────────────────────────────────────────────────

class _NavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
