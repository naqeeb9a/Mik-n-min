import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

customDrawer(
  context,
) {
  drawerRow(text1, imgPath) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: CustomColors.customGrey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          text(context, text1, 0.03, CustomColors.customBlack),
          Image.asset(
            imgPath,
            width: CustomSizes().dynamicWidth(context, 0.12),
          )
        ],
      ),
    );
  }

  return SafeArea(
    child: SizedBox(
      width: CustomSizes().dynamicWidth(context, 0.5),
      child: Drawer(
        child: Padding(
          padding:
              EdgeInsets.only(left: CustomSizes().dynamicWidth(context, 0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: CustomSizes().dynamicWidth(context, 0.1),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.close,
                  color: CustomColors.customGrey,
                ),
              ),
              drawerRow("New In", "assets/new in.png"),
              drawerRow("Boy", "assets/boy.png"),
              drawerRow("Gril", "assets/girl.png"),
              drawerRow("Foot wear", "assets/footweear.png"),
              drawerRow("Accessories", "assets/accessories.png"),
              drawerRow("Brands", "assets/brands.png"),
              SizedBox(
                height: CustomSizes().dynamicWidth(context, 0.01),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: CustomSizes().dynamicWidth(context, 0.04)),
                child: text(context, "About Us", 0.03, CustomColors.customBlack,
                    bold: true),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: CustomSizes().dynamicWidth(context, 0.04)),
                child: text(
                    context, "Contact Us", 0.03, CustomColors.customBlack,
                    bold: true),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: CustomSizes().dynamicWidth(context, 0.04)),
                child: text(
                    context, "Dark Mode", 0.03, CustomColors.customBlack,
                    bold: true),
              ),
              SizedBox(
                height: CustomSizes().dynamicWidth(context, 0.4),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
