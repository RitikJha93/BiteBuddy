import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/shop/controllers/orders/order_controller.dart';
import 'package:bitebuddy/features/shop/screens/order-summary/widgets/address_select.dart';
import 'package:bitebuddy/features/shop/screens/order-summary/widgets/payment_options.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return Scaffold(
        appBar: CustomAppbar(
          isCenterTile: true,
          title: Text(
            "Order Summary",
            style: CommonTextStyles()
                .setTextStyle(fontsize: TSizes.md, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: Loader(loaderColor: TColors.primaryColor),
            );
          }
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: 4),
              child: Column(
                children: [AddressSelect(), PaymentOptions()],
              ),
            ),
          );
        }));
  }
}
