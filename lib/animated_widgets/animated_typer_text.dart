import 'package:flutter/material.dart';

/// Animated widget for the typer text
class AnimatedTyperText extends StatelessWidget {
  final _text = ' headspace®';
  const AnimatedTyperText({
    super.key,
    required Animation<int> textTyperAnimation,
  }) : _textTyperAnimation = textTyperAnimation;

  // Animation to control the animated text typer
  final Animation<int> _textTyperAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textTyperAnimation,
      builder: (context, child) {
        // Substring the text [_text] as the animation value changes
        String text = _text.substring(0, _textTyperAnimation.value);
        return Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        );
      },
    );
  }
}
