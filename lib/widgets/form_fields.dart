import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

import '../utils/config.dart';

Widget inputTextField(context, label, myController,
    {function, function2, password = false}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(dynamicWidth(context, 0.04)),
    child: Container(
      color: myGrey.withOpacity(0.7),
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
        cursorColor: myBlack,
        cursorWidth: 2.0,
        cursorHeight: dynamicHeight(context, .03),
        style: TextStyle(
          color: myBlack,
          fontSize: dynamicWidth(context, .04),
        ),
        decoration: InputDecoration(
          hintText: "Type Something",
          hintStyle: const TextStyle(color: myWhite),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: noColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: noColor),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: myBlack),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: dynamicWidth(context, .05),
          ),
        ),
      ),
    ),
  );
}
