import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/config.dart';

landingCategories(context) {
  return Container(
    margin: const EdgeInsets.all(5),
    width: CustomSizes().dynamicWidth(context, 0.3),
    height: CustomSizes().dynamicWidth(context, 0.3),
    decoration: BoxDecoration(
        border: Border.all(width: 5, color: CustomColors.customPink),
        borderRadius:
            BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.05))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/shopping_skirt.png",
          height: CustomSizes().dynamicWidth(context, 0.2),
        ),
        text(context, "Skirt", 0.03, CustomColors.customBlack)
      ],
    ),
  );
}
