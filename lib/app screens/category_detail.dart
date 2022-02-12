import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/landing%20Page%20Widgets/drawer.dart';

import '../widgets/app_bar.dart';
import '../widgets/basic_widgets.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        endDrawer: customDrawer(context),
        appBar: bar2(context, bottomText: true, title: "Jacket & Sweaters"),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: CustomSizes().dynamicHeight(context, .02),
          ),
          child: SizedBox(
            width: CustomSizes().dynamicWidth(context, 1),
            child: GridView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (45.0 / 60.0),
              ),
              itemBuilder: (BuildContext context, int index) {
                return card(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
