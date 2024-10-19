import 'package:flutter/material.dart';

/// Animated widget for the Breathe in widget
class AnimatedBreatheIn extends StatelessWidget {
  const AnimatedBreatheIn({
    super.key,
    required Animation<double> textOpacity,
    required Animation<double> textScale,
  })  : _textOpacity = textOpacity,
        _textScale = textScale;

  final Animation<double> _textOpacity;
  final Animation<double> _textScale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textOpacity,
      builder: (context, child) {
        return Positioned(
          top: 100,
          child: ScaleTransition(
            scale: _textScale,
            child: Opacity(
              opacity: _textOpacity.value,
              child: const Text(
                "Breathe in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
