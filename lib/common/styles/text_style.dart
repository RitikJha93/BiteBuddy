import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextStyles {
  setTextStyle(
      {Color color = TColors.dark,
      FontWeight fontWeight = FontWeight.w500,
      String? fontFamily,
      double fontsize = 14}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontsize,
      fontWeight: fontWeight,
    );
  }
}
