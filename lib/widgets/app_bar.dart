import 'package:flutter/material.dart';

import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

appBar(context) {
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
      Icon(
        Icons.menu,
        size: CustomSizes().dynamicWidth(context, 0.1),
      ),
    ],
  );
}
