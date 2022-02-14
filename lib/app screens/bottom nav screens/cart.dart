import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
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
      appBar: customAppBar(context, "Shopping Cart"),
      body: Column(),
    );
  }
}

customAppBar(context, text1) {
  return AppBar(
    backgroundColor: CustomColors.noColor,
    elevation: 0,
    leading: const Icon(
      Icons.arrow_back_ios,
      color: CustomColors.customBlack,
    ),
    title: text(context, text1, 0.04, CustomColors.customBlack),
    centerTitle: true,
    actions: [
      Image(
        image: const AssetImage("assets/hamburger_menu.png"),
        width: CustomSizes().dynamicWidth(context, 0.05),
      )
    ],
  );
}
