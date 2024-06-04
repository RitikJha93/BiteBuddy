import 'package:bitebuddy/features/authentication/screens/login/login.dart';
import 'package:bitebuddy/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:bitebuddy/features/shop/screens/navigation_menu.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FirstTimeCheck extends GetxController {
  static FirstTimeCheck get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _initAuthListener();
  }

  @override
  void onReady() {
    super.onReady();
    screenRedirect();
  }

  void _initAuthListener() {
    SupabaseService.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      if (session == null) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const BottomNavigationMenu());
      }
    });
  }

  void screenRedirect() {
    bool isFirstTime =
        StorageService.storage.read(StorageKeys.isFirstTime) ?? true;

    if (!isFirstTime) {
      if (SupabaseService.client.auth.currentUser != null) {
        Get.offAll(() => const BottomNavigationMenu());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    } else {
      Get.offAll(() => const Onboarding());
      StorageService.storage.write(StorageKeys.isFirstTime, false);
    }
  }
}
