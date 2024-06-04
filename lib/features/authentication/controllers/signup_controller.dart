import 'package:bitebuddy/features/shop/screens/navigation_menu.dart';
import 'package:bitebuddy/features/shop/screens/home/home_screen.dart';
import 'package:bitebuddy/utils/helpers/helper_function.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //variable controller
  final isLoading = false.obs;
  final hidePassword = true.obs;
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  Future<void> signup() async {
    try {
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      isLoading.value = true;
      final AuthResponse data = await SupabaseService.client.auth
          .signUp(email: email.text, password: password.text, data: {
        "username": fullName.text,
        "phone_number": phoneNumber.text,
        "account_type": "USER"
      });

      if (data.user != null) {
        StorageService.storage
            .write(StorageKeys.userSession, data.session!.toJson());
        HelperFunctions.showSnackbar("Account Created Successfully");
        Get.offAll(() => const BottomNavigationMenu());
      }

      isLoading.value = false;
    } on AuthException catch (e) {
      isLoading.value = false;

      HelperFunctions.showSnackbar(e.message);
    }
  }
}
