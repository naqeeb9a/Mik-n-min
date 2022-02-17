import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

customExpandedTile(context, productData) {
  return ExpansionTile(
    title: text(context, "Product Details", 0.03, CustomColors.customBlack,
        bold: true),
    trailing: Icon(
      Icons.arrow_drop_down,
      size: CustomSizes().dynamicWidth(context, 0.05),
    ),
    initiallyExpanded: false,
    childrenPadding: EdgeInsets.symmetric(
        vertical: CustomSizes().dynamicWidth(context, 0.02),
        horizontal: CustomSizes().dynamicWidth(context, 0.02)),
    children: [
      text(
        context,
        productData["description"],
        0.03,
        CustomColors.customBlack,
        maxLines: 10,
      ),
    ],
  );
}
