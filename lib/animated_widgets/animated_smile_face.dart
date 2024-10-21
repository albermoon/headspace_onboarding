import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manipulation/components/smiley_face.dart';

/// Animated widget for the smiley face
class AnimatedSmileFace extends StatelessWidget {
  const AnimatedSmileFace({
    super.key,
    required Animation<double> smileyScale,
    required Animation<Offset> smileyOffset,
    required Animation<double> smileRotate,
    required Animation<double> smile,
  })  : _smileyScale = smileyScale,
        _smileyOffset = smileyOffset,
        _smileRotate = smileRotate,
        _smile = smile;

  // Animation for the smile scale effect
  final Animation<double> _smileyScale;

  // Animation for the smile cordinated offset
  final Animation<Offset> _smileyOffset;

  // Animation for the smile rotation
  final Animation<double> _smileRotate;

  // Animation for the actual smiling face
  final Animation<double> _smile;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _smileyScale,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setTranslationRaw(
                _smileyOffset.value.dx, _smileyOffset.value.dy, 0),
          child: Transform.rotate(
            angle: (pi / 180) * _smileRotate.value,
            child: Transform.scale(
              scale: _smileyScale.value,
              child: SizedBox(
                width: 100,
                height: 120,
                child: CustomPaint(
                  painter: FacePainter(fraction: _smile.value),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
