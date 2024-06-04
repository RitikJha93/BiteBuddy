import 'package:bitebuddy/features/shop/models/restaurant/restaurant_detail.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetailBanner extends StatelessWidget {
  const RestaurantDetailBanner({
    super.key,
    required this.details,
  });

  final RestaurantDetail details;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          details.thumbnail!,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: TDeviceUtilites.getStatusBarHeight(),
            left: TSizes.sm,
            right: TSizes.sm,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: TColors.light,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                      color: TColors.light,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline_outlined,
                      color: TColors.light,
                    ))
              ],
            ))
      ],
    );
  }
}
