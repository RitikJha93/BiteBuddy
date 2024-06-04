import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TextButtonTheme {
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          textStyle:
              CommonTextStyles().setTextStyle(color: TColors.primaryColor),
          side: BorderSide(color: TColors.primaryColor)));
}
