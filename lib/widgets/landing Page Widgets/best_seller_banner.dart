import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import '../text_widget.dart';

bestSellerBanner(context) {
  return Container(
    width: CustomSizes().dynamicWidth(context, 1),
    height: CustomSizes().dynamicHeight(context, 0.1),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/landing_girl.png"), fit: BoxFit.cover)),
    child: Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.02)),
          color: CustomColors.customWhite.withOpacity(0.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(context, "Best Sellers", 0.045, CustomColors.customBlack,
              bold: true, alignText: TextAlign.start),
          text(context, "Jackets & Sweaters", 0.03, CustomColors.customBlack,
              bold: true),
        ],
      ),
    ),
  );
}
