import 'package:flutter/material.dart';

/// Animated widget for the Breathe out widget
//TODO: Turn the Breathe in and out widget to a single widget
class AnimatedBreatheOut extends StatelessWidget {
  const AnimatedBreatheOut({
    super.key,
    required Animation<double> secondTextOpacity,
    required Animation<double> secondTextScale,
  })  : _secondTextOpacity = secondTextOpacity,
        _secondTextScale = secondTextScale;

  final Animation<double> _secondTextOpacity;
  final Animation<double> _secondTextScale;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _secondTextOpacity,
      builder: (context, child) {
        return Positioned(
          top: 100,
          child: ScaleTransition(
            scale: _secondTextScale,
            child: Opacity(
              opacity: _secondTextOpacity.value,
              child: const Text(
                "Breathe out",
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
