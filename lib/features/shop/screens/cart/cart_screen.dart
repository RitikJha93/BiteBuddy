import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/features/shop/screens/cart/widgets/cart_price.dart';
import 'package:bitebuddy/features/shop/screens/cart/widgets/cart_section.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Scaffold(
        appBar: CustomAppbar(
          showbackArrow: false,
          isCenterTile: true,
          title: Text(
            "My Cart",
            style: CommonTextStyles()
                .setTextStyle(fontsize: TSizes.md, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(() => controller.cartItems.isEmpty
            ? Container()
            : SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      controller.checkAddress();
                    },
                    child: controller.isLoading.value
                        ? const Loader(loaderColor: TColors.light)
                        : const Text("Proceed to Checkout ->")))),
        body: Obx(() {
          if (controller.cartItems.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Center(
                  child: Text(
                "You Cart Is Empty,Please add items to view in cart",
                textAlign: TextAlign.center,
                style: CommonTextStyles()
                    .setTextStyle(fontsize: 18, fontWeight: FontWeight.w600),
              )),
            );
          }
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.md),
            child: Column(
              children: [
                CartSection(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Divider(),
                CartPrice()
              ],
            ),
          );
        }));
  }
}
