import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        endDrawer: customDrawer(context),
        appBar: bar2(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: CustomSizes().dynamicHeight(context, 0.045),
            horizontal: CustomSizes().dynamicWidth(context, 0.03),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              CustomSizes().heightBox(context, 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes().dynamicWidth(context, 0.02)),
                child: text(
                    context, "Contact Us", 0.07, CustomColors.customBlack,
                    bold: true),
              ),
              CustomSizes().heightBox(context, 0.05),
              Padding(
                padding: EdgeInsets.only(
                    left: CustomSizes().dynamicWidth(context, 0.03)),
                child: Column(
                  children: [
                    RowText(
                        context,
                        Icons.location_on_outlined,
                        CustomColors.customPink,
                        "59/9a SherKhan Rd, Cantt, Lahore, Punjab"),
                    CustomSizes().heightBox(context, 0.02),
                    RowText(context, Icons.warning_amber,
                        CustomColors.customPink, "customercare@miknmin.com"),
                    CustomSizes().heightBox(context, 0.02),
                    RowText(context, Icons.phone_enabled_outlined,
                        CustomColors.customPink, "0331-0099811"),
                    CustomSizes().heightBox(context, 0.05),
                  ],
                ),
              ),
              Divider(),
              CustomSizes().heightBox(context, 0.05),
              Row(
                children: [
                  CustomSizes().widthBox(context, 0.07),
                  Icon(LineIcons.instagram),
                  CustomSizes().widthBox(context, 0.02),
                  Icon(
                    LineIcons.facebookF,
                    color: CustomColors.customGrey,
                  ),
                  CustomSizes().widthBox(context, 0.02),
                  Icon(LineIcons.globe),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget RowText(context, icon, iconColor, text1) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: iconColor,
      ),
      CustomSizes().widthBox(context, 0.02),
      text(context, text1, 0.035, CustomColors.customBlack)
    ],
  );
}
