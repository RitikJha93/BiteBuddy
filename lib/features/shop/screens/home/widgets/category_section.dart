import 'package:bitebuddy/common/widgets/text_divider.dart';
import 'package:bitebuddy/features/shop/controllers/home/categories_controller.dart';
import 'package:bitebuddy/features/shop/screens/home/widgets/category_card.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CategoriesController controller = Get.put(CategoriesController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWithDivider(
          text: "What's on your mind",
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(() => SizedBox(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                        width: TSizes.lg,
                      ),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final item = controller.categories[index];
                    return CategoryCard(item: item);
                  }),
            ))
      ],
    );
  }
}
