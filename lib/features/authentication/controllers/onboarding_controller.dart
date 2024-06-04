import 'package:bitebuddy/features/authentication/screens/login/login.dart';
import 'package:bitebuddy/utils/constants/text_strings.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;

  final List<Map<String, dynamic>> onboardingScreens = [
    {
      "image": "assets/onboarding/onboarding1.json",
      "title": TTexts.onboardingTitle1,
      "subtitle": TTexts.onboardingSubTitle1
    },
    {
      "image": "assets/onboarding/onboarding2.json",
      "title": TTexts.onboardingTitle2,
      "subtitle": TTexts.onboardingSubTitle2
    },
    {
      "image": "assets/onboarding/onboarding3.json",
      "title": TTexts.onboardingTitle3,
      "subtitle": TTexts.onboardingSubTitle3
    },
  ];

  //update current index when page scrolls
  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  //jump to specific dot selected page
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  //updates current index and jumps to nextpage
  void nextPage() {
    if (currentIndex.value == 2) {
      StorageService.storage.write(StorageKeys.isFirstTime, false);
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //updates current index and jump to last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
