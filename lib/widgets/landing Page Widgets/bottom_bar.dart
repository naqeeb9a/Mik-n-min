import 'package:flutter/material.dart';

import '../../utils/dynamic_sizes.dart';

customBottomBar(context) {
  double iconSize = 0.05;
  return BottomAppBar(
      child: SizedBox(
    height: CustomSizes().dynamicWidth(context, 0.1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/home.png",
          width: CustomSizes().dynamicWidth(context, iconSize),
        ),
        Image.asset(
          "assets/search.png",
          width: CustomSizes().dynamicWidth(context, iconSize),
        ),
        Image.asset(
          "assets/bottom_category.png",
          width: CustomSizes().dynamicWidth(context, iconSize),
        ),
        Image.asset(
          "assets/cart.png",
          width: CustomSizes().dynamicWidth(context, iconSize),
        ),
        Image.asset(
          "assets/profile.png",
          width: CustomSizes().dynamicWidth(context, iconSize),
        ),
      ],
    ),
  ));
}
