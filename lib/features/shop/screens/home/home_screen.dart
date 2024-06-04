import 'package:bitebuddy/common/widgets/bottom_rounded_clipper.dart';
import 'package:bitebuddy/common/widgets/searchbar.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/category_section.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/restaurant_section.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: TSizes.md),
          child: Column(
            children: [
              ClipPath(
                clipper: BottomRoundedClipper(radius: 30),
                child: Container(
                  color: TColors.primaryColor,
                  height: 200,
                  child: const Column(
                    children: [HomeAppbar(), SearchBarWidget()],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [CategorySection(), RestaurantSection()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
