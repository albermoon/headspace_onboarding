import 'dart:math';

import 'package:flutter/material.dart';

/// CustomPainter for the smiley face rendering
class FacePainter extends CustomPainter {
  /// Animation value for smiling effect
  final double fraction;

  FacePainter({required this.fraction});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 5, 7, 37)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 9;

    // Method to convert degree to radians
    double degToRad(num deg) => deg * (pi / 180.0);

    Path path = Path();

    // First eye
    path.arcTo(
      Rect.fromCenter(center: Offset(size.width / 4, 0), width: 40, height: 35),
      degToRad(10),
      degToRad(160),
      true,
    );

    // Secodn eye
    path.arcTo(
      Rect.fromCenter(
          center: Offset(3 * size.width / 4, 0), width: 40, height: 35),
      degToRad(10),
      degToRad(160),
      true,
    );

    // Smile
    path.addArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, -30), width: 200, height: 200),
      degToRad(70 - fraction), // Subtract value
      degToRad(40 + (fraction * 2)), // Add twice the value
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
