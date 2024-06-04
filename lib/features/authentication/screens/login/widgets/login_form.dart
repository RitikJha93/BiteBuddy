import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/authentication/controllers/login_controller.dart';
import 'package:bitebuddy/features/authentication/screens/signup/signup.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                cursorColor: TColors.primaryColor,
                style: CommonTextStyles().setTextStyle(fontsize: 16),
                validator: (value) => Validator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined), hintText: "Email"),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Obx(
                () => TextFormField(
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    cursorColor: TColors.primaryColor,
                    validator: (value) => Validator.validatePassword(value),
                    style: CommonTextStyles().setTextStyle(fontsize: 16),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outlined),
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.hidePassword.value =
                                  !controller.hidePassword.value;
                            },
                            icon: Icon(controller.hidePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility)))),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: CommonTextStyles().setTextStyle(
                          fontsize: 14, color: TColors.primaryColor),
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      child: controller.isLoading.value
                          ? const Loader(
                              loaderColor: TColors.light,
                            )
                          : const Text("Sign In"),
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  )),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: CommonTextStyles().setTextStyle(
                          fontsize: 14,
                        ),
                      ),
                      TextButton(
                        child: Text("Sign up",
                            style: CommonTextStyles().setTextStyle(
                                color: TColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontsize: 14)),
                        onPressed: () {
                          Get.to(() => const Signup());
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ));
  }
}
