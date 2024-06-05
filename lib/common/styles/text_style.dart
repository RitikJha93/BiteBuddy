import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextStyles {
  setTextStyle(
      {Color color = TColors.dark,
      FontWeight fontWeight = FontWeight.w500,
      String? fontFamily,
      TextDecoration textDecoration = TextDecoration.none,
      double fontsize = 14}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            color: color,
            fontSize: fontsize,
            fontWeight: fontWeight,
            decoration: textDecoration));
  }
}
