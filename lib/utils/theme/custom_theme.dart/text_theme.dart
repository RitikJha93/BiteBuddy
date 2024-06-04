import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: TColors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: TColors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w600, color: TColors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w500, color: TColors.dark),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, color: TColors.dark),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
  );
}
