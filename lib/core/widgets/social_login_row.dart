import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Baris ikon sosial login (Facebook, Twitter, Google)
/// Ukuran: 50×50 px per ikon, gap horizontal 24 px
class SocialLoginRow extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onTwitterTap;

  const SocialLoginRow({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onTwitterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(asset: 'assets/facebook.svg', onTap: onFacebookTap),
        const SizedBox(width: 24),
        _SocialButton(asset: 'assets/twitter.svg', onTap: onTwitterTap),
        const SizedBox(width: 24),
        _SocialButton(asset: 'assets/google.svg', onTap: onGoogleTap),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String asset;
  final VoidCallback? onTap;

  const _SocialButton({required this.asset, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        asset,
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}
