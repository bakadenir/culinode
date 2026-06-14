import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Sembunyikan system navigation bar (3 tombol bawah)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: _NoOverscroll(),
      home: SplashScreen(),
    ),
  );
}

/// Nonaktifkan efek stretch/glow saat overscroll di semua platform.
class _NoOverscroll extends ScrollBehavior {
  const _NoOverscroll();

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // tidak ada indikator sama sekali
  }
}
