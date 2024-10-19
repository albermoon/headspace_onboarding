import 'package:flutter/material.dart';
import 'package:manipulation/animated_widgets/animated_blue_background.dart';
import 'package:manipulation/animated_widgets/animated_breathe_in.dart';
import 'package:manipulation/animated_widgets/animated_breathe_out.dart';
import 'package:manipulation/animated_widgets/animated_circle.dart';
import 'package:manipulation/animated_widgets/animated_hide_value.dart';
import 'package:manipulation/animated_widgets/animated_smile_face.dart';
import 'package:manipulation/animated_widgets/animated_typer_text.dart';
import 'package:manipulation/animated_widgets/animated_welcome_container.dart';
import 'package:manipulation/components/background_container.dart';

class AnimatedContentContainer extends StatefulWidget {
  const AnimatedContentContainer({super.key});

  @override
  State<AnimatedContentContainer> createState() =>
      _AnimatedContentContainerState();
}

class _AnimatedContentContainerState extends State<AnimatedContentContainer>
    with SingleTickerProviderStateMixin<AnimatedContentContainer> {
  /// General controller for the onboarding animation
  late AnimationController _controller;
  late Animation<int> _textTyperAnimation;
  late Animation<Offset> _offsetValue;
  late Animation<double> _sizeCircle;
  late Animation<double> _textOpacity;
  late Animation<double> _textScale;
  late Animation<Offset> _smileyOffset;
  late Animation<double> _smileyScale;
  late Animation<double> _smileRotate;
  late Animation<double> _smile;
  late Animation<double> _secondTextOpacity;
  late Animation<double> _secondTextScale;
  late Animation<double> _blueBackgroundAnimation;
  late Animation<double> _welcomeAnimation;
  late Animation<int> _hide;
  late Animation<double> _coverHeight;

  // Text to be animated
  final _text = ' headspace®';

  @override
  void initState() {
    super.initState();

    // Initialize the animaton controller to complete the animation sequences
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _textTyperAnimation = IntTween(end: 0, begin: _text.length).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.18, curve: Curves.easeIn),
      ),
    );

    // Animation for size and offset of Main circle
    _sizeCircle = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: Tween(begin: 1, end: 9),
          weight: 29,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 9, end: 11)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 29,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 11, end: 9)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 29,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 9, end: 2.5),
          weight: 14,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.18, 0.88),
      ),
    );

    _offsetValue = TweenSequence<Offset>([
      TweenSequenceItem(
        tween:
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 400)),
        weight: 29,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
            begin: const Offset(0, 400), end: const Offset(0, 200)),
        weight: 29,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
            begin: const Offset(0, 200), end: const Offset(0, 300)),
        weight: 29,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
            begin: const Offset(0, 300), end: const Offset(180, 50)),
        weight: 7,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
            begin: const Offset(180, 50), end: const Offset(0, -220)),
        // TODO: Replace the ending value with screen height based information
        weight: 7,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.18, 0.88),
      ),
    );

    // Animation for scale and opacity for Breathe In text
    _textOpacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: 1),
        weight: 80,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0),
        weight: 20,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _textScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.8, end: 1),
        weight: 80,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 0),
        weight: 20,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    // Animation for scale and opacity for Breathe Out text
    _secondTextOpacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: 1),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1, end: 1),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1, end: 0),
        weight: 10,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.8),
      ),
    );
    _secondTextScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.55, 0.8, curve: Curves.decelerate),
      ),
    );

    // Animation for the blue background
    _blueBackgroundAnimation = Tween<double>(begin: 0, end: 600).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.82, 0.88),
      ),
    );

    // Animation for the welcome container
    _welcomeAnimation = Tween<double>(
      begin: 900,
      end: 450,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.85,
          0.88,
          curve: Curves.easeOut,
        ),
      ),
    );

    // Animation value for Smile
    _smileyOffset = TweenSequence<Offset>(
      [
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
              begin: const Offset(0, 220), end: const Offset(0, -70)),
          weight: 29,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
              begin: const Offset(0, -70), end: const Offset(0, 100)),
          weight: 29,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
              begin: const Offset(0, 100), end: const Offset(100, 0)),
          weight: 7,
        ),
        TweenSequenceItem<Offset>(
          tween: Tween<Offset>(
              begin: const Offset(100, 0), end: const Offset(10, -250)),
          weight: 7,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.38, 0.88),
      ),
    );

    _smileRotate = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.74, 0.88),
      ),
    );

    _smileyScale = TweenSequence(
      [
        TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 13),
        TweenSequenceItem(tween: Tween<double>(begin: 1, end: 1), weight: 67),
        TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.4), weight: 20),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.30, 0.88),
      ),
    );

    _smile = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 40),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 40, end: 0),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.38, 0.78),
      ),
    );

    // Value for hide container value
    _hide = IntTween(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.865, 0.865),
      ),
    );

    _coverHeight = Tween<double>(begin: 0, end: 120).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.86, 0.875),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Backgroud
        const BackgroundContainer(),

        // Blue background
        AnimatedBlueBackground(
          blueBackgroundAnimation: _blueBackgroundAnimation,
        ),

        // Circle and  Typer text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circle
            AnimatedCircle(offsetValue: _offsetValue, sizeCircle: _sizeCircle),
            // Typer text
            AnimatedTyperText(textTyperAnimation: _textTyperAnimation),
          ],
        ),

        // Hide Value
        AnimatedHideValue(
          hide: _hide,
          coverHeight: _coverHeight,
        ),

        // Smiley Face
        AnimatedSmileFace(
          smileyScale: _smileyScale,
          smileyOffset: _smileyOffset,
          smileRotate: _smileRotate,
          smile: _smile,
        ),

        // Breathe in
        AnimatedBreatheIn(
          textOpacity: _textOpacity,
          textScale: _textScale,
        ),

        // Breathe out
        AnimatedBreatheOut(
          secondTextOpacity: _secondTextOpacity,
          secondTextScale: _secondTextScale,
        ),

        // Welcome container
        AnimatedWelcomeContainer(
          welcomeAnimation: _welcomeAnimation,
        ),
      ],
    );
  }
}
