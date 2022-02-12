import 'package:flutter/material.dart';

import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../utils/app_routes.dart';
import '../utils/config.dart';
import 'basic_widgets.dart';

appBar(
  context,
  GlobalKey<ScaffoldState> _key,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      text(
        context,
        "BuildYourCake",
        0.06,
        Colors.transparent,
        font: true,
      ),
      InkWell(
        onTap: () => _key.currentState!.openEndDrawer(),
        child: Image.asset(
          "assets/hamburger_menu.png",
          width: CustomSizes().dynamicWidth(context, 0.05),
        ),
      ),
    ],
  );
}

PreferredSizeWidget bar2(context, {bottomText = false, title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(
      CustomSizes().dynamicHeight(context, .072),
    ),
    child: AppBar(
      backgroundColor: CustomColors.customWhite,
      elevation: 1.0,
      foregroundColor: CustomColors.customBlack,
      iconTheme: const IconThemeData(
        color: CustomColors.customBlack,
      ),
      title: SizedBox(
        height: CustomSizes().dynamicHeight(context, .072),
        width: CustomSizes().dynamicWidth(context, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                CustomRoutes().pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: CustomSizes().dynamicWidth(context, 0.05),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: CustomSizes().dynamicHeight(context, .026),
                  backgroundColor: CustomColors.customBlue,
                  child: CircleAvatar(
                    backgroundColor: CustomColors.customWhite,
                    radius: CustomSizes().dynamicHeight(context, .024),
                  ),
                ),
                bottomText == true
                    ? text(
                  context,
                  title,
                  0.02,
                  CustomColors.customBlack,
                  bold: true,
                )
                    : Container(),
              ],
            ),
            chip(context, "1-3 YEARS"),
            chip(context, "3-6 YEARS"),
            chip(context, "6+ YEARS"),
          ],
        ),
      ),
    ),
  );
}
