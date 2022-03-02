import 'package:flutter/material.dart';
import 'package:mik_and_min/atif/product_array.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController promoCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      bottomNavigationBar: cartBottomBar(context),
      endDrawer: customDrawer(context),
      appBar: customAppBar(context, onlyText: true, titleText: "Cart"),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          interactive: true,
          showTrackOnHover: true,
          trackVisibility: true,
          radius: const Radius.circular(50.0),
          thickness: CustomSizes().dynamicWidth(context, 0.012),
          hoverThickness: CustomSizes().dynamicWidth(context, 0.02),
          child: ListView.builder(
            itemCount: productArray.length,
            itemBuilder: (BuildContext context, int index) {
              return cartItem(
                context,
                productArray,
                index,
                () {
                  setState(
                    () {},
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget cartItem(context, productData, index, setState) {
// print(productData);
  return SizedBox(
    width: CustomSizes().dynamicWidth(context, 1),
    height: CustomSizes().dynamicHeight(context, 0.28),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSizes().heightBox(context, 0.02),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: CustomSizes().dynamicWidth(context, 0.4),
                height: CustomSizes().dynamicHeight(context, 0.22),
                decoration: BoxDecoration(
                    color: CustomColors.customWhite,
                    borderRadius: BorderRadius.circular(
                      CustomSizes().dynamicWidth(context, 0.04),
                    ),
                    border: Border.all(
                      color: CustomColors.customGrey.withOpacity(0.5),
                      width: CustomSizes().dynamicWidth(context, 0.012),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                          productData[index]["images"]["edges"][0]["node"]
                              ["src"],
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes().dynamicWidth(context, 0.01)),
                child: VerticalDivider(
                  thickness: CustomSizes().dynamicWidth(context, 0.002),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rs." +
                                    productData[index]["variants"]["edges"][0]
                                            ["node"]["compareAtPrice"]
                                        .toString(),
                                style: TextStyle(
                                    color: CustomColors.customGrey,
                                    fontSize: CustomSizes()
                                        .dynamicWidth(context, 0.03),
                                    decoration: TextDecoration.lineThrough),
                              ),
                              CustomSizes().widthBox(context, 0.01),
                              text(
                                  context,
                                  "Rs." +
                                      productData[index]["variants"]["edges"][0]
                                              ["node"]["price"]
                                          .toString(),
                                  0.03,
                                  CustomColors.customPink),
                            ],
                          ),
                          CustomSizes().heightBox(context, 0.02),
                          text(context, productData[index]["vendor"], 0.03,
                              CustomColors.customBlack,
                              bold: true),
                          CustomSizes().heightBox(context, 0.03),
                          text(context, productData[index]["title"], 0.04,
                              CustomColors.customBlack,
                              bold: true),
                          CustomSizes().heightBox(context, 0.03),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      productArray.remove(productData[index]);
                      setState();
                    },
                    child: const Icon(Icons.delete),
                  ),
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
  );
}

Widget cartBottomBar(context) {
  return Container(
    width: CustomSizes().dynamicWidth(context, 1),
    height: CustomSizes().dynamicHeight(context, 0.2),
    decoration: const BoxDecoration(
      color: CustomColors.customWhite,
      border: Border(
        top: BorderSide(
          color: CustomColors.customBlue,
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        top: CustomSizes().dynamicHeight(context, 0.01),
        bottom: CustomSizes().dynamicHeight(context, 0.08),
        right: CustomSizes().dynamicWidth(context, 0.05),
        left: CustomSizes().dynamicWidth(context, 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  text(context, "Promo Code", 0.03, CustomColors.customBlack),
                  CustomSizes().widthBox(context, 0.02),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.customBlack),
                      ),
                      child: SizedBox(
                        width: CustomSizes().dynamicWidth(context, 0.15),
                        height: CustomSizes().dynamicHeight(context, 0.015),
                      ))
                ],
              ),
              Row(
                children: [
                  text(
                    context,
                    "Total amount:",
                    0.04,
                    CustomColors.customBlack,
                    bold: true,
                  ),
                  CustomSizes().widthBox(context, 0.02),
                  text(
                    context,
                    "Rs.2840",
                    0.04,
                    CustomColors.customBlack,
                    bold: true,
                  ),
                ],
              ),
            ],
          ),
          coloredButton(
            context,
            "CHECKOUT",
            CustomColors.customPink,
            width: CustomSizes().dynamicWidth(context, 0.6),
          )
        ],
      ),
    ),
  );
}
