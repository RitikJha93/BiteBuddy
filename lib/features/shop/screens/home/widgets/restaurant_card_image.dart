import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RestaurantCardImageContainer extends StatelessWidget {
  String? thumbnail;
  RestaurantCardImageContainer({super.key, this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(TSizes.cardRadiusMd),
                  topLeft: Radius.circular(TSizes.cardRadiusMd)),
              child: Image.network(
                thumbnail!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              )),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: TColors.light,
                )),
          )
        ],
      ),
    );
  }
}
