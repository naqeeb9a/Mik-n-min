import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

Widget text(context, text, size, color,
    {bold = false, alignText = TextAlign.start, maxLines = 2, font = false}) {
  return Text(
    text,
    textAlign: alignText,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontSize: dynamicWidth(context, size),
      fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
