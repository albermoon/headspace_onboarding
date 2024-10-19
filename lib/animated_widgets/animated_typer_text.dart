import 'package:flutter/material.dart';

class AnimatedTyperText extends StatelessWidget {
  final _text = ' headspace®';
  const AnimatedTyperText({
    super.key,
    required Animation<int> textTyperAnimation,
  }) : _textTyperAnimation = textTyperAnimation;

  final Animation<int> _textTyperAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textTyperAnimation,
      builder: (context, child) {
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
