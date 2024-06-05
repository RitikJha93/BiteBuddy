import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/orders/order_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/enums.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Payment Method",
          style: CommonTextStyles()
              .setTextStyle(fontsize: 16, fontWeight: FontWeight.w600),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: PaymentMethods.values.length,
          itemBuilder: (context, index) {
            final method = PaymentMethods.values[index];
            return Obx(() => ListTile(
                  leading: Radio<PaymentMethods>(
                    activeColor: TColors.primaryColor,
                    value: method,
                    groupValue: controller.selectedPaymentMethod.value,
                    onChanged: (value) {
                      controller.selectedPaymentMethod.value = value!;
                    },
                  ),
                  title: Text(
                    method.toString().split('.').last,
                    style: CommonTextStyles().setTextStyle(fontsize: TSizes.md),
                  ),
                ));
          },
        ),
      ],
    );
  }
}
