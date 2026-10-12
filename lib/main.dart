import 'package:flutter/material.dart';

import 'landing_colors.dart';
import 'landing_page.dart';

void main() => runApp(const MaabLandingApp());

class MaabLandingApp extends StatelessWidget {
  const MaabLandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مآب | Maab',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      theme: ThemeData(
        fontFamily: 'Amiri Quran',
        colorScheme: ColorScheme.fromSeed(
          seedColor: LandingColors.maabGreen,
          brightness: Brightness.dark,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
