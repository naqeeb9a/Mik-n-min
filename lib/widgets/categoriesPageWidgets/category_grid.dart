import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import '../../utils/config.dart';
import '../text_widget.dart';

categoryGrid(context) {
  return Expanded(
    child: GridView.builder(
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: CustomSizes().dynamicWidth(context, 0.4) /
                CustomSizes().dynamicWidth(context, 0.2),
            crossAxisSpacing: CustomSizes().dynamicHeight(context, 0.02),
            mainAxisSpacing: CustomSizes().dynamicHeight(context, 0.02)),
        itemBuilder: (context, index) {
          return Container(
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
                text(context, "item", 0.03, CustomColors.customBlack,
                    bold: true),
                Image.network(
                  "https://www.kindpng.com/picc/m/9-93354_tshirt-fully-transparent-background-t-shirt-clip-art.png",
                )
              ],
            ),
          );
        }),
  );
}
