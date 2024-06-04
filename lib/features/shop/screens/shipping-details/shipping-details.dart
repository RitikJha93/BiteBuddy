import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/features/shop/screens/shipping-details/widgets/add-shipping-form.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: CustomAppbar(
        isCenterTile: true,
        title: Text(
          "Shipping Details",
          style: CommonTextStyles()
              .setTextStyle(fontsize: TSizes.md, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          width: 300,
          child: ElevatedButton(
              onPressed: () {
                controller.addShipping();
              },
              child: Obx(() => controller.isLoading.value
                  ? const Loader(loaderColor: TColors.light)
                  : const Text("Add Shipping Details ->")))),
      body: AddShippingForm(),
    );
  }
}
