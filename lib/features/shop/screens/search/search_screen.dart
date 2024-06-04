import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showbackArrow: true,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: TSizes.sm),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                border: Border.all(color: TColors.primaryColor)),
            child: TextFormField(
              style: CommonTextStyles().setTextStyle(fontsize: 16),
              decoration: InputDecoration(
                  focusedBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Search for Menu or Restaurant",
                  hintStyle: CommonTextStyles().setTextStyle(
                      fontsize: 14, color: TColors.secondaryColor)),
            ),
          ),
        ),
      ),
    );
  }
}
