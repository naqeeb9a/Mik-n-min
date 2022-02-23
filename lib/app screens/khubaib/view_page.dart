import 'package:flutter/material.dart';

import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';
import 'package:mik_and_min/widgets/viewPageWidgets/custom_swiper.dart';

import '../../widgets/viewPageWidgets/custom_delivery_text.dart';
import '../../widgets/viewPageWidgets/custom_expansion_tile.dart';

class ViewPage extends StatefulWidget {
  final dynamic productData;

  const ViewPage({this.productData, Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  var index = 0, quantity = 1;

  void incrementCounter() {
    setState(
      () {
        quantity++;
      },
    );
  }

  void decrementCounter() {
    if (quantity <= 1) {
      return;
    }
    setState(
      () {
        quantity--;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        drawerScrimColor: CustomColors.customSkimColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.04)),
          child: coloredButton(context, "ADD TO CART", CustomColors.customPink,
              width: CustomSizes().dynamicWidth(context, 0.8)),
        ),
        endDrawer: customDrawer(context),
        appBar: customAppBar(context),
        body: SafeArea(
          child: Column(
            children: [
              customSwiper(context, widget.productData),
              Divider(
                thickness: CustomSizes().dynamicWidth(context, 0.002),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: CustomSizes().dynamicWidth(context, 0.02)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs." +
                                  widget.productData["variants"]["edges"][0]
                                          ["node"]["compareAtPrice"]
                                      .toString(),
                              style: TextStyle(
                                  color: CustomColors.customGrey,
                                  fontSize: CustomSizes()
                                      .dynamicWidth(context, 0.035),
                                  decoration: TextDecoration.lineThrough),
                            ),
                            text(
                                context,
                                "Rs." +
                                    widget.productData["variants"]["edges"][0]
                                            ["node"]["price"]
                                        .toString(),
                                0.035,
                                CustomColors.customPink),
                            CustomSizes().widthBox(context, 0.4),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    CustomSizes().dynamicWidth(context, 0.013),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      CustomSizes()
                                          .dynamicWidth(context, 0.03)),
                                  color:
                                      CustomColors.customGrey.withOpacity(0.2)),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () => decrementCounter(),
                                    child: Icon(
                                      Icons.remove,
                                      color: CustomColors.customBlack,
                                      size: CustomSizes()
                                          .dynamicWidth(context, 0.042),
                                    ),
                                  ),
                                  CustomSizes().widthBox(context, 0.025),
                                  text(context, "$quantity", 0.042,
                                      CustomColors.customBlack),
                                  CustomSizes().widthBox(context, 0.025),
                                  InkWell(
                                    onTap: () => incrementCounter(),
                                    child: Icon(
                                      Icons.add,
                                      color: CustomColors.customBlack,
                                      size: CustomSizes()
                                          .dynamicWidth(context, 0.042),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        text(context, widget.productData["vendor"], 0.025,
                            CustomColors.customBlack,
                            bold: true),
                        text(context, widget.productData["title"], 0.055,
                            CustomColors.customBlack,
                            bold: true),
                        Divider(
                          thickness: CustomSizes().dynamicWidth(context, 0.002),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(context, "Delivery", 0.035,
                                CustomColors.customBlack,
                                bold: true),
                            text(context, "CHECK PINCODE", 0.035,
                                CustomColors.customPink,
                                bold: true),
                          ],
                        ),
                        customDeliveryText(context),
                        customExpandedTile(context, widget.productData),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
