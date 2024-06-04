import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
      // contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // errorMaxLines: 3,

      prefixIconColor: TColors.secondaryColor,
      suffixIconColor: TColors.secondaryColor,
      // labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
      hintStyle: const TextStyle()
          .copyWith(fontSize: 14, color: TColors.secondaryColor),
      // errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      enabledBorder: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(color: TColors.inputBorderCoor, width: 1.0),
      ),
      border: const UnderlineInputBorder().copyWith(
        borderSide: BorderSide(color: TColors.inputBorderCoor, width: 1.0),
      ),
      focusedBorder: const UnderlineInputBorder().copyWith(
          borderSide: BorderSide(color: TColors.primaryColor, width: 1.0)));

  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    // floatingLabelStyle:
    //     const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    // border: const OutlineInputBorder().copyWith(
    //     borderRadius: BorderRadius.circular(14),
    //     borderSide: const BorderSide(width: 1, color: Colors.grey)),
    // enabledBorder: const OutlineInputBorder().copyWith(
    //     borderRadius: BorderRadius.circular(14),
    //     borderSide: const BorderSide(width: 1, color: Colors.grey)),
    // focusedBorder: const OutlineInputBorder().copyWith(
    //     borderRadius: BorderRadius.circular(14),
    //     borderSide: const BorderSide(width: 1, color: Colors.white)),
    // errorBorder: const OutlineInputBorder().copyWith(
    //     borderRadius: BorderRadius.circular(14),
    //     borderSide: const BorderSide(width: 1, color: Colors.red)),
    // focusedErrorBorder: const OutlineInputBorder().copyWith(
    //     borderRadius: BorderRadius.circular(14),
    //     borderSide: const BorderSide(width: 1, color: Colors.orange)),
  );
}
