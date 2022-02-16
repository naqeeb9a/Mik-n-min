import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class ConfirmOrder extends StatefulWidget {
  final String orderNumber;

  const ConfirmOrder({Key? key, this.orderNumber = ""}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  bool emailCheck = false;
  bool textCheck = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: customAppBar(context, onlyText: true, titleText: ""),
        endDrawer: customDrawer(context),
        backgroundColor: CustomColors.customWhite,
        body: SafeArea(
          child: Container(
            height: CustomSizes().dynamicHeight(context, 1),
            width: CustomSizes().dynamicWidth(context, 1),
            color: CustomColors.customPink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Thank you\n",
                        style: TextStyle(
                            fontFamily: "Aeonik",
                            fontSize:
                                CustomSizes().dynamicHeight(context, 0.045),
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customWhite),
                      ),
                      TextSpan(
                        text: "Order is confirmed",
                        style: TextStyle(
                          color: CustomColors.customWhite,
                          fontSize: CustomSizes().dynamicHeight(context, 0.038),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomSizes().heightBox(context, 0.05),
                coloredButton(
                  context,
                  "Order #123445234MKJ34",
                  CustomColors.customWhite,
                  fontColor: false,
                  width: CustomSizes().dynamicWidth(context, 0.6),
                ),
                CustomSizes().heightBox(context, 0.06),
                text(context, "You'll recieve conformation\nemail shortly",
                    0.04, CustomColors.customWhite,
                    alignText: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
