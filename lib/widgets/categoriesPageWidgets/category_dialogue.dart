import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/categoriesPageWidgets/category_grid.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/app_routes.dart';
import '../../utils/config.dart';

customDialogue(context) {
  return Dialog(
    insetPadding: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.02)),
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: CustomSizes().dynamicHeight(context, 0.02)),
      width: CustomSizes().dynamicWidth(context, 1),
      height: CustomSizes().dynamicHeight(context, 0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSizes().heightBox(context, 0.1),
          InkWell(
            onTap: () {
              CustomRoutes().pop(context);
            },
            child: const Icon(
              Icons.close,
              color: CustomColors.customGrey,
            ),
          ),
          CustomSizes().heightBox(context, 0.06),
          text(context, "Categories", 0.07, CustomColors.customBlack,
              bold: true),
          categoryGrid(context),
          const Align(
              alignment: Alignment.center, child: Icon(Icons.arrow_drop_down))
        ],
      ),
    ),
  );
}
