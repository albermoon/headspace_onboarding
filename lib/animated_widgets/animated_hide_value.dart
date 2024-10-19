import 'package:flutter/material.dart';

/// Animated widget for hiding the animaing circle widget
class AnimatedHideValue extends StatelessWidget {
  const AnimatedHideValue({
    super.key,
    required Animation<int> hide,
    required Animation<double> coverHeight,
  })  : _hide = hide,
        _coverHeight = coverHeight;

  final Animation<int> _hide;
  final Animation<double> _coverHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hide,
      builder: (context, child) {
        return Opacity(
          opacity: _hide.value.toDouble(),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.sizeOf(context).width / 2 - 60,
              height: 240 + _coverHeight.value,
              color: const Color.fromARGB(255, 214, 155, 28),
            ),
          ),
        );
      },
    );
  }
}
