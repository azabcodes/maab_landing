import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_colors.dart';
import 'store_button.dart';

/// The latest APK published by the release workflow of the Maab app.
final Uri androidApkUrl = Uri.parse(
  'https://github.com/azabcodes/maab_releases/releases/latest/download/Maab.apk',
);

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final logoSize = (size.shortestSide * 0.62).clamp(200.0, 360.0);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.35),
            radius: 1.1,
            colors: [LandingColors.forestGreen, LandingColors.maabGreen, LandingColors.ink],
            stops: [0, 0.5, 1],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Logo(size: logoSize),
                    const SizedBox(height: 12),
                    const Text(
                      'رفيقك اليومي إلى الله',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: LandingColors.cream,
                        fontSize: 26,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'قرآن · أذكار · مواقيت الصلاة · تسميع',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: LandingColors.paleGold.withValues(alpha: 0.8),
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 36),
                    StoreButton(
                      icon: Icons.android_rounded,
                      caption: 'حمّل الآن',
                      label: 'لأجهزة أندرويد',
                      onTap: () => launchUrl(androidApkUrl),
                    ),
                    const SizedBox(height: 14),
                    const StoreButton(
                      icon: Icons.apple_rounded,
                      caption: 'قريبًا',
                      label: 'على الآيفون',
                    ),
                    const SizedBox(height: 48),
                    Text(
                      '© ${DateTime.now().year} مآب',
                      style: TextStyle(
                        color: LandingColors.cream.withValues(alpha: 0.45),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The logo floating slowly over a soft gold glow.
class _Logo extends StatefulWidget {
  const _Logo({required this.size});

  final double size;

  @override
  State<_Logo> createState() => _LogoState();
}

class _LogoState extends State<_Logo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  LandingColors.richGold.withValues(alpha: 0.28),
                  LandingColors.richGold.withValues(alpha: 0),
                ],
              ),
            ),
            child: SizedBox.square(dimension: widget.size),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, -8 * Curves.easeInOut.transform(_controller.value)),
              child: child,
            ),
            child: Image.asset(
              'assets/logo.png',
              width: widget.size * 0.88,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ],
      ),
    );
  }
}
