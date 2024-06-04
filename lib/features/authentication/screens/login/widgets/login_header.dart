import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: 120,
          image: AssetImage(isDark ? TTexts.darkLogo : TTexts.lightLogo),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Text(
          "Welcome Back",
          style: CommonTextStyles()
              .setTextStyle(fontsize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          "Sign in to continue",
          style: CommonTextStyles().setTextStyle(
              fontsize: 16,
              color: TColors.secondaryColor,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
