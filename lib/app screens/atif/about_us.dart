import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        appBar: bar2(context),
        endDrawer: customDrawer(context),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: CustomSizes().dynamicHeight(context, 0.03),
            horizontal: CustomSizes().dynamicWidth(context, 0.03),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
                text(context, "About Us", 0.07, CustomColors.customBlack,bold: true),
              CustomSizes().heightBox(context, 0.02),
              text(context, "Mik&Min is an exclusive, one of its kind marketplace of many loved kidswear brands in Pakistan. We have an exceptional range of eastern and western clothing in one place inspired by key trends, comfortable styles and adorable designs.", 0.04, CustomColors.customBlack),
              Divider(),
            ],
          ),
        ),
      ),

    );
  }
}
