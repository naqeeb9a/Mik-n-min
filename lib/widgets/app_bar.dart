import 'package:flutter/material.dart';

import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

appBar(
  context,
  GlobalKey<ScaffoldState> _key,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      text(
        context,
        "BuildYourCake",
        0.06,
        Colors.transparent,
        font: true,
      ),
      InkWell(
        onTap: () => _key.currentState!.openEndDrawer(),
        child: Image.asset(
          "assets/hamburger_menu.png",
          width: CustomSizes().dynamicWidth(context, 0.05),
        ),
      ),
    ],
  );
}
