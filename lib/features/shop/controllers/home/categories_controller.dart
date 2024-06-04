import 'package:bitebuddy/features/shop/models/home/categories_model.dart';
import 'package:bitebuddy/utils/logging/logger.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  var isLoading = false.obs;
  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;

    try {
      final response = await SupabaseService.client.from("category").select();
      categories.value = response.map((category) {
        return Category.fromJson(category);
      }).toList();

    } catch (e) {
      // LoggerHelper.debug(e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
