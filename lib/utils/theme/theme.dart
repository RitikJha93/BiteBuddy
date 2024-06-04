import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/appbar_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/bottomsheet_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/checkbox_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/chip_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/elevated_button_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/outlined_button_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/text_field_theme.dart';
import 'package:bitebuddy/utils/theme/custom_theme.dart/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      appBarTheme: TAppbarTheme.lightAppbarTheme,
      useMaterial3: true,
      primaryColor: TColors.primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
      inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
      chipTheme: TChipTheme.lightChipTheme);
  static ThemeData darkTheme = ThemeData(
      appBarTheme: TAppbarTheme.darkAppbarTheme,
      useMaterial3: true,
      primaryColor: TColors.primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black54,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: TCheckBoxTheme.darkCheckboxTheme,
      chipTheme: TChipTheme.darkChipTheme,
      inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme);
}
