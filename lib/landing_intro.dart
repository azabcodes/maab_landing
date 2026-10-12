import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_colors.dart';
import 'landing_strings.dart';
import 'store_button.dart';

/// The latest APK published by the release workflow of the Maab app.
final Uri androidApkUrl = Uri.parse(
  'https://github.com/azabcodes/maab_releases/releases/latest/download/Maab.apk',
);

/// The headline, the features and the download buttons.
class LandingIntro extends StatelessWidget {
  const LandingIntro({super.key, required this.wide});

  final bool wide;

  @override
  Widget build(BuildContext context) {
    final align = wide ? CrossAxisAlignment.start : CrossAxisAlignment.center;
    final textAlign = wide ? TextAlign.start : TextAlign.center;
    final strings = LandingStrings.of(context);
    final palette = LandingPalette.of(context);
    final features = [
      (Icons.menu_book_rounded, strings.featureMushaf),
      (Icons.mic_rounded, strings.featureTasmee),
      (Icons.access_time_rounded, strings.featurePrayer),
      (Icons.auto_awesome_rounded, strings.featureAdhkar),
      (Icons.groups_rounded, strings.featureCompanions),
    ];
    final buttons = [
      StoreButton(
        icon: Icons.android_rounded,
        caption: strings.downloadNow,
        label: strings.forAndroid,
        onTap: () => launchUrl(androidApkUrl),
      ),
      StoreButton(icon: Icons.apple_rounded, caption: strings.comingSoon, label: strings.onIphone),
    ];

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          strings.headline,
          textAlign: textAlign,
          style: TextStyle(
            color: palette.title,
            fontSize: wide ? 54 : 34,
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          strings.description,
          textAlign: textAlign,
          style: TextStyle(
            color: palette.subtitle,
            fontSize: wide ? 22 : 18,
            height: 1.7,
          ),
        ),
        SizedBox(height: wide ? 24 : 18),
        Wrap(
          alignment: wide ? WrapAlignment.start : WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [for (final (icon, label) in features) _FeatureChip(icon: icon, label: label)],
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
    final palette = LandingPalette.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: palette.chipBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: palette.chipBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: LandingColors.richGold),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: palette.chipText, fontSize: 15)),
        ],
      ),
    );
  }
}
