import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = CartController.instance;
    return Obx(() => Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Item Total",
                      style: CommonTextStyles().setTextStyle(
                        color: TColors.secondaryColor,
                        fontsize: 16,
                      )),
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        color: TColors.dark,
                        size: 14,
                      ),
                      Text("${controller.totalPrice}",
                          style: CommonTextStyles().setTextStyle(
                            fontsize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Item Discount",
                      style: CommonTextStyles().setTextStyle(
                        color: TColors.secondaryColor,
                        fontsize: 16,
                      )),
                  Row(
                    children: [
                      const Icon(
                        Icons.remove,
                        color: TColors.dark,
                        size: 14,
                      ),
                      const Icon(
                        Icons.currency_rupee,
                        color: TColors.dark,
                        size: 14,
                      ),
                      Text("${controller.discount}",
                          style: CommonTextStyles().setTextStyle(
                              fontsize: 16,
                              fontWeight: FontWeight.w600,
                              color: TColors.ratingBackgroundColor)),
                    ],
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",
                      style: CommonTextStyles().setTextStyle(
                        color: TColors.secondaryColor,
                        fontsize: 16,
                      )),
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        color: TColors.dark,
                        size: 14,
                      ),
                      Text("${controller.finalPrice}",
                          style: CommonTextStyles().setTextStyle(
                            fontsize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
