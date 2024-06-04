import 'package:bitebuddy/features/authentication/models/address_model.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  RxString selectedAddress = "".obs;
  RxString paymentMethod = "".obs;
  RxList<Address> addressess = <Address>[].obs;

  var isLoading = false.obs;
  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  Future<void> getAddress() async {
    isLoading.value = true;
    try {
      final userId = SupabaseService.client.auth.currentUser!.id;
      final response = await SupabaseService.client
          .from("addresses")
          .select()
          .eq("user_id", userId);

      addressess.value = response.map((add) => Address.fromJson(add)).toList();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
