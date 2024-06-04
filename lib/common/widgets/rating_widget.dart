import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: TColors.ratingBackgroundColor,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusXs)),
        padding: const EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: 8),
        child: Row(
          children: [
            Text(
              rating.toString(),
              style: CommonTextStyles().setTextStyle(
                  fontsize: 12,
                  fontWeight: FontWeight.bold,
                  color: TColors.light),
            ),
            const SizedBox(
              width: TSizes.xs,
            ),
            const Icon(
              Icons.star_rounded,
              color: TColors.light,
              size: TSizes.md,
            )
          ],
        ));
  }
}
