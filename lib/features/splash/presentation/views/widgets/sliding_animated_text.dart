import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidingAnimatedText extends StatelessWidget {
  const SlidingAnimatedText({
    super.key,
    required this.animationController,
    required this.leftSlidingAnimation,
    required this.rightSlidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> leftSlidingAnimation;
  final Animation<Offset> rightSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: leftSlidingAnimation,
              child: const Text(
                'Read',
                textAlign: TextAlign.center,
                style: Styles.themeStyle,
              ),
            ),
            SlideTransition(
              position: rightSlidingAnimation,
              child: const Text(
                ' Free books',
                textAlign: TextAlign.center,
                style: Styles.themeStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
