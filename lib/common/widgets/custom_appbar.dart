import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showbackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool isCenterTile;
  const CustomAppbar(
      {super.key,
      this.title,
      this.showbackArrow = true,
      this.leadingIcon,
      this.actions,
      this.isCenterTile = false,
      this.leadingOnPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AppBar(
        centerTitle: isCenterTile,
        automaticallyImplyLeading: false,
        title: title,
        leading: showbackArrow
            ? IconButton(
                onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtilites.getAppbarHeight());
}
