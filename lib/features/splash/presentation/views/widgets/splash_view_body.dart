import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_animated_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SlidingAnimatedText(
          animationController: animationController,
          leftSlidingAnimation: leftSlidingAnimation,
          rightSlidingAnimation: rightSlidingAnimation,
        ),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).push('/homeView');
      // Get.to(
      //   () => HomeView(),
      //   transition: Transition.cupertino,
      //   duration: Duration(seconds: 4),
      // );
    });
  }

  void initSlidingAnimation() {
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
  }
}
