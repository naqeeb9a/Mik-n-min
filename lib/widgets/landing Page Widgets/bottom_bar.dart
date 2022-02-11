import 'package:flutter/material.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';

customBottomBar(context) {
  return BottomAppBar(
      child: SizedBox(
    height: CustomSizes().dynamicWidth(context, 0.12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.home_outlined,
          color: CustomColors.customPink,
          size: CustomSizes().dynamicWidth(context, 0.07),
        ),
        Icon(
          Icons.search,
          color: CustomColors.customPink,
          size: CustomSizes().dynamicWidth(context, 0.07),
        ),
        Icon(
          Icons.category_outlined,
          color: CustomColors.customPink,
          size: CustomSizes().dynamicWidth(context, 0.07),
        ),
        Icon(
          Icons.shopping_cart_outlined,
          color: CustomColors.customPink,
          size: CustomSizes().dynamicWidth(context, 0.07),
        ),
        Icon(
          Icons.person_outline,
          color: CustomColors.customPink,
          size: CustomSizes().dynamicWidth(context, 0.07),
        )
      ],
    ),
  ));
}
