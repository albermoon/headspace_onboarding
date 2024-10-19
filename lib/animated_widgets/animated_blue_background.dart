import 'package:flutter/material.dart';

class AnimatedBlueBackground extends StatelessWidget {
  const AnimatedBlueBackground({
    super.key,
    required Animation<double> blueBackgroundAnimation,
  }) : _blueBackgroundAnimation = blueBackgroundAnimation;

  final Animation<double> _blueBackgroundAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _blueBackgroundAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _blueBackgroundAnimation.value),
          child: child,
        );
      },
      child: Transform.scale(
        scale: 12,
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 5, 7, 37),
          ),
        ),
      ),
    );
  }
}
