import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';

import '../../utils/app_routes.dart';
import '../text_widget.dart';
import 'category_grid.dart';

Widget customCategoryDialogue(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        CustomSizes().dynamicWidth(context, .034),
      ),
    ),
    backgroundColor: CustomColors.noColor,
    insetPadding: EdgeInsets.all(
      CustomSizes().dynamicWidth(context, 0.04),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(
        CustomSizes().dynamicWidth(context, .034),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: CustomSizes().dynamicHeight(context, 0.02),
          ),
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 0.88),
          color: CustomColors.customWhite.withOpacity(.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizes().heightBox(context, 0.05),
              GestureDetector(
                onTap: () {
                  CustomRoutes().pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: CustomSizes().dynamicHeight(context, 0.01),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: CustomColors.customGrey,
                  ),
                ),
              ),
              CustomSizes().heightBox(context, 0.04),
              text(context, "Categories", 0.07, CustomColors.customBlack,
                  bold: true),
              CustomSizes().heightBox(context, 0.06),
              futureCategoryGrid(),
              const Align(
                alignment: Alignment.center,
                child: Icon(Icons.arrow_drop_down),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

futureCategoryGrid() {
  return FutureBuilder(
    future: getShopifyCategory(),
    builder: ((context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.data == false || snapshot.data == "Server Error") {
          return text(context, "Retry", 0.04, CustomColors.customBlack);
        } else {
          return Expanded(
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
                itemCount: (snapshot.data).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: CustomSizes().dynamicWidth(context, 0.4) /
                      CustomSizes().dynamicWidth(context, 0.2),
                  crossAxisSpacing: CustomSizes().dynamicHeight(context, 0.02),
                  mainAxisSpacing: CustomSizes().dynamicHeight(context, 0.02),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return categoryGrid(context, snapshot.data, index);
                },
              ),
            ),
          );
        }
      } else {
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    }),
  );
}
