import 'package:flutter/material.dart';

// Animated widget for the face circle
class AnimatedCircle extends StatelessWidget {
  const AnimatedCircle({
    super.key,
    required Animation<Offset> offsetValue,
    required Animation<double> sizeCircle,
  })  : _offsetValue = offsetValue,
        _sizeCircle = sizeCircle;

  // Animation value for the offset value of the circle
  final Animation<Offset> _offsetValue;

  // Animation value of the size value of the circle
  final Animation<double> _sizeCircle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetValue,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            // Scaling the circle
            ..scale(_sizeCircle.value, _sizeCircle.value)
            // Perform translation
            ..setTranslationRaw(
                _offsetValue.value.dx, _offsetValue.value.dy, 0),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 237, 114, 46),
        ),
      ),
    );
  }
}
