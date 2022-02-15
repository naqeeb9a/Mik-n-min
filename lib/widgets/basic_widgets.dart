import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/khubaib/view_page.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';

Widget chip(context, title) {
  return Container(
    height: CustomSizes().dynamicHeight(context, .03),
    decoration: BoxDecoration(
      color: CustomColors.customWhite,
      borderRadius: BorderRadius.all(
        Radius.circular(
          CustomSizes().dynamicWidth(context, 1),
        ),
      ),
      border: Border.all(color: CustomColors.customBlack),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: CustomSizes().dynamicWidth(context, .02),
    ),
    child: Center(
      child: text(
        context,
        title,
        0.022,
        CustomColors.customBlack,
      ),
    ),
  );
}

Widget card(context) {
  return InkWell(
    onTap: ()=> CustomRoutes().push(context,const ViewPage()),
    child: Column(
      children: [
        Container(
          width: CustomSizes().dynamicWidth(context, 0.42),
          height: CustomSizes().dynamicHeight(context, 0.2),
          color: CustomColors.customWhite,
          child: Center(
            child: text(context, "image", 0.02, CustomColors.customBlack),
          ),
        ),
        Container(
          width: CustomSizes().dynamicWidth(context, 0.42),
          height: CustomSizes().dynamicHeight(context, 0.07),
          color: CustomColors.customGrey.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(context, "CocoBee", 0.025, CustomColors.customBlack),
              text(context, "Teal Turquoise Hoodie", 0.025,
                  CustomColors.customBlack,
                  bold: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSizes().widthBox(context, 0.05),
                  Text(
                    "Rs.3190",
                    style: TextStyle(
                        color: CustomColors.customGrey,
                        fontSize: CustomSizes().dynamicHeight(context, 0.012),
                        decoration: TextDecoration.lineThrough),
                  ),
                  text(context, "Rs.1569", 0.025, CustomColors.customPink),
                  Padding(
                    padding: EdgeInsets.only(
                      right: CustomSizes().dynamicWidth(context, 0.02),
                    ),
                    child: Icon(
                      Icons.star_border_outlined,
                      size: CustomSizes().dynamicHeight(context, 0.025),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: CustomSizes().dynamicWidth(context, 0.002),
        ),
      ],
    ),
  );
}
