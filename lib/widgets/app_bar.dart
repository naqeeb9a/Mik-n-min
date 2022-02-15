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

PreferredSizeWidget customAppBar(context,
    {bottomText = false, title, onlyText = false, titleText}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(
      CustomSizes().dynamicWidth(context, .14),
    ),
    child: AppBar(
      backgroundColor: CustomColors.customWhite,
      elevation: 1.0,
      foregroundColor: CustomColors.customBlack,
      iconTheme: const IconThemeData(
        color: CustomColors.customBlack,
      ),
      centerTitle: onlyText,
      // leading: onlyText == true
      //     ? InkWell(
      //         onTap: () {
      //           CustomRoutes().pop(context);
      //         },
      //         child: Icon(
      //           Icons.arrow_back_ios_new_sharp,
      //           size: CustomSizes().dynamicWidth(context, 0.05),
      //         ),
      //       )
      //     : Container(),
      title: onlyText == true
          ? text(context, titleText, 0.03, CustomColors.customBlack)
          : SizedBox(
              height: CustomSizes().dynamicWidth(context, .15),
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
                        radius: CustomSizes().dynamicWidth(context, .045),
                        backgroundColor: CustomColors.customBlue,
                        child: CircleAvatar(
                          backgroundColor: CustomColors.customWhite,
                          radius: CustomSizes().dynamicWidth(context, .042),
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
