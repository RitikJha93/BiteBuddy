import 'package:bitebuddy/features/shop/models/restaurant/food_model.dart';
import 'package:bitebuddy/features/shop/models/restaurant/restaurant_detail.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class RestaurantDetailController extends GetxController {
  static RestaurantDetailController get _instance => Get.find();

  Rx<RestaurantDetail> restaurantDetail = RestaurantDetail().obs;
  List<Food> _foods = <Food>[].obs;

  var isLoading = false.obs;

  Future<void> fetchRestaurantDetail(String restaurantId) async {
    isLoading.value = true;
    try {
      final response = await SupabaseService.client
          .from("menus")
          .select()
          .eq("restaurant_id", restaurantId);
      final restaurantData = await SupabaseService.client
          .from("restaurants")
          .select()
          .eq("id", restaurantId)
          .single();

      _foods = response.map((food) => Food.fromJson(food)).toList();
      restaurantDetail.value = RestaurantDetail(
        name: restaurantData["name"],
        menu: _foods,
        address: restaurantData["address"],
        id: restaurantData["id"],
        rating: restaurantData["rating"],
        thumbnail: restaurantData["thumbnail"],
      );

      isLoading.value = false;
    } catch (e) {
      print(e.toString());
    } finally {}
  }
}
