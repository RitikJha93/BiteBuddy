import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showbackArrow: false,
      title: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: TColors.light,
            size: TSizes.lg,
          ),
          Text(
            "Mumbai,Maharashtra",
            style: CommonTextStyles().setTextStyle(
                color: TColors.light,
                fontWeight: FontWeight.w600,
                fontsize: 16),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: TColors.light,
            ))
      ],
    );
  }
}
