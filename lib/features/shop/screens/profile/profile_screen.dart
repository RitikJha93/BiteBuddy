import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/features/shop/controllers/profile/profile_controller.dart';
import 'package:bitebuddy/features/shop/screens/profile/widgets/tile_widget.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/constants/text_strings.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return Scaffold(
        appBar: CustomAppbar(
          isCenterTile: true,
          showbackArrow: false,
          title: Text(
            "My Profile",
            style: CommonTextStyles()
                .setTextStyle(fontsize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
          child: Container(
            width: TDeviceUtilites.getScreenWidth(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  TTexts.profilePic,
                  height: 200,
                  width: 200,
                ),
                Text(
                  controller.name,
                  style: CommonTextStyles().setTextStyle(
                      fontsize: TSizes.md, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.tiles.length,
                  itemBuilder: (context, index) {
                    final tile = controller.tiles[index];
                    return Card(
                      color: TColors.accentColor,
                      child: ListTile(
                        leading: tile['icon'],
                        title: Text(
                          tile['title'],
                          style: CommonTextStyles().setTextStyle(
                              fontsize: 16,
                              fontWeight: FontWeight.w500,
                              color: TColors.primaryColor),
                        ),
                        trailing: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: TColors.primaryColor,
                        ),
                        onTap: tile['onClick'],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
