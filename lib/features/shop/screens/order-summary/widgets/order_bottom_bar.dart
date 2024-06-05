import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/features/shop/controllers/orders/order_controller.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.find();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    padding: const EdgeInsets.all(16.0),
                    child: const Center(
                      child: Text('Details of the order'),
                    ),
                  );
                },
              );
            },
            child: Text(
              'View Details',
              style: CommonTextStyles().setTextStyle(
                  fontsize: 14.0, textDecoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            width: TDeviceUtilites.getScreenWidth() * 0.5,
            child: ElevatedButton(
              onPressed: () {
                controller.placeOrder();
              },
              child: Text(
                'Place Order',
                style: CommonTextStyles().setTextStyle(
                    fontsize: 16,
                    fontWeight: FontWeight.w600,
                    color: TColors.light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
