
import 'package:english_learning/src/constants/image_strings.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 120,
              left: splashController.animate.value ? tDefaultSize : -80,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tAppName,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 24.0),),
                Text(tAppTagLine,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24.0),)
                ],
              ),
            ),
          ),
          Obx(() => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 100 : 0,
              left: -50,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Image(image: AssetImage(tSplashImage)),
              )
            ),
          ),
        ],
      ),
    );
  }
}
