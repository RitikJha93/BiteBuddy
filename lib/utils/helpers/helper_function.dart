import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperFunctions {
  static getColor(String value) {
    if (value == "Green") {
      return Colors.green;
    }

    return null;
  }

  static void showSnackbar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        backgroundColor: TColors.primaryColor,
        content: Text(
          message,
          style: CommonTextStyles()
              .setTextStyle(fontsize: 14, color: TColors.light),
        )));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"))
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLen) {
    if (text.length <= maxLen) {
      return text;
    } else {
      return '${text.substring(0, maxLen)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
