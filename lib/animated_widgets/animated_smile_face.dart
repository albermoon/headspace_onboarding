import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manipulation/components/smiley_face.dart';

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

  final Animation<double> _smileyScale;
  final Animation<Offset> _smileyOffset;
  final Animation<double> _smileRotate;
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
