import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/rating_widget.dart';
import 'package:bitebuddy/features/shop/models/restaurant/restaurant_detail.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RestaurantDetailInfo extends StatelessWidget {
  final RestaurantDetail details;
  const RestaurantDetailInfo({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  details.name!,
                  style: CommonTextStyles()
                      .setTextStyle(fontsize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  details.address!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CommonTextStyles().setTextStyle(
                      fontsize: 14,
                      fontWeight: FontWeight.normal,
                      color: TColors.secondaryColor),
                ),
              ],
            ),
          ),
          RatingWidget(rating: details.rating!)
        ],
      ),
    );
  }
}
