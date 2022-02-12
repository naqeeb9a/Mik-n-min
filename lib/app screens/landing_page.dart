import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/best_seller_banner.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/bottom_bar.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/carosual_widget.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/drawer.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/landing_categories.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class LandingPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: CustomColors.customWhite.withOpacity(0.5),
      extendBody: true,
      key: _key,
      endDrawer: customDrawer(
        context,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: CustomSizes().dynamicWidth(context, 0.08)),
                    child: appBar(context, _key),
                  ),
                  const HomeSlider(),
                  text(context, "Her Wardrobe", 0.04, CustomColors.customBlack,
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
          // Positioned(bottom: 0, child: customBottomBar(context))
        ],
      ),
    );
  }
}
