import 'package:flutter/material.dart';

import 'landing_colors.dart';
import 'landing_intro.dart';
import 'landing_logo.dart';
import 'star_pattern_painter.dart';

/// Screens at least this wide put the logo beside the text instead of above it.
const double _wideBreakpoint = 900;

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [LandingColors.forestGreen, LandingColors.maabGreen, LandingColors.ink],
          ),
        ),
        child: CustomPaint(
          painter: const StarPatternPainter(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= _wideBreakpoint;
              return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: wide ? 48 : 20,
                          vertical: wide ? 40 : 28,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            wide ? _wideLayout(constraints) : _narrowLayout(constraints),
                            SizedBox(height: wide ? 48 : 32),
                            const _Footer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _wideLayout(BoxConstraints constraints) {
    final logoSize = [
      constraints.maxHeight * 0.62,
      constraints.maxWidth * 0.38,
    ].reduce((a, b) => a < b ? a : b).clamp(280.0, 480.0);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Row(
        children: [
          const Expanded(child: LandingIntro(wide: true)),
          const SizedBox(width: 48),
          LandingLogo(size: logoSize),
        ],
      ),
    );
  }

  Widget _narrowLayout(BoxConstraints constraints) {
    final logoSize = [
      constraints.maxWidth * 0.72,
      constraints.maxHeight * 0.36,
      340.0,
    ].reduce((a, b) => a < b ? a : b).clamp(180.0, 340.0);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 460),
      child: Column(
        children: [
          LandingLogo(size: logoSize),
          const SizedBox(height: 16),
          const LandingIntro(wide: false),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Text(
      '© ${DateTime.now().year} مآب',
      style: TextStyle(color: LandingColors.cream.withValues(alpha: 0.45), fontSize: 14),
    );
  }
}
