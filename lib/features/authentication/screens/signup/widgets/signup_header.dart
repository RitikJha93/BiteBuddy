import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Signup",
          style: CommonTextStyles().setTextStyle(
              fontsize: 28, fontWeight: FontWeight.bold, color: TColors.light),
        ),
        Text(
          "It's great to see you",
          style: CommonTextStyles().setTextStyle(
              fontsize: 16,
              fontWeight: FontWeight.normal,
              color: TColors.light),
        ),
      ],
    );
  }
}
