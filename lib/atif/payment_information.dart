import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';
import '../widgets/buttons.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({Key? key}) : super(key: key);

  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}
int _groupValue = -1;
class _PaymentInfoState extends State<PaymentInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: customAppBar(context, onlyText: true, titleText: "PAYMENT"),
          endDrawer: customDrawer(context),
          body: Center(
            child: SizedBox(
              height: CustomSizes().dynamicHeight(context, 0.9),
              width: CustomSizes().dynamicWidth(context, 0.75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizes().heightBox(context, 0.06),
                  text(context, "Information", 0.07, CustomColors.customBlack,
                      bold: true),
                  CustomSizes().heightBox(context, 0.04),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.customGrey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          CustomSizes().dynamicWidth(context, 0.04),
                        ),
                      ),
                    ),
                    width: CustomSizes().dynamicWidth(context, 0.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSizes().heightBox(context, 0.02),
                        text(context, "   Mikail Mujtaba", 0.035,
                            CustomColors.customGrey),
                        text(context, "   PH.03##-#######", 0.035,
                            CustomColors.customGrey),
                        text(context, "   cmcmtech@gmail.com", 0.035,
                            CustomColors.customGrey),
                        CustomSizes().heightBox(context, 0.02),
                      ],
                    ),
                  ),
                  CustomSizes().heightBox(context, 0.06),
                  _myRadioButton(
                    title: "COD",
                    value: 1,
                    onChanged: (newValue) => setState(() => _groupValue = newValue),
                  ),_myRadioButton(
                    title: "Debit/Creddit Card 1",
                    value: 1,
                    onChanged: (newValue) => setState(() => _groupValue = newValue),
                  ),
                  CustomSizes().heightBox(context, 0.06),
                  Divider(
                    color: CustomColors.customBlack,
                  ),
                  CustomSizes().heightBox(context, 0.04),
                  text(context, "Shipping Address", 0.07, CustomColors.customBlack,
                      bold: true),
                  CustomSizes().heightBox(context, 0.03),
                  _myRadioButton(
                    title: "Use same shipping address",
                    value: 1,
                    onChanged: (newValue) => setState(() => _groupValue = newValue),
                  ),_myRadioButton(
                    title: "Use different shipping address",
                    value: 1,
                    onChanged: (newValue) => setState(() => _groupValue = newValue),
                  ),
                  CustomSizes().heightBox(context, 0.04),
                  Divider(
                    color: CustomColors.customBlack,
                  ),
                  CustomSizes().heightBox(context, 0.04),
                  RowPrice(context, "Order Summary", "PKR.2850", false,true),
                  RowPrice(context, "Shipping Charges", "PKR.100", false,true),
                  CustomSizes().heightBox(context, 0.06),
                  RowPrice(context, "Total:", "PKR.2940", true,true),
                  CustomSizes().heightBox(context, 0.1),
                  Center(
                    child: coloredButton(
                      context,
                      "COMPLETE ORDER",
                      CustomColors.customPink,
                      fontColor: true,
                      width: CustomSizes().dynamicWidth(context, 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget  RowPrice(context, text1, price, boldText,boldPrice) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      text(
        context,
        text1,
        0.035,
        CustomColors.customBlack,
        bold: boldText,
      ),
      CustomSizes().widthBox(context, 0.03),
      text(
        context,
        price,
        0.03,
        CustomColors.customPink,
        bold: boldPrice,
      )
    ],
  );
}



Widget _myRadioButton({required String title, required int value, onChanged}) {
  return RadioListTile(
    value: value,
    groupValue: _groupValue,
    onChanged: onChanged,
    title: Text(title),
  );
}