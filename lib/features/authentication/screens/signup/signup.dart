import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/authentication/screens/login/login.dart';
import 'package:bitebuddy/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:bitebuddy/features/authentication/screens/signup/widgets/signup_header.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            color: TColors.primaryColor,
            height: TDeviceUtilites.getScreenHeight(),
          ),
          Positioned(
              top: TDeviceUtilites.getScreenHeight() * 0.4,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80)),
                ),
              )),
          const Positioned(
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
              top: TSizes.appBarHeight,
              child: Column(
                children: [
                  SignUpHeader(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SignUpForm()
                ],
              )),
          Positioned(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace * 7,
            child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: CommonTextStyles().setTextStyle(
                        fontsize: 14,
                      ),
                    ),
                    TextButton(
                      child: Text("Sign in",
                          style: CommonTextStyles().setTextStyle(
                              color: TColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontsize: 14)),
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                    ),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
