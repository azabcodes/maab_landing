import 'package:flutter/material.dart';

import 'landing_colors.dart';

/// The logo floating slowly over a soft gold glow.
class LandingLogo extends StatefulWidget {
  const LandingLogo({super.key, required this.size});

  final double size;

  @override
  State<LandingLogo> createState() => _LandingLogoState();
}

class _LandingLogoState extends State<LandingLogo> with SingleTickerProviderStateMixin {
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
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              LandingColors.richGold.withValues(alpha: 0.30),
              LandingColors.richGold.withValues(alpha: 0.08),
              LandingColors.richGold.withValues(alpha: 0),
            ],
            stops: const [0, 0.55, 1],
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform.translate(
            offset: Offset(0, -10 * Curves.easeInOut.transform(_controller.value)),
            child: child,
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.size * 0.04),
            child: Image.asset('assets/logo.png', filterQuality: FilterQuality.medium),
          ),
        ),
      ),
    );
  }
}
