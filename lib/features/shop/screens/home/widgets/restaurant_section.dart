import 'package:bitebuddy/features/shop/controllers/restaurant/restaurant_controller.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/restaurant_card.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantSection extends StatelessWidget {
  const RestaurantSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RestaurantContoller());

    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(height: TSizes.md),
          itemCount: controller.restaurants.length,
          itemBuilder: (context, index) {
            final item = controller.restaurants[index];
            return GestureDetector(
                onTap: () => Get.toNamed('/restaurant/${item.id}'),
                child: RestaurantCard(height: 260, restaurants: item));
          }),
    );
  }
}
