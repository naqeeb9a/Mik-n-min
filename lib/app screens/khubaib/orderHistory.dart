import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/shopify_functions.dart';

class OrderHistory extends StatefulWidget {
  final String text1;
  const OrderHistory({required this.text1, Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      endDrawer: customDrawer(context),
      appBar: customAppBar(context, bottomText: true, title: widget.text1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: CustomSizes().dynamicHeight(context, .025),
          ),
          child: FutureBuilder(
            future : getUserOrders(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              return errorHandlingOrderHistory(context,snapshot);
            }
          ),
        ),
      ),
    );
  }
}

errorHandlingOrderHistory(context,AsyncSnapshot snapshot1){
  if (snapshot1.connectionState == ConnectionState.done) {
    if (snapshot1.data == false || snapshot1.data == "Server Error") {
      return Center(
          child: text(context, "Retry", 0.04, CustomColors.customBlack));
    } else if (snapshot1.data.length == 0) {
      return Center(
          child: text(context, "No Order History", 0.04, CustomColors.customBlack));
    } else {
      print(snapshot1.data);
      return Scrollbar(
              isAlwaysShown: true,
              interactive: true,
              showTrackOnHover: true,
              trackVisibility: true,
              radius: const Radius.circular(50.0),
              thickness: CustomSizes().dynamicWidth(context, 0.012),
              hoverThickness: CustomSizes().dynamicWidth(context, 0.02),
              child: ListView.builder(
                itemCount: (snapshot1.data).length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return orderHistoryCard(context,index);
                },
              ),
            );
    }
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}



Widget orderHistoryCard(context,index) {
  return SizedBox(
                  width: CustomSizes().dynamicWidth(context, 0.05),
                  height: CustomSizes().dynamicHeight(context, 0.08),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                CustomSizes().dynamicWidth(context, 0.045)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                                context,
                                "${index + 1}. Order #MIKNMIN5460${index + 1}",
                                0.03,
                                CustomColors.customGrey),
                            const SizedBox(),
                            index == 2 
                                ? text(context, "Confirmed", 0.03,
                                    CustomColors.customGrey)
                                :index ==4 ? Container(
                              padding: EdgeInsets.symmetric(vertical :CustomSizes().dynamicHeight(context,0.001),horizontal :CustomSizes().dynamicWidth(context,0.05)),
                              decoration : BoxDecoration(
                                  color: CustomColors.customPink,
                                  borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
                              ),
                              child :text(context, "Track", 0.03, CustomColors.customWhite,bold :true),
                            ):index ==5? Container(
                              padding: EdgeInsets.symmetric(vertical :CustomSizes().dynamicHeight(context,0.001),horizontal :CustomSizes().dynamicWidth(context,0.05)),
                              decoration : BoxDecoration(
                                  color: CustomColors.customPink,
                                  borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context, 1)),
                              ),
                              child :text(context, "Track", 0.03, CustomColors.customWhite,bold :true),
                            ):text(context, "Delivered", 0.03,
                                       CustomColors.customGrey),
                           
                          ],
                        ),
                      ),
                      CustomSizes().heightBox(context, 0.03),
                      Divider(thickness: CustomSizes().dynamicWidth(context, 0.0015),),
                    ],
                  ),
                );
}