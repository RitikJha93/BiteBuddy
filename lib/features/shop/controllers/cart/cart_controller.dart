import 'dart:convert';
import 'package:bitebuddy/features/authentication/models/address_model.dart';
import 'package:bitebuddy/features/shop/models/cart/cart_model.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/helpers/helper_function.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:bitebuddy/utils/routes/routes.dart';
import 'package:bitebuddy/utils/supabase/supabase_instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  GlobalKey<FormState> shippingFormKey = GlobalKey<FormState>();

  RxList<CartItem> cartItems = <CartItem>[].obs;

  var isLoading = false.obs;

  RxDouble totalPrice = 0.0.obs;
  RxDouble discount = 0.0.obs;
  RxDouble finalPrice = 0.0.obs;

  final locality = TextEditingController();
  final area = TextEditingController();
  final city = TextEditingController();
  final pinCode = TextEditingController();
  final state = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    loadCart();

    super.onInit();

    ever(cartItems, (_) => calculateTotalPrice());
  }

  @override
  void dispose() {
    locality.dispose();
    city.dispose();
    area.dispose();
    pinCode.dispose();
    state.dispose();

    super.dispose();
  }

  Future<void> checkAddress() async {
    isLoading.value = true;
    try {
      final userId = SupabaseService.client.auth.currentUser!.id;
      final response = await SupabaseService.client
          .from("addresses")
          .select()
          .eq("user_id", userId);

      if (response.isEmpty) {
        Get.toNamed(Routes.shippingDetails);
      } else {
        Get.toNamed(Routes.orderSummary);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addShipping() async {
    if (!shippingFormKey.currentState!.validate()) {
      return;
    }

    final address =
        "${locality.text.trim()},${area.text.trim()},${city.text.trim()},${state.text.trim()},${pinCode.text.trim()}";

    final userId = SupabaseService.client.auth.currentUser!.id;

    try {
      await SupabaseService.client
          .from("addresses")
          .insert({"user_id": userId, "address": address});

      Get.offAndToNamed(Routes.orderSummary);

      HelperFunctions.showSnackbar(
          "Shpping Details added Succssfully", TColors.successColor);
    } catch (e) {
      HelperFunctions.showSnackbar(
          "Something went wrong, please try again!", TColors.errorColor);
      print(e.toString());
    }
  }

  void calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }

    if (total > 400) {
      discount.value = 40;
    } else if (total > 200) {
      discount.value = 20;
    }
    totalPrice.value = total;
    finalPrice.value = totalPrice.value - discount.value;
    print(total);
  }

  void loadCart() {
    var storedCart = StorageService.storage.read(StorageKeys.cartItems);
    print("storedCart");
    print(storedCart);
    print(StorageService.storage.read(StorageKeys.cartItems));
    if (storedCart != null) {
      final List<dynamic> decodedItems = jsonDecode(storedCart);

      final loadedCartItems =
          decodedItems.map((item) => CartItem.fromJson(item)).toList();
      cartItems.value = loadedCartItems;
      calculateTotalPrice();
    }
  }

  void saveCart(String type) async {
    final List<Map<String, dynamic>> cartData =
        cartItems.map((item) => item.toJson()).toList();

    cartData.isEmpty
        ? await StorageService.storage.remove(StorageKeys.cartItems)
        : await StorageService.storage
            .write(StorageKeys.cartItems, jsonEncode(cartData));
    StorageService.storage.listen(() {
      print("hello");
      print(StorageService.storage.read(StorageKeys.cartItems));
    });

    if (type == "add") {
      HelperFunctions.showSnackbar(
          "${cartData.length} item added to cart", TColors.successColor);
    }
  }

  void addItemsToCart(String id, String name, String price, String image) {
    var existingItem =
        cartItems.firstWhereOrNull((element) => element.id == id);

    final item = CartItem(
        name: name,
        quantity: 1,
        image: image,
        id: id,
        price: double.parse(price));

    if (existingItem != null) {
      existingItem.quantity = existingItem.quantity + 1;
    } else {
      cartItems.add(item);
    }
    saveCart("add");
  }

  void incrementItem(String id) {
    final item = cartItems.firstWhere((element) => element.id == id);
    item.quantity += 1;
    cartItems.refresh();
    saveCart("update");
  }

  void decrementItem(String id) {
    final item = cartItems.firstWhere((element) => element.id == id);
    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      cartItems.remove(item);
    }
    cartItems.refresh();
    saveCart("update");
  }

  void removeItem(String id) {
    final item = cartItems.firstWhere((element) => element.id == id);
    cartItems.remove(item);
    saveCart("remove");
  }
}
