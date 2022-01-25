import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../utils/config.dart';

Widget coloredButton(context, text, color,
    {function = "", width = "", fontSize = 0.04}) {
  return GestureDetector(
    onTap: function == "" ? () {} : function,
    child: Container(
      width: width == "" ? dynamicWidth(context, 1) : width,
      height: dynamicWidth(context, .12),
      decoration: color == noColor
          ? BoxDecoration(
              color: color,
              border: Border.all(width: 1, color: myWhite),
            )
          : BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                dynamicWidth(
                  context,
                  0.03,
                ),
              ),
            ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: myWhite,
            fontWeight: FontWeight.bold,
            fontSize: dynamicWidth(context, fontSize),
          ),
        ),
      ),
    ),
  );
}

Widget retry(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // LottieBuilder.asset(
        //   "assets/retry.json",
        //   width: dynamicWidth(context, 0.4),
        //   repeat: false,
        // ),
        heightBox(context, 0.02),
        text(context, "Check your internet or try again later", 0.03, myWhite),
        heightBox(context, 0.1),
        coloredButton(
          context,
          "Retry",
          myPink,
          width: dynamicWidth(context, .4),
          function: () {},
        ),
      ],
    ),
  );
}
