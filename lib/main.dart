import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'views/splash_screen.dart';
import 'providers/restoran_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Sembunyikan system navigation bar (3 tombol bawah)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestoranProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: _NoOverscroll(),
        home: SplashScreen(),
      ),
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
