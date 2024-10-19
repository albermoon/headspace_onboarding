import 'package:flutter/material.dart';

class AnimatedCircle extends StatelessWidget {
  const AnimatedCircle({
    super.key,
    required Animation<Offset> offsetValue,
    required Animation<double> sizeCircle,
  })  : _offsetValue = offsetValue,
        _sizeCircle = sizeCircle;

  final Animation<Offset> _offsetValue;
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
