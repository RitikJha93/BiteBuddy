import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: TColors.secondaryColor
                    .withOpacity(0.3), // Shadow color with opacity
                spreadRadius: 3, // How much the shadow spreads
                blurRadius: 7, // The blur radius of the shadow
                offset: Offset(0, 3), // The position of the shadow (x, y)
              ),
            ],
            color: TColors.light,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusSm)),
        height: 50,
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: TColors.secondaryColor,
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.search),
                child: Container(
                  child: Text(
                    "Search for a food or restarurant",
                    style: CommonTextStyles().setTextStyle(
                        fontsize: 14, color: TColors.secondaryColor),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list_sharp,
                  color: TColors.primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
