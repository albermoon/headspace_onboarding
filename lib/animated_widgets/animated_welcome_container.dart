import 'package:flutter/material.dart';
import 'package:manipulation/components/login_text.dart';

class AnimatedWelcomeContainer extends StatelessWidget {
  const AnimatedWelcomeContainer({
    super.key,
    required Animation<double> welcomeAnimation,
  }) : _welcomeAnimation = welcomeAnimation;

  final Animation<double> _welcomeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _welcomeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            _welcomeAnimation.value,
          ),
          child: child,
        );
      },
      child: const LoginTextContainer(),
    );
  }
}
