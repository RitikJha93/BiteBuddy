import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/models/home/categories_model.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.item,
  });

  final Category item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Column(
        children: [
          Image.network(
            item.image!,
            width: 70,
            height: 70,
          ),
          const SizedBox(
            height: TSizes.sm,
          ),
          Text(
            item.name!,
            style: CommonTextStyles().setTextStyle(
                fontsize: 14,
                fontWeight: FontWeight.w600,
                color: TColors.secondaryColor),
          )
        ],
      ),
    );
  }
}
