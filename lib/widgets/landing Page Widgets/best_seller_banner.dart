import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import '../text_widget.dart';

bestSellerBanner(context) {
  return Container(
    width: CustomSizes().dynamicWidth(context, 1),
    height: CustomSizes().dynamicHeight(context, 0.14),
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/landing_girl.png"), fit: BoxFit.cover)),
    child: Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: CustomSizes().dynamicWidth(context, 0.02),
        left: CustomSizes().dynamicWidth(context, 0.02),
        right: CustomSizes().dynamicWidth(context, 0.02),
        bottom: CustomSizes().dynamicWidth(context, 0.13),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes().dynamicWidth(context, 0.02),
        vertical: CustomSizes().dynamicWidth(context, 0.01),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            CustomSizes().dynamicWidth(context, 0.02),
          ),
          color: CustomColors.customWhite.withOpacity(0.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(context, "Best Sellers", 0.04, CustomColors.customBlack,
              bold: true, alignText: TextAlign.start),
          text(context, "Jackets & Sweaters", 0.03, CustomColors.customBlack,
              bold: true),
        ],
      ),
    ),
  );
}
