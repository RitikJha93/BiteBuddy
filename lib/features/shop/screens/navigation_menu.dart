import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/navigation_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: TColors.light,
          ),
          child: TabBar(
            onTap: (index) {
              controller.tabController
                  .animateTo(index); // Update TabController index
            },
            controller: controller.tabController,
            indicatorPadding: const EdgeInsets.symmetric(vertical: 4),
            indicator: UnderlineTabIndicator(
                insets: const EdgeInsets.only(bottom: 65.0),
                borderSide: BorderSide(color: TColors.primaryColor, width: 5),
                borderRadius: BorderRadius.circular(10)),
            labelStyle: CommonTextStyles()
                .setTextStyle(fontsize: 12, fontWeight: FontWeight.w600),
            unselectedLabelColor: TColors.secondaryColor,
            labelColor: TColors.primaryColor,
            unselectedLabelStyle: CommonTextStyles().setTextStyle(
              fontsize: 12,
              color: TColors.secondaryColor,
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.explore_outlined),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.shopping_basket_outlined),
                text: 'Cart',
              ),
              Tab(
                icon: Icon(Icons.person_outline_outlined),
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: controller.screens,
        ));
  }
}
