import 'package:flutter/material.dart';

import 'landing_colors.dart';
import 'landing_page.dart';
import 'landing_settings.dart';

void main() => runApp(MaabLandingApp(settings: LandingSettings()));

class MaabLandingApp extends StatelessWidget {
  const MaabLandingApp({super.key, required this.settings});

  final LandingSettings settings;

  @override
  Widget build(BuildContext context) {
    return LandingSettingsScope(
      notifier: settings,
      child: ListenableBuilder(
        listenable: settings,
        builder: (context, _) => MaterialApp(
          title: 'مآب | Maab',
          debugShowCheckedModeBanner: false,
          builder: (context, child) => Directionality(
            textDirection: settings.arabic ? TextDirection.rtl : TextDirection.ltr,
            child: child!,
          ),
          theme: ThemeData(
            fontFamily: 'Amiri Quran',
            colorScheme: ColorScheme.fromSeed(
              seedColor: LandingColors.maabGreen,
              brightness: settings.dark ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const LandingPage(),
        ),
      ),
    );
  }
}
