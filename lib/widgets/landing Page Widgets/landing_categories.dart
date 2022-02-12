import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/khubaib/detail_page.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/config.dart';

landingCategories(context) {
  return InkWell(
    onTap: (){
      CustomRoutes().push(context, DetailPage());
    },
    child: Container(
      margin: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.02)),
      width: CustomSizes().dynamicWidth(context, 0.25),
      height: CustomSizes().dynamicWidth(context, 0.25),
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: CustomColors.customPink),
          borderRadius:
              BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.04))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/shopping_skirt.png",
            height: CustomSizes().dynamicWidth(context, 0.15),
          ),
          text(context, "Skirt", 0.03, CustomColors.customBlack)
        ],
      ),
    ),
  );
}
