import 'package:flutter/material.dart';
import 'package:manipulation/components/login_text.dart';

/// Animated widget for the Welcome and Login text buttons
class AnimatedWelcomeContainer extends StatelessWidget {
  const AnimatedWelcomeContainer({
    super.key,
    required Animation<Offset> welcomeAnimation,
  }) : _welcomeAnimation = welcomeAnimation;

  final Animation<Offset> _welcomeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _welcomeAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: _welcomeAnimation,
          child: child,
        );
      },
      child: const LoginTextContainer(),
    );
  }
}
