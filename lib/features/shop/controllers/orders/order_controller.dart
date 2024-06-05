import 'package:bitebuddy/features/authentication/models/address_model.dart';
import 'package:bitebuddy/utils/constants/enums.dart';
import 'package:bitebuddy/utils/razorpay/razorpay_service.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  RxList<Address> addressess = <Address>[].obs;

  RxString selectedAddress = "".obs;

  Rx<PaymentMethods> selectedPaymentMethod = PaymentMethods.razorpay.obs;

  final RazorpayService _razorpayService = Get.find<RazorpayService>();

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
      if (addressess.isNotEmpty) {
        selectedAddress.value = addressess[0].id ?? '';
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> placeOrder() async {
    double amount = 1.0; // Amount in INR
    String contact = "1234567890"; // User contact
    String email = "test@example.com";

    isLoading.value = true;

    if (selectedPaymentMethod.value == PaymentMethods.razorpay) {
      _razorpayService.openCheckout(
          amount: amount, contact: contact, email: email);
    } else {
      print("cod is selected");
    }

    isLoading.value = false;
  }
}
