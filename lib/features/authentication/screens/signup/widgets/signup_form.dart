import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/authentication/controllers/signup_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:bitebuddy/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Container(
        height: TDeviceUtilites.getScreenHeight() * 0.5,
        decoration: BoxDecoration(
          color: TColors.light,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 7, // The blur radius of the shadow
              offset: Offset(0, 3), // The position of the shadow (x, y)
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Form(
              key: controller.signupFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections, horizontal: 16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.fullName,
                      validator: (value) =>
                          Validator.validateEmptyText("Full Name", value),
                      cursorColor: TColors.primaryColor,
                      style: CommonTextStyles().setTextStyle(fontsize: 16),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          hintText: "Full Name"),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => Validator.validateEmail(value),
                      cursorColor: TColors.primaryColor,
                      style: CommonTextStyles().setTextStyle(fontsize: 16),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: "Email"),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          Validator.validatePhoneNumber(value),
                      cursorColor: TColors.primaryColor,
                      style: CommonTextStyles().setTextStyle(fontsize: 16),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone_outlined),
                          hintText: "Phone number"),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        validator: (value) => Validator.validatePassword(value),
                        cursorColor: TColors.primaryColor,
                        style: CommonTextStyles().setTextStyle(fontsize: 16),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined),
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.hidePassword.value =
                                      !controller.hidePassword.value;
                                },
                                icon: Icon(controller.hidePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Obx(
                          () => ElevatedButton(
                            child: controller.isLoading.value ? Loader(loaderColor: TColors.light,) : Text("Sign up"),
                            onPressed: () {
                              controller.signup();
                            },
                          ),
                        )),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                ),
              )),
        ));
  }
}
