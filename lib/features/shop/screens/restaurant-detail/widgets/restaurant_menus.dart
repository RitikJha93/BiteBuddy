import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/cart/cart_controller.dart';
import 'package:bitebuddy/features/shop/models/restaurant/restaurant_detail.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RestaurantMenus extends StatelessWidget {
  final RestaurantDetail details;
  const RestaurantMenus({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Padding(
        padding: const EdgeInsets.only(
            left: TSizes.md, right: TSizes.md, bottom: TSizes.lg),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details.menu!.length,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: TSizes.md, vertical: TSizes.spaceBtwItems),
            child: Divider(
              color: TColors.inputBorderCoor,
            ),
          ),
          itemBuilder: (context, index) {
            final item = details.menu![index];
            return SizedBox(
              height: 120,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name!,
                          style: CommonTextStyles().setTextStyle(
                              fontsize: TSizes.md, fontWeight: FontWeight.w600),
                        ),
                        Text(item.description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: CommonTextStyles().setTextStyle(
                                fontsize: 12,
                                fontWeight: FontWeight.normal,
                                color: TColors.secondaryColor)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              color: TColors.dark,
                            ),
                            Text(item.price!,
                                style: CommonTextStyles().setTextStyle(
                                  fontsize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: Stack(
                      // alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              12.0), // Adjust the radius as needed
                          child: Image.network(
                            item.image!,
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            left: 10,
                            right: 10,
                            bottom: 0,
                            child: SizedBox(
                                width: 120,
                                child: Obx(() {
                                  var cartItem = controller.cartItems
                                      .firstWhereOrNull(
                                          (cartItem) => cartItem.id == item.id);

                                  return cartItem != null
                                      ? Container(
                                          decoration: BoxDecoration(
                                              color: TColors.accentColor,
                                              border: Border.all(
                                                  color: TColors.primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      TSizes.cardRadiusSm)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: TColors.primaryColor,
                                                ),
                                                onPressed: () => controller
                                                    .decrementItem(item.id),
                                              ),
                                              Text('${cartItem.quantity}',
                                                  style: CommonTextStyles()
                                                      .setTextStyle(
                                                    fontsize: 18,
                                                    color: TColors.primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: TColors.primaryColor,
                                                ),
                                                onPressed: () => controller
                                                    .incrementItem(item.id),
                                              ),
                                            ],
                                          ),
                                        )
                                      : OutlinedButton(
                                          onPressed: () =>
                                              controller.addItemsToCart(
                                                  item.id,
                                                  item.name!,
                                                  item.price!,
                                                  item.image!),
                                          child: const Text('Add'),
                                        );
                                })))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
