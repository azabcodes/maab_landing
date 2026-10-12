import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'landing_colors.dart';

/// A faint grid of eight-pointed stars behind the page.
class StarPatternPainter extends CustomPainter {
  const StarPatternPainter();

  static const double _spacing = 96;
  static const double _radius = 22;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = LandingColors.paleGold.withValues(alpha: 0.05);
    final star = _star();

    for (var y = 0.0; y < size.height + _spacing; y += _spacing) {
      final offsetX = (y / _spacing).round().isOdd ? _spacing / 2 : 0.0;
      for (var x = -offsetX; x < size.width + _spacing; x += _spacing) {
        canvas.drawPath(star.shift(Offset(x, y)), paint);
      }
    }
  }

  Path _star() {
    final path = Path();
    for (final angle in [0.0, math.pi / 4]) {
      final square = Path();
      for (var i = 0; i < 4; i++) {
        final a = angle + i * math.pi / 2;
        final point = Offset(_radius * math.cos(a), _radius * math.sin(a));
        i == 0 ? square.moveTo(point.dx, point.dy) : square.lineTo(point.dx, point.dy);
      }
      path.addPath(square..close(), Offset.zero);
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant StarPatternPainter oldDelegate) => false;
}
