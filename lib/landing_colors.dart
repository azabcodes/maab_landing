import 'package:flutter/material.dart';

import 'landing_settings.dart';

/// The Maab app's brand colors (`maab/lib/src/core/resources/colors/app_colors.dart`).
abstract final class LandingColors {
  static const Color maabGreen = Color(0xFF003F35);
  static const Color forestGreen = Color(0xFF0F5D4B);
  static const Color ink = Color(0xFF01201A);
  static const Color cream = Color(0xFFF7EFDF);
  static const Color linen = Color(0xFFF2EBD7);
  static const Color parchment = Color(0xFFE9E1C9);
  static const Color paperWhite = Color(0xFFFFFDF6);
  static const Color richGold = Color(0xFFD4AF37);
  static const Color paleGold = Color(0xFFE5D19A);
  static const Color deepGold = Color(0xFF9F7F32);
  static const Color goldGlow = Color(0xFFF6E7BB);
}

/// The page's colors for the theme picked.
class LandingPalette {
  const LandingPalette._({
    required this.background,
    required this.title,
    required this.subtitle,
    required this.chipBackground,
    required this.chipBorder,
    required this.chipText,
    required this.pattern,
    required this.muted,
    required this.mutedBackground,
    required this.footer,
  });

  final List<Color> background;
  final Color title;
  final Color subtitle;
  final Color chipBackground;
  final Color chipBorder;
  final Color chipText;
  final Color pattern;
  final Color muted;
  final Color mutedBackground;
  final Color footer;

  static LandingPalette of(BuildContext context) =>
      LandingSettings.of(context).dark ? dark : light;

  static final dark = LandingPalette._(
    background: const [LandingColors.forestGreen, LandingColors.maabGreen, LandingColors.ink],
    title: LandingColors.cream,
    subtitle: LandingColors.paleGold.withValues(alpha: 0.85),
    chipBackground: LandingColors.ink.withValues(alpha: 0.35),
    chipBorder: LandingColors.paleGold.withValues(alpha: 0.25),
    chipText: LandingColors.cream,
    pattern: LandingColors.paleGold.withValues(alpha: 0.05),
    muted: LandingColors.paleGold.withValues(alpha: 0.7),
    mutedBackground: LandingColors.ink.withValues(alpha: 0.35),
    footer: LandingColors.cream.withValues(alpha: 0.45),
  );

  static final light = LandingPalette._(
    background: const [LandingColors.paperWhite, LandingColors.cream, LandingColors.parchment],
    title: LandingColors.maabGreen,
    subtitle: LandingColors.deepGold,
    chipBackground: LandingColors.paperWhite.withValues(alpha: 0.8),
    chipBorder: LandingColors.deepGold.withValues(alpha: 0.3),
    chipText: LandingColors.maabGreen,
    pattern: LandingColors.maabGreen.withValues(alpha: 0.06),
    muted: LandingColors.maabGreen.withValues(alpha: 0.65),
    mutedBackground: LandingColors.paperWhite.withValues(alpha: 0.6),
    footer: LandingColors.maabGreen.withValues(alpha: 0.5),
  );
}
