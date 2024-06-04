import 'package:bitebuddy/features/shop/screens/cart/cart_screen.dart';
import 'package:bitebuddy/features/shop/screens/favourite/favourite_screen.dart';
import 'package:bitebuddy/features/shop/screens/home/home_screen.dart';
import 'package:bitebuddy/features/shop/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final currentIndex = 0.obs; // Observable variable for current index

  final screens = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: screens.length);
    tabController.addListener(() {
      currentIndex.value =
          tabController.index; // Update currentIndex when TabController changes
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
