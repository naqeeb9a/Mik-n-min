import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/category_detail.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/config.dart';
import '../../utils/constants.dart';

landingCategories(context, text1, img, handle) {
  return InkWell(
    onTap: () {
      CustomRoutes().push(
        context,
        CategoryDetail(
          text1: text1,
          function: getShopifyCollection(handle),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.02)),
      width: CustomSizes().dynamicWidth(context, 0.25),
      height: CustomSizes().dynamicWidth(context, 0.25),
      decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: gender == "Boy"
                ? CustomColors.customBlue
                : CustomColors.customPink,
          ),
          borderRadius:
              BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.04))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            img,
            height: CustomSizes().dynamicWidth(context, 0.15),
          ),
          text(context, text1, 0.03, CustomColors.customBlack,
              alignText: TextAlign.center, maxLines: 1)
        ],
      ),
    ),
  );
}
