import 'package:flutter/material.dart';
import 'package:mik_and_min/atif/product_array.dart';
import 'package:mik_and_min/widgets/app_bar.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/text_widget.dart';


class WishList extends StatefulWidget {
   const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      endDrawer: customDrawer(context),
      appBar: customAppBar(
        context,
        bottomText: true,
        title: "Wishlist",
      ),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          interactive: true,
          showTrackOnHover: true,
          trackVisibility: true,
          radius: const Radius.circular(50.0),
          thickness: CustomSizes().dynamicWidth(context, 0.012),
          hoverThickness: CustomSizes().dynamicWidth(context, 0.02),
          child: GridView.builder(
          primary: true,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            vertical: CustomSizes().dynamicHeight(context, 0.025),
            horizontal: CustomSizes().dynamicWidth(context,0.01),
          ),
          itemCount: wishlistArray.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (CustomSizes().dynamicWidth(context, 0.5) /
                CustomSizes().dynamicWidth(context, 0.6)),
          ),
          itemBuilder: (BuildContext context, int index) {
            return wishlistItem(
              context,
              wishlistArray,
              index,

            );
          },
        ),
        ),
      ),
    );
  }
}


Widget wishlistItem (context,productData,index) {
  return Column(
      children: [
        Container(
          width: CustomSizes().dynamicWidth(context, 0.42),
          height: CustomSizes().dynamicWidth(context, 0.4),
          decoration: BoxDecoration(
            color: CustomColors.customWhite,
            image: DecorationImage(
              image: NetworkImage(
                productData[index]["images"]["edges"][0]["node"]["src"],
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context,0.03)),
          ),
        ),
        SizedBox(
          width: CustomSizes().dynamicWidth(context, 0.42),
          height: CustomSizes().dynamicWidth(context, 0.17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    productData[index]["variants"]["edges"][0]["node"]
                        ["compareAtPrice"],
                    style: TextStyle(
                      color: CustomColors.customGrey,
                      fontSize: CustomSizes().dynamicHeight(context, 0.015),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  text(
                    context,
                    productData[index]["variants"]["edges"][0]["node"]["price"],
                    0.03,
                    CustomColors.customPink,
                  ),
                ],
              ),
              text(
                context,
                productData[index]["vendor"],
                0.026,
                CustomColors.customBlack,
              ),
              text(
                context,
                productData[index]["title"],
                0.03,
                CustomColors.customBlack,
                bold: true,
              ),
            ],
          ),
        ),
      
      ],
    );
}