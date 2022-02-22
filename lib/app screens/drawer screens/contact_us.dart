import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      endDrawer: customDrawer(
        context,
      ),
      appBar: customAppBar(context, onlyText: true,titleText:"Contact Us"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                CustomSizes().dynamicWidth(context, 0.05),
                CustomSizes().dynamicHeight(context, 0.01),
                CustomSizes().dynamicWidth(context, 0.05),
                0.0,
              ),
              child: text(
                context,
                "Contact Us",
                0.07,
                CustomColors.customBlack,
                bold: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                CustomSizes().dynamicWidth(context, .1),
                CustomSizes().dynamicHeight(context, .03),
                CustomSizes().dynamicWidth(context, .05),
                CustomSizes().dynamicHeight(context, .03),
              ),
              child: Column(
                children: [
                  rowText(
                    context,
                    Icons.location_on_outlined,
                    CustomColors.customPink,
                    "59/9a Sher Khan Rd, Cantt, Lahore, Punjab",
                  ),
                  CustomSizes().heightBox(context, .03),
                  rowText(
                    context,
                    Icons.warning_amber_rounded,
                    CustomColors.customPink,
                    "customercare@miknmin.com",
                  ),
                  CustomSizes().heightBox(context, .03),
                  rowText(
                    context,
                    LineIcons.phone,
                    // Icons.local_phone_outlined,
                    CustomColors.customPink,
                    "0331-0099811",
                  ),
                ],
              ),
            ),
            const Divider(
              color: CustomColors.customGrey,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                CustomSizes().dynamicWidth(context, .1),
                CustomSizes().dynamicHeight(context, .03),
                CustomSizes().dynamicWidth(context, .05),
                0,
              ),
              child: Row(
                children: [
                  Icon(
                    LineIcons.instagram,
                    color: CustomColors.customGrey,
                    size: CustomSizes().dynamicHeight(context, .04),
                  ),
                  CustomSizes().widthBox(context, 0.02),
                  Icon(
                    LineIcons.facebookF,
                    color: CustomColors.customGrey,
                    size: CustomSizes().dynamicHeight(context, .028),
                  ),
                  CustomSizes().widthBox(context, 0.02),
                  Icon(
                    LineIcons.globe,
                    color: CustomColors.customGrey,
                    size: CustomSizes().dynamicHeight(context, .034),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowText(context, icon, iconColor, text1) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: iconColor,
        size: CustomSizes().dynamicHeight(context, .024),
      ),
      CustomSizes().widthBox(context, 0.03),
      text(
        context,
        text1,
        0.03,
        CustomColors.customBlack,
      )
    ],
  );
}
