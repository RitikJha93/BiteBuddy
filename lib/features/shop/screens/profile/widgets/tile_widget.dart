import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final Widget leading;
  final VoidCallback onClick;
  const TileWidget(
      {super.key,
      required this.title,
      required this.leading,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: leading,
      title: Text(
        title,
        style: CommonTextStyles()
            .setTextStyle(fontsize: 16, color: TColors.secondaryColor),
      ),
      trailing: const Icon(
        Icons.arrow_right_alt,
        color: TColors.secondaryColor,
      ),
    );
  }
}
