import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/best_seller_banner.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/bottom_bar.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/carosual_widget.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/landing_categories.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class LandingPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _key,
      endDrawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                text(context, "New In", 0.04, CustomColors.customBlack),
                Image.asset(
                  "assets/drawer_img1.png",
                  width: CustomSizes().dynamicWidth(context, 0.2),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: CustomColors.customWhite,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSizes().heightBox(context, 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: appBar(context, _key),
                  ),
                  const HomeSlider(),
                  text(context, "Her Wardrobe", 0.045, CustomColors.customBlack,
                      bold: true),
                  Wrap(
                    children: [
                      landingCategories(context),
                      landingCategories(context),
                      landingCategories(context),
                      landingCategories(context),
                      landingCategories(context),
                      landingCategories(context),
                    ],
                  ),
                  bestSellerBanner(context)
                ],
              ),
            ),
          ),
          Positioned(bottom: 0, child: customBottomBar(context))
        ],
      ),
    );
  }
}
