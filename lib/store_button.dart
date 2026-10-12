import 'package:flutter/material.dart';

import 'landing_colors.dart';

/// A download button: gold when [onTap] is set, a muted outline ("coming soon") otherwise.
class StoreButton extends StatefulWidget {
  const StoreButton({
    super.key,
    required this.icon,
    required this.caption,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String caption;
  final String label;
  final VoidCallback? onTap;

  @override
  State<StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<StoreButton> {
  bool _hovered = false;

  bool get _enabled => widget.onTap != null;

  @override
  Widget build(BuildContext context) {
    final foreground = _enabled ? LandingColors.ink : LandingColors.paleGold.withValues(alpha: 0.7);

    return MouseRegion(
      cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _enabled && _hovered ? 1.03 : 1,
          duration: const Duration(milliseconds: 160),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            height: 68,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: _enabled
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [LandingColors.goldGlow, LandingColors.richGold, LandingColors.deepGold],
                    )
                  : null,
              color: _enabled ? null : LandingColors.ink.withValues(alpha: 0.35),
              border: Border.all(
                color: _enabled
                    ? LandingColors.goldGlow
                    : LandingColors.paleGold.withValues(alpha: 0.35),
                width: 1.2,
              ),
              boxShadow: _enabled
                  ? [
                      BoxShadow(
                        color: LandingColors.richGold.withValues(alpha: _hovered ? 0.45 : 0.25),
                        blurRadius: _hovered ? 28 : 18,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Icon(widget.icon, size: 34, color: foreground),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.caption,
                        style: TextStyle(color: foreground, fontSize: 13, height: 1.2),
                      ),
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: foreground,
                          fontSize: 20,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_enabled) Icon(Icons.download_rounded, color: foreground),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
