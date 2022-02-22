import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      appBar: customAppBar(context, onlyText: true, titleText: "About Us"),
      endDrawer: customDrawer(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: CustomSizes().dynamicHeight(context, 0.03),
                horizontal: CustomSizes().dynamicWidth(context, 0.05),
              ),
              child: text(
                context,
                "Mik&Min is an exclusive, one of its kind marketplace of many "
                "loved kid's wear brands in Pakistan. We have an exceptional "
                "range of eastern and western clothing in one place inspired by "
                "key trends, comfortable styles and adorable designs.",
                0.034,
                CustomColors.customBlack,
                maxLines: 12,
              ),
            ),
            const Divider(
              color: CustomColors.customGrey,
            ),
          ],
        ),
      ),
    );
  }
}
