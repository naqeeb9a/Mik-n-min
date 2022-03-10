import "package:flutter/material.dart";

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/text_widget.dart';
import '../authenctication screens/login.dart';

class TrackOrder extends StatefulWidget {
  final String text1;
  const TrackOrder({required this.text1, Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      endDrawer: customDrawer(context),
      appBar: customAppBar(context, bottomText: true, title: "Track Order"),
      body: globalAccessToken.isEmpty?Center(
        child :text(context , "No Register Account\nFirst you have to Login",0.03,CustomColors.customBlack),
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: CustomSizes().dynamicWidth(context, 0.045),
                vertical: CustomSizes().dynamicHeight(context, 0.025)),
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicWidth(context, 0.04),
                ),
                decoration: BoxDecoration(
                  color: CustomColors.customPink,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 1),
                  ),
                ),
                child: text(context, widget.text1.toUpperCase(), 0.04,
                    CustomColors.customWhite)),
          ),
          SizedBox(
            height: CustomSizes().dynamicHeight(context, 0.19),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: CustomSizes().dynamicHeight(context, 0.01),
                        horizontal: CustomSizes().dynamicWidth(context, 0.045),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          index == 0 ? text(context, "${index + 1}. Confirmed", 0.035,
                                  CustomColors.customGrey)
                              :index ==1 ?text(context, "${index + 1}. Dispatched", 0.035,
                              CustomColors.customGrey) : text(context, "${index + 1}. Delivered",
                                      0.035, CustomColors.customGrey),
                          index == 2 ?const SizedBox(): Icon(
                                  Icons.circle,
                                  color: CustomColors.customBlue,
                                  size: CustomSizes()
                                      .dynamicHeight(context, 0.012),
                                ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: CustomSizes().dynamicWidth(context,0.015),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
