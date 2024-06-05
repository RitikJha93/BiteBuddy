import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/authentication/models/address_model.dart';
import 'package:bitebuddy/features/shop/controllers/orders/order_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSelectCard extends StatelessWidget {
  final Address address;
  const AddressSelectCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final controller = OrderController.instance;
    return Container(
        height: controller.addressess.length > 2 ? 150 : 60,
        width: 120,
        padding: EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
            color: TColors.accentColor,
            border: Border.all(
              color: TColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(TSizes.cardRadiusSm)),
        child: Obx(() {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio<String>(
                activeColor: TColors.primaryColor,
                value: address.id!,
                groupValue: controller.selectedAddress.value,
                onChanged: (value) {
                  controller.selectedAddress.value = value!;
                },
              ),
              Expanded(
                child: Text(
                  address.address!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: CommonTextStyles().setTextStyle(
                      fontsize: 12,
                      fontWeight: FontWeight.w400,
                      color: TColors.secondaryColor),
                ),
              )
            ],
          );
        }));
  }
}
