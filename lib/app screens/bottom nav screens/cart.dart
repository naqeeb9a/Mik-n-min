import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: customDrawer(context),
      appBar: customAppBar(context),
      body: Column(
        children: [
          SizedBox(
            width: CustomSizes().dynamicWidth(context, 1),
            height: CustomSizes().dynamicHeight(context, 0.4),
            child: Column(
              children: [

                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: CustomSizes().dynamicWidth(context, 0.4),
                        height: CustomSizes().dynamicHeight(context, 0.3),
                        decoration: BoxDecoration(
                            color: CustomColors.customWhite,
                            borderRadius: BorderRadius.circular(
                              CustomSizes().dynamicWidth(context, 0.04),
                            ),
                            border: Border.all(
                              color: CustomColors.customGrey.withOpacity(0.5),
                              width: CustomSizes().dynamicWidth(context, 0.012),
                            ),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://st.depositphotos.com/2056297/2228/i/600/depositphotos_22286043-stock-photo-handsome-man.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      VerticalDivider(
                        thickness: CustomSizes().dynamicWidth(context, 0.002),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rs.3300",
                                style: TextStyle(
                                    color: CustomColors.customGrey,
                                    fontSize: CustomSizes()
                                        .dynamicWidth(context, 0.03),
                                    decoration: TextDecoration.lineThrough),
                              ),
                              CustomSizes().widthBox(context, 0.01),
                              text(context, "Rs.1678", 0.03,
                                  CustomColors.customPink),
                            ],
                          ),
                          text(context, "Cocobee", 0.025,
                              CustomColors.customBlack,
                              bold: true),
                          text(context, "Navy Melange Hoodie", 0.04,
                              CustomColors.customBlack,
                              bold: true),
                          CustomSizes().heightBox(context, 0.03),
                          Row(
                            children: [
                              text(context, "Size", 0.035, CustomColors.customBlack),
                              CustomSizes().widthBox(context, 0.03),
                              Container(
                                padding :EdgeInsets.symmetric(vertical :CustomSizes().dynamicHeight(context,0),horizontal:CustomSizes().dynamicWidth(context,0.002)),
                                decoration: BoxDecoration(
                                  border: Border.all(color: CustomColors.customBlack)
                                ),
                                child :Center(child: text (context,"5-6 YEARS",0.02,CustomColors.customBlack,bold:true)),
                              )
                            ],
                          ),
                           Row(
                            children: [
                              text(context, "Colors", 0.035, CustomColors.customBlack),
                              CustomSizes().widthBox(context, 0.03),
                              Icon(Icons.more_horiz,size:CustomSizes().dynamicHeight(context,0.04)),
                            ],
                          ),
                         // CustomSizes().dynamicHeight(context, dynamicSize)
                        ],

                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: CustomSizes().dynamicWidth(context, 0.002),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

