import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/features/shop/screens/cart/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartSection extends StatelessWidget {
  const CartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() {
      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return CartItemCard(item: item);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 14,
              ),
          itemCount: controller.cartItems.length);
    });
  }
}
