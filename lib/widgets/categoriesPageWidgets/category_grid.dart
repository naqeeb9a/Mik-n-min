import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/category_detail.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';

import '../../utils/config.dart';
import '../text_widget.dart';

categoryGrid(context, productData, index) {
  return InkWell(
    onTap: () {
      CustomRoutes().push(
        context,
        CategoryDetail(
          text1: productData[index]["node"]["title"],
          function: getShopifyCollection(productData[index]["node"]["handle"]),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: CustomColors.customWhite,
        borderRadius: BorderRadius.circular(
          CustomSizes().dynamicWidth(context, .03),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes().dynamicWidth(context, .026),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: CustomSizes().dynamicWidth(context, 0.2),
            child: text(context, productData[index]["node"]["title"], 0.02,
                CustomColors.customBlack,
                bold: true),
          ),
          Image.network(
            productData[index]["node"]["image"] == null
                ? "https://www.kindpng.com/picc/m/9-93354_tshirt-fully-transparent-background-t-shirt-clip-art.png"
                : productData[index]["node"]["image"]["src"],
            width: CustomSizes().dynamicWidth(context, 0.1),
          )
        ],
      ),
    ),
  );
}
