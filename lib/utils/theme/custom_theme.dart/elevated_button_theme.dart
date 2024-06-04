import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: TColors.primaryColor,
              disabledForegroundColor: TColors.light,
              disabledBackgroundColor: TColors.dark,
              side: const BorderSide(color: TColors.primaryColor),
              padding: const EdgeInsets.symmetric(vertical: 14),
              textStyle:
                  CommonTextStyles()
                      .setTextStyle(fontWeight: FontWeight.w600, fontsize: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: TColors.primaryColor,
              disabledForegroundColor: Colors.grey,
              disabledBackgroundColor: Colors.grey,
              side: const BorderSide(color: TColors.primaryColor),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
