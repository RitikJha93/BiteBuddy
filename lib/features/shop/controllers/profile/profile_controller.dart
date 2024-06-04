import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:bitebuddy/utils/routes/routes.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final User? user = SupabaseService.client.auth.currentUser;

  late String name = user!.userMetadata!["username"];

  Future<void> handleLogout() async {
    await SupabaseService.client.auth.signOut();
    StorageService.storage.remove(StorageKeys.cartItems);
    Get.offAllNamed(Routes.login);
  }

  final List<Map<String, dynamic>> tiles = [
    {
      "icon": Icon(
        Icons.shopping_bag_outlined,
        color: TColors.primaryColor,
      ),
      "title": "My Orders",
      "onClick": () => Get.toNamed(Routes.orders)
    },
    {
      "icon": Icon(
        Icons.favorite_outline_outlined,
        color: TColors.primaryColor,
      ),
      "title": "My Favourites",
      "onClick": () => Get.toNamed(Routes.favourites)
    },
    {
      "icon": Icon(
        Icons.logout,
        color: TColors.primaryColor,
      ),
      "title": "Logout",
      "onClick": () => ProfileController.instance.handleLogout()
    }
  ];
}
