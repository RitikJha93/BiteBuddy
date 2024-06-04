import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/features/shop/controllers/orders/order_controller.dart';
import 'package:bitebuddy/features/shop/screens/order-summary/widgets/address_select_card.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:bitebuddy/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSelect extends StatelessWidget {
  const AddressSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;
    return SizedBox(
        height: 150,
        child: Column(
          children: [
            Obx(() {
              return Expanded(
                child: ListView.separated(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: controller.addressess.length > 2
                      ? Axis.horizontal
                      : Axis.vertical,
                  itemCount: controller.addressess.length,
                  itemBuilder: (context, index) {
                    final item = controller.addressess[index];
                    return AddressSelectCard(address: item);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: controller.addressess.length > 2
                        ? 0
                        : TSizes.spaceBtwItems,
                    width: controller.addressess.length > 2
                        ? TSizes.spaceBtwInputFields
                        : 0,
                  ),
                ),
              );
            }),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: TDeviceUtilites.getScreenHeight(),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.shippingDetails);
                  },
                  child: const Text("Change Address")),
            )
          ],
        ));
  }
}
