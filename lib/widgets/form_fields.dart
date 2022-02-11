import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/constants.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import '../utils/config.dart';

Widget inputTextField(context, label, myController,
    {function, function2, password = false}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.04)),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (function == "")
          ? () {
              return null;
            }
          : function,
      controller: myController,
      textInputAction: TextInputAction.next,
      keyboardType: password == true
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: password == true ? obscureText : false,
      cursorColor: CustomColors.customWhite,
      cursorWidth: 2.0,
      cursorHeight: CustomSizes().dynamicHeight(context, .03),
      style: TextStyle(
        color: CustomColors.customWhite,
        fontSize: CustomSizes().dynamicWidth(context, .04),
      ),
      decoration: InputDecoration(

        hintStyle: const TextStyle(color: CustomColors.customWhite),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.customWhite),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.customWhite),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.customWhite),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: CustomSizes().dynamicWidth(context, .05),
        ),
      ),
    ),
  );
}
