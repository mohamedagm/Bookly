import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> leftSlidingAnimation;
  late Animation<Offset> rightSlidingAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    leftSlidingAnimation = Tween<Offset>(
      begin: Offset(-5, 10),
      end: Offset.zero,
    ).animate(animationController);
    rightSlidingAnimation = Tween<Offset>(
      begin: Offset(5, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        AnimatedBuilder(
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
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                SlideTransition(
                  position: rightSlidingAnimation,
                  child: const Text(
                    ' Free books',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
