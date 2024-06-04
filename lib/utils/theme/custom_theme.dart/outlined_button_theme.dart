import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              backgroundColor: TColors.accentColor,
              elevation: 0,
              foregroundColor: TColors.primaryColor,
              side: const BorderSide(color: TColors.primaryColor, width: 1),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              textStyle:
                  CommonTextStyles()
                      .setTextStyle(
                          fontsize: 16,
                          color: TColors.primaryColor,
                          fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.sm))));
  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.blueAccent),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14))));
}
