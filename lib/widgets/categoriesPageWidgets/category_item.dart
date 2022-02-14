import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/dynamic_sizes.dart';

categoryItems(context, index, text1, img) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      text(context, text1, 0.03, CustomColors.customBlack, bold: true),
      Image.network(
        img,
        width: CustomSizes().dynamicWidth(context, 0.15),
      )
    ],
  );
}
