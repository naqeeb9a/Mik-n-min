import 'package:card_swiper/card_swiper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

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
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            coloredButton(context, "ADD TO CART", CustomColors.customPink,
                width: CustomSizes().dynamicWidth(context, 0.8)),
          ],
        ),
        endDrawer: customDrawer(context),
        appBar: bar2(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: CustomSizes().dynamicHeight(context, 0.47),
                child: Stack(
                  children: [
                    Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(
                            CustomSizes().dynamicWidth(context, 0.02),
                          ),
                          child: Container(
                            color: CustomColors.customGrey.withOpacity(0.2),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, 0.02),
                                ),
                                child: Container(
                                    color: CustomColors.customWhite,
                                    child: Center(
                                        child: text(context, "image", 0.03,
                                            CustomColors.customBlack))),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 3,
                      autoplay: true,
                      itemWidth: CustomSizes().dynamicWidth(context, 0.8),
                      itemHeight: CustomSizes().dynamicHeight(context, 0.38),
                      layout: SwiperLayout.TINDER,
                      pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                            activeColor: CustomColors.customGrey,
                            color: CustomColors.customBlack),
                      ),
                    ),
                    Positioned(
                        bottom: CustomSizes().dynamicWidth(context, 0.025),
                        right: CustomSizes().dynamicWidth(context, 0.055),
                        child: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  if (index == 1) {
                                    index = 0;
                                  } else if (index != 1) {
                                    index = 1;
                                  }
                                },
                              );
                            },
                            child: index == 1
                                ? const Icon(
                                    Icons.star,
                                    color: CustomColors.customPink,
                                  )
                                : const Icon(Icons.star_border_outlined))),
                  ],
                ),
              ),
              Divider(
                thickness: CustomSizes().dynamicWidth(context, 0.002),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, 0.075),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rs.3190",
                              style: TextStyle(
                                  color: CustomColors.customGrey,
                                  fontSize: CustomSizes()
                                      .dynamicWidth(context, 0.035),
                                  decoration: TextDecoration.lineThrough),
                            ),
                            CustomSizes().widthBox(context, 0.01),
                            text(context, "Rs.1569", 0.035,
                                CustomColors.customPink),
                          ],
                        ),
                        text(
                            context, 'Cocobee', 0.025, CustomColors.customBlack,
                            bold: true),
                        text(context, "Navy Melange Hoodie", 0.055,
                            CustomColors.customBlack,
                            bold: true),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  CustomSizes().dynamicWidth(context, 0.013),),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  CustomSizes().dynamicWidth(context, 0.03)),
                              color: CustomColors.customGrey.withOpacity(0.2)),
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
                  ],
                ),
              ),
              Divider(
                thickness: CustomSizes().dynamicWidth(context, 0.002),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, 0.075),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(context, "Size Chart", 0.035, CustomColors.customBlack,
                        bold: true),
                     Image.asset('assets/size.png'),
                    
                  ],
                ),
              ),
              Divider(
                thickness: CustomSizes().dynamicWidth(context, 0.002),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, 0.075),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(context, "Delivery", 0.035, CustomColors.customBlack,
                        bold: true),
                    text(context, "CHECK PINCODE", 0.035,
                        CustomColors.customPink,
                        bold: true),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, 0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: CustomSizes().dynamicWidth(context, 0.04),
                        ),
                        text(context, "Out in 2-3 days", 0.025,
                            CustomColors.customBlack),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: CustomSizes().dynamicWidth(context, 0.04),
                        ),
                        text(
                            context,
                            "Enter your pincode for accurate delivery details",
                            0.025,
                            CustomColors.customBlack),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: CustomSizes().dynamicWidth(context, 0.04),
                        ),
                        text(context, "Cash on delivery available", 0.025,
                            CustomColors.customBlack),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: CustomSizes().dynamicWidth(context, 0.04),
                        ),
                        text(context, "15 days return", 0.025,
                            CustomColors.customBlack),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: CustomSizes().dynamicWidth(context, 0.04),
                        ),
                        text(context, "15 days exchange", 0.025,
                            CustomColors.customBlack),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: CustomSizes().dynamicWidth(context, 0.002),
              ),
              ExpansionTile(
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes().dynamicWidth(context, 0.05),
                  ),
                  child: text(context, "Product Details", 0.03,
                      CustomColors.customBlack,
                      bold: true),
                ),
                trailing :  Icon(
                        Icons.arrow_drop_down,
                        size: CustomSizes().dynamicWidth(context, 0.05),
                      ),
                initiallyExpanded : false,
                tilePadding: EdgeInsets.all(0),
                childrenPadding :EdgeInsets.zero,
              children: [
                text(context, "A Flutter widget that can be expanded or collapsed by clicking on a header or an icon.", 0.03, CustomColors.customBlack),
              ],
                
              ),
              Divider(
                thickness: CustomSizes().dynamicWidth(context, 0.002),
              ),
            ],
          ),
        ),
      ),
    );
  }
}