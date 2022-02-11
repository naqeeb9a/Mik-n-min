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
        key: _key,
        endDrawer: const Drawer(),
        backgroundColor: CustomColors.customWhite,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSizes().heightBox(context, 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: appBar(context, _key),
              ),
              const HomeSlider(),
              text(context, "Wardrobe", 0.05, CustomColors.customBlack,
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
        bottomNavigationBar: customBottomBar(context));
  }
}
