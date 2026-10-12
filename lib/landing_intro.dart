import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_colors.dart';
import 'store_button.dart';

/// The latest APK published by the release workflow of the Maab app.
final Uri androidApkUrl = Uri.parse(
  'https://github.com/azabcodes/maab_releases/releases/latest/download/Maab.apk',
);

const List<(IconData, String)> _features = [
  (Icons.menu_book_rounded, 'المصحف والتفسير'),
  (Icons.mic_rounded, 'تسميع القرآن'),
  (Icons.access_time_rounded, 'مواقيت الصلاة والأذان'),
  (Icons.auto_awesome_rounded, 'الأذكار والتسبيح'),
  (Icons.groups_rounded, 'خطط مع أصحابك'),
];

/// The headline, the features and the download buttons.
class LandingIntro extends StatelessWidget {
  const LandingIntro({super.key, required this.wide});

  final bool wide;

  @override
  Widget build(BuildContext context) {
    final align = wide ? CrossAxisAlignment.start : CrossAxisAlignment.center;
    final textAlign = wide ? TextAlign.start : TextAlign.center;
    final buttons = [
      StoreButton(
        icon: Icons.android_rounded,
        caption: 'حمّل الآن',
        label: 'لأجهزة أندرويد',
        onTap: () => launchUrl(androidApkUrl),
      ),
      const StoreButton(icon: Icons.apple_rounded, caption: 'قريبًا', label: 'على الآيفون'),
    ];

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          'رفيقك اليومي إلى الله',
          textAlign: textAlign,
          style: TextStyle(
            color: LandingColors.cream,
            fontSize: wide ? 54 : 34,
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'كل ما يعينك على يومك مع الله، في تطبيق واحد.',
          textAlign: textAlign,
          style: TextStyle(
            color: LandingColors.paleGold.withValues(alpha: 0.85),
            fontSize: wide ? 22 : 18,
            height: 1.7,
          ),
        ),
        SizedBox(height: wide ? 24 : 18),
        Wrap(
          alignment: wide ? WrapAlignment.start : WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [for (final (icon, label) in _features) _FeatureChip(icon: icon, label: label)],
        ),
        SizedBox(height: wide ? 36 : 28),
        if (wide)
          Wrap(
            spacing: 14,
            runSpacing: 12,
            children: [for (final button in buttons) SizedBox(width: 250, child: button)],
          )
        else
          Column(children: [buttons.first, const SizedBox(height: 12), buttons.last]),
      ],
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: LandingColors.ink.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: LandingColors.paleGold.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: LandingColors.richGold),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: LandingColors.cream, fontSize: 15)),
        ],
      ),
    );
  }
}
