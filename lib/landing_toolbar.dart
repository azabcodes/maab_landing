import 'package:flutter/material.dart';

import 'landing_colors.dart';
import 'landing_settings.dart';
import 'landing_strings.dart';

/// The language and theme switches at the top of the page.
class LandingToolbar extends StatelessWidget {
  const LandingToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = LandingSettings.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ToolbarButton(
          onTap: settings.toggleLanguage,
          child: Text(
            LandingStrings.of(context).otherLanguage,
            style: TextStyle(
              color: LandingPalette.of(context).chipText,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 8),
        _ToolbarButton(
          onTap: settings.toggleTheme,
          child: Icon(
            settings.dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            size: 20,
            color: LandingPalette.of(context).chipText,
          ),
        ),
      ],
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = LandingPalette.of(context);
    return Material(
      color: palette.chipBackground,
      shape: CircleBorder(side: BorderSide(color: palette.chipBorder)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(dimension: 42, child: Center(child: child)),
      ),
    );
  }
}
