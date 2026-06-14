import 'package:flutter/material.dart';
import 'core/widgets/app_bottom_nav_bar.dart';
import 'core/theme/colors.dart';
import 'profil_screen.dart';
import 'favorit_screen.dart';
import 'notifikasi_screen.dart';
import 'beranda_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _switchTab(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    // Pages dibuat di build agar bisa passing callback ke ProfilScreen
    final pages = [
      const BerandaScreen(),
      const FavoritScreen(),
      const NotifikasiScreen(),
      _ProfilPage(onSwitchTab: _switchTab),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _switchTab,
      ),
    );
  }
}

class _ProfilPage extends StatelessWidget {
  final ValueChanged<int> onSwitchTab;
  const _ProfilPage({required this.onSwitchTab});

  @override
  Widget build(BuildContext context) {
    return ProfilScreen(onSwitchTab: onSwitchTab);
  }
}
