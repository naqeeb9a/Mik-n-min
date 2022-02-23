import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/best_seller_banner.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/carosual_widget.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/landing_categories.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/constants.dart';

class LandingPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      extendBody: true,
      key: _key,
      endDrawer: customDrawer(
        context,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSizes().heightBox(context, 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, 0.08)),
              child: appBar(context, _key),
            ),
            const HomeSlider(),
            text(context, gender == "Boy" ? "His Wardrobe" : "Her Wardrobe",
                0.04, CustomColors.customBlack,
                bold: true),
            Wrap(
              children: [
                landingCategories(
                  context,
                  "Mini Girl",
                  "https://www.kindpng.com/picc/m/72-723761_student-png-sammilani-mahavidyalaya-undergraduate-and-dummy-user.png",
                  "mini-girl",
                ),
                landingCategories(
                  context,
                  "Girl",
                  "https://www.kindpng.com/picc/m/72-723761_student-png-sammilani-mahavidyalaya-undergraduate-and-dummy-user.png",
                  "girl",
                ),
                landingCategories(
                  context,
                  "Eastern Wear",
                  "https://www.kindpng.com/picc/m/72-723761_student-png-sammilani-mahavidyalaya-undergraduate-and-dummy-user.png",
                  "eastern-wear",
                ),
                landingCategories(
                  context,
                  "Girls Pants",
                  "https://www.kindpng.com/picc/m/72-723761_student-png-sammilani-mahavidyalaya-undergraduate-and-dummy-user.png",
                  "girls-pants",
                ),
                landingCategories(
                  context,
                  "Girls Jeans & Jeggings",
                  "https://cdn.shopify.com/s/files/1/0489/2730/9979/collections/bodysuits_79d7831c-cea7-4444-b5bb-0214446193d9.png?v=1639503093",
                  "girls-jeans-jeggings",
                ),
                landingCategories(
                  context,
                  "Girls Nightwear",
                  "https://cdn.shopify.com/s/files/1/0489/2730/9979/collections/nightsuits.png?v=1639492382",
                  "girls-nightwear",
                ),
              ],
            ),
            bestSellerBanner(context)
          ],
        ),
      ),
    );
  }
}
