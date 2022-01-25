import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

appBar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        Icons.notes_outlined,
        size: dynamicWidth(context, 0.1),
      ),
      text(
        context,
        "BuildYourCake",
        0.06,
        myBlack,
        font: true,
      ),
    ],
  );
}
