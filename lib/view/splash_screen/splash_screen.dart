import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/splash_screen_controller.dart';
import 'package:news_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(const Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "NEWS TODAY",
              style: NewsText.textMain,
            ),
            if (splashScreenProvider.isLoading)
              LottieBuilder.asset(
                "assets/animations/Animation - 1718688007391.json",
                fit: BoxFit.cover,
              )
          ],
        ),
      ),
    );
  }
}
