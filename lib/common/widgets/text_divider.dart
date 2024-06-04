import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TextWithDivider extends StatelessWidget {
  final String? text;
  const TextWithDivider({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(child: Divider()),
      const SizedBox(
        width: TSizes.sm,
      ),
      Text(text!,
          style: CommonTextStyles().setTextStyle(
            fontsize: 18,
            color: TColors.secondaryColor,
          )),
      const SizedBox(
        width: TSizes.sm,
      ),
      const Expanded(child: Divider()),
    ]);
  }
}
