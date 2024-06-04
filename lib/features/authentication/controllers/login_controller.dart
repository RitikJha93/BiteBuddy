import 'package:bitebuddy/features/shop/screens/navigation_menu.dart';
import 'package:bitebuddy/features/shop/screens/home/home_screen.dart';
import 'package:bitebuddy/utils/helpers/helper_function.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:bitebuddy/utils/routes/routes.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //variable controller
  final isLoading = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  Future<void> login() async {
    try {
      if (!loginFormKey.currentState!.validate()) {
        return;
      }
      isLoading.value = true;
      final AuthResponse data = await SupabaseService.client.auth
          .signInWithPassword(email: email.text, password: password.text);

      if (data.user != null) {
        StorageService.storage
            .write(StorageKeys.userSession, data.session!.toJson());
        HelperFunctions.showSnackbar("Logged in SuccessFully");
        // Get.offAll(() => const BottomNavigationMenu());
        Get.offAllNamed(Routes.home);
      }
      isLoading.value = false;
    } on AuthException catch (e) {
      isLoading.value = false;

      HelperFunctions.showSnackbar(e.message);
    }
  }
}
