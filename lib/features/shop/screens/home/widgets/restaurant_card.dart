import 'package:bitebuddy/features/shop/models/restaurant/restaurant_model.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/restaurant_card_data.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/restaurant_card_image.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final double height;
  final Restaurant restaurants;
  const RestaurantCard({
    super.key,
    required this.height,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: TDeviceUtilites.getScreenWidth(),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: TColors.light,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight: Radius.circular(TSizes.cardRadiusMd)),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: Colors.blueGrey.withOpacity(0.2),
                offset: const Offset(0, 2),
                spreadRadius: 7)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestaurantCardImageContainer(
            thumbnail: restaurants.image,
          ),
          RestaurantCardData(
            name: restaurants.name!,
            address: restaurants.address!,
            rating: restaurants.rating!,
          )
        ],
      ),
    );
  }
}
