import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/validator/validator.dart';
import 'package:flutter/material.dart';

class AddShippingForm extends StatelessWidget {
  const AddShippingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Container(
      color: TColors.light,
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: 4),
      child: Form(
        key: controller.shippingFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flat Name,Building Name,Apartment name",
              overflow: TextOverflow.ellipsis,
              style: CommonTextStyles()
                  .setTextStyle(fontsize: 16, fontWeight: FontWeight.w600),
            ),
            TextFormField(
              controller: controller.locality,
              cursorColor: TColors.primaryColor,
              style: CommonTextStyles().setTextStyle(fontsize: 16),
              validator: (value) =>
                  Validator.validateEmptyText("Locality", value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.maps_home_work_outlined),
                  hintText: "Locality"),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Text(
              "Nearby location",
              overflow: TextOverflow.ellipsis,
              style: CommonTextStyles()
                  .setTextStyle(fontsize: 16, fontWeight: FontWeight.w600),
            ),
            TextFormField(
              controller: controller.area,
              cursorColor: TColors.primaryColor,
              style: CommonTextStyles().setTextStyle(fontsize: 16),
              validator: (value) => Validator.validateEmptyText("Area", value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.maps_home_work_outlined),
                  hintText: "For ex : near atm"),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "City",
                      overflow: TextOverflow.ellipsis,
                      style: CommonTextStyles().setTextStyle(
                          fontsize: 16, fontWeight: FontWeight.w600),
                    ),
                    TextFormField(
                      controller: controller.city,
                      cursorColor: TColors.primaryColor,
                      style: CommonTextStyles().setTextStyle(fontsize: 16),
                      validator: (value) =>
                          Validator.validateEmptyText("City", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.maps_home_work_outlined),
                          hintText: "For ex : Mumbai"),
                    ),
                  ],
                )),
                const SizedBox(
                  width: TSizes.sm,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PinCode",
                      overflow: TextOverflow.ellipsis,
                      style: CommonTextStyles().setTextStyle(
                          fontsize: 16, fontWeight: FontWeight.w600),
                    ),
                    TextFormField(
                      controller: controller.pinCode,
                      cursorColor: TColors.primaryColor,
                      style: CommonTextStyles().setTextStyle(fontsize: 16),
                      validator: (value) =>
                          Validator.validateEmptyText("Pincode", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.maps_home_work_outlined),
                          hintText: "6 digit pincode"),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Text(
              "State",
              overflow: TextOverflow.ellipsis,
              style: CommonTextStyles()
                  .setTextStyle(fontsize: 16, fontWeight: FontWeight.w600),
            ),
            TextFormField(
              controller: controller.state,
              cursorColor: TColors.primaryColor,
              style: CommonTextStyles().setTextStyle(fontsize: 16),
              validator: (value) => Validator.validateEmptyText("State", value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.maps_home_work_outlined),
                  hintText: "For ex : Maharashtra"),
            ),
          ],
        ),
      ),
    );
  }
}
