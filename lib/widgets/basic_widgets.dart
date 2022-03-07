import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/khubaib/view_page.dart';
import 'package:mik_and_min/atif/product_array.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';

Widget chip(context, title) {
  return Container(
    height: CustomSizes().dynamicHeight(context, .03),
    decoration: BoxDecoration(
      color: CustomColors.customWhite,
      borderRadius: BorderRadius.all(
        Radius.circular(
          CustomSizes().dynamicWidth(context, 1),
        ),
      ),
      border: Border.all(color: CustomColors.customBlack),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: CustomSizes().dynamicWidth(context, .02),
    ),
    child: Center(
      child: text(
        context,
        title,
        0.022,
        CustomColors.customBlack,
      ),
    ),
  );
}

Widget customGridCards(context, productData,text1,image) {
  
  return InkWell(
    onTap: ()=>
        CustomRoutes().push(
      context,
      ViewPage(
        productData: productData,
        image: image,
        text1: text1,
      ),
    ),
    child: Column(
      children: [
        Container(
          width: CustomSizes().dynamicWidth(context, 0.42),
          height: CustomSizes().dynamicWidth(context, 0.4),
          decoration: BoxDecoration(
            color: CustomColors.customWhite,
            image: DecorationImage(
              image: NetworkImage(
                productData["images"]["edges"][0]["node"]["src"],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: CustomSizes().dynamicWidth(context, 0.42),
          height: CustomSizes().dynamicWidth(context, 0.15),
          color: CustomColors.customGrey.withOpacity(0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text(
                context,
                productData["vendor"],
                0.025,
                CustomColors.customBlack,
              ),
              text(
                context,
                productData["title"],
                0.025,
                CustomColors.customBlack,
                bold: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes().dynamicWidth(context, 0.02)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productData["variants"]["edges"][0]["node"]
                          ["compareAtPrice"],
                      style: TextStyle(
                        color: CustomColors.customGrey,
                        fontSize: CustomSizes().dynamicHeight(context, 0.012),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    text(
                      context,
                      productData["variants"]["edges"][0]["node"]["price"],
                      0.025,
                      CustomColors.customPink,
                    ),
                    GestureDetector(
                      onTap: () { 
                        
                        wishlistArray.add(productData);

                         ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: text(
                                    context, "Item Added to Wishlist", 0.06, CustomColors.customWhite),
                              ),
                            );
                         
                      },
                      child: wishlistIndex== 1 ? Icon(
                        Icons.star,
                        size: CustomSizes().dynamicHeight(context, 0.025),
                      ): Icon(
                        Icons.star_border_outlined,
                        size: CustomSizes().dynamicHeight(context, 0.025),
                      ),
                    ),
                  ],
                ),
              ),
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

Widget retry(context, {retryFunc = ""}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/oops.png",
        color: CustomColors.customGrey.withOpacity(0.4),
        width: CustomSizes().dynamicWidth(context, .24),
      ),
      CustomSizes().heightBox(context, .03),
      text(
        context,
        "Oops...",
        0.07,
        CustomColors.customBlack,
        alignText: TextAlign.center,
        bold: true,
      ),
      CustomSizes().heightBox(context, .03),
      Image.asset(
        "assets/no_net.png",
        color: CustomColors.customBlack,
        width: CustomSizes().dynamicWidth(context, .1),
      ),
      CustomSizes().heightBox(context, .02),
      text(
        context,
        "No Internet Connection",
        0.036,
        CustomColors.customBlack,
        alignText: TextAlign.center,
      ),
      retryFunc == "" ? CustomSizes().heightBox(context, .04) : 0.0,
      retryFunc == ""
          ? coloredButton(
              context,
              "Retry",
              CustomColors.customBlack,
              width: CustomSizes().dynamicWidth(context, .4),
              function: retryFunc == "" ? () {} : retryFunc,
            )
          : Container(),
    ],
  );
}
