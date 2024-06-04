import 'package:bitebuddy/features/shop/models/restaurant/restaurant_model.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:get/get.dart';

class RestaurantContoller extends GetxController {
  static RestaurantContoller get instance => Get.find();

  var isLoading = false.obs;
  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  @override
  void onInit() {
    fetchRestaurants();
    super.onInit();
  }

  Future<void> fetchRestaurants() async {
    isLoading.value = true;

    try {
      final response = await SupabaseService.client
          .from("restaurants")
          .select()
          .eq("is_active", true);
      restaurants.value = response.map((restaurant) {
        return Restaurant.fromJson(restaurant);
      }).toList();

    } catch (e) {
      // LoggerHelper.debug(e.toString());
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
