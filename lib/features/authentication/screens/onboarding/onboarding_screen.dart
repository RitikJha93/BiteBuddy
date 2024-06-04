import 'package:bitebuddy/features/authentication/controllers/onboarding_controller.dart';
import 'package:bitebuddy/features/authentication/screens/onboarding/widgets/onboarding_button.dart';
import 'package:bitebuddy/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:bitebuddy/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:bitebuddy/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(children: [
        PageView.builder(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.updatePageIndicator(index);
          },
          itemCount: controller.onboardingScreens.length,
          itemBuilder: (context, index) {
            final item = controller.onboardingScreens[index];
            return OnboardingPage(
              image: item["image"],
              title: item["title"],
              subtitle: item["subtitle"],
            );
          },
        ),
        const OnboardingSkip(),
        const OnboardingNavigation(),
        const OnboardingButton()
      ]),
    );
  }
}
