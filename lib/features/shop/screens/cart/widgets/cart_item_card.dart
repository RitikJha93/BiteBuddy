import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/features/shop/models/cart/cart_model.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final CartController controller = CartController.instance;
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            )),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: CommonTextStyles()
                    .setTextStyle(fontsize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    color: TColors.accentColor,
                    border: Border.all(color: TColors.primaryColor),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => controller.decrementItem(item.id),
                      child: const Icon(
                        Icons.remove,
                        size: 16,
                        color: TColors.primaryColor,
                      ),
                    ),
                    Text(
                      "${item.quantity}",
                      style: CommonTextStyles().setTextStyle(
                          fontsize: 16, color: TColors.primaryColor),
                    ),
                    GestureDetector(
                      onTap: () => controller.incrementItem(item.id),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: TColors.primaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.currency_rupee,
              color: TColors.dark,
              size: 14,
            ),
            Text("${item.quantity * item.price}",
                style: CommonTextStyles().setTextStyle(
                  fontsize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ],
        )
      ],
    );
  }
}
