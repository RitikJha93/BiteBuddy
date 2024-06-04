import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/rating_widget.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RestaurantCardData extends StatelessWidget {
  String name;
  String address;
  double rating;
  RestaurantCardData(
      {super.key,
      required this.name,
      required this.address,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: CommonTextStyles().setTextStyle(
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                    color: TColors.dark),
              ),
              RatingWidget(rating: rating)
            ],
          ),
          Text(
            address,
            style: CommonTextStyles()
                .setTextStyle(fontsize: 14, color: TColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
