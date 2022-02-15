import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';

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
        appBar: customAppBar(context, bottomText: true, title: "Jacket & Sweaters"),
        body: Padding(
          padding: EdgeInsets.only(
            top: CustomSizes().dynamicHeight(context, .02),
          ),
          child: GridView.builder(
            primary: true,
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (CustomSizes().dynamicWidth(context, 0.5) /
                  CustomSizes().dynamicWidth(context, 0.6)),
            ),
            itemBuilder: (BuildContext context, int index) {
              return customGridCards(context, "assets/shirt.png", "CocoBee",
                  "Teal Turquoise Hoodie", "Rs.3190", "Rs.1569");
            },
          ),
        ),
      ),
    );
  }
}
