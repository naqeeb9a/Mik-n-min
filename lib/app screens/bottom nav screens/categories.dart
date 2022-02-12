import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(Icons.close_rounded),
        ],
      ),
      content: SizedBox(
        width: CustomSizes().dynamicWidth(context, .9),
        height: CustomSizes().dynamicHeight(context, .9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          ],
        ),
      ),
      actions: <Widget>[
        Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
