import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import '../text_widget.dart';

customDeliveryText(context) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: CustomSizes().dynamicWidth(context, 0.04),
        vertical: CustomSizes().dynamicWidth(context, 0.02)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(context, "✔️ Out in 2-3 days", 0.025, CustomColors.customBlack),
        text(context, "✔️ Enter your pincode for accurate delivery details",
            0.025, CustomColors.customBlack),
        text(context, "✔️ Cash on delivery available", 0.025,
            CustomColors.customBlack),
        text(context, "✔️ 15 days return", 0.025, CustomColors.customBlack),
        text(context, "✔️ 15 days exchange", 0.025, CustomColors.customBlack),
      ],
    ),
  );
}
