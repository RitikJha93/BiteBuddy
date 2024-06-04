import 'package:bitebuddy/common/styles/text_style.dart';
import 'package:bitebuddy/common/widgets/custom_appbar.dart';
import 'package:bitebuddy/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isCenterTile: true,
        title: Text(
          "My Favourites",
          style: CommonTextStyles()
              .setTextStyle(fontsize: TSizes.md, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
