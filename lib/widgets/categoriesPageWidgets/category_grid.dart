import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import 'category_item.dart';

categoryGrid(context) {
  Expanded(
    child: GridView.builder(
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: CustomSizes().dynamicWidth(context, 0.4) /
                CustomSizes().dynamicWidth(context, 0.2),
            crossAxisSpacing: CustomSizes().dynamicHeight(context, 0.02),
            mainAxisSpacing: CustomSizes().dynamicHeight(context, 0.02)),
        itemBuilder: (context, index) {
          return categoryItems(context, index, "item",
              "https://www.kindpng.com/picc/m/9-93354_tshirt-fully-transparent-background-t-shirt-clip-art.png");
        }),
  );
}
