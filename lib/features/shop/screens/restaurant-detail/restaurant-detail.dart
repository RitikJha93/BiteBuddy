import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/shop/controllers/restaurant/restaurant_detail_controller.dart';
import 'package:bitebuddy/features/shop/screens/restaurant-detail/widgets/restaurant_detail_banner.dart';
import 'package:bitebuddy/features/shop/screens/restaurant-detail/widgets/restaurant_detail_info.dart';
import 'package:bitebuddy/features/shop/screens/restaurant-detail/widgets/restaurant_menus.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetail extends StatelessWidget {
  const RestaurantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantDetailController controller =
        Get.put(RestaurantDetailController());

    final restaurantId = Get.parameters["id"];
    controller.fetchRestaurantDetail(restaurantId!);
    return Scaffold(body: Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: Loader(loaderColor: TColors.primaryColor),
        );
      } else {
        final details = controller.restaurantDetail.value;
        return SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              RestaurantDetailBanner(details: details),
              RestaurantDetailInfo(details: details),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Divider(
                  color: TColors.inputBorderCoor,
                  height: 1,
                ),
              ),
              RestaurantMenus(details: details),
            ],
          )),
        );
      }
    }));
  }
}
