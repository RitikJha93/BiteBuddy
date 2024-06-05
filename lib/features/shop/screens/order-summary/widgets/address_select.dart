import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/orders/order_controller.dart';
import 'package:bitebuddy/features/shop/screens/order-summary/widgets/address_select_card.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Shipping Address",
          style: CommonTextStyles()
              .setTextStyle(fontsize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: TSizes.sm),
        Obx(() {
          return Flexible(
            fit: FlexFit.loose,
            child: ListView.separated(
              shrinkWrap: true,
              physics: controller.addressess.length > 2
                  ? const ScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
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
                    : TSizes.spaceBtwInputFields,
                width: controller.addressess.length > 2
                    ? TSizes.spaceBtwInputFields
                    : 0,
              ),
            ),
          );
        }),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        SizedBox(
          width: TDeviceUtilites.getScreenHeight(),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.shippingDetails);
            },
            child: const Text("Change Address"),
          ),
        ),
      ],
    );
  }
}
