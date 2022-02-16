import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

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
        appBar:
            customAppBar(context, bottomText: true, title: "Jacket & Sweaters"),
        body: Padding(
          padding: EdgeInsets.only(
            top: CustomSizes().dynamicHeight(context, .02),
          ),
          child: FutureBuilder(
              future: getShopifyProductsBestSelling(),
              builder: (context, AsyncSnapshot snapshot) {
                return errorHandlingWidget(
                    context,
                    snapshot,
                    GridView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: (snapshot.data).length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            (CustomSizes().dynamicWidth(context, 0.5) /
                                CustomSizes().dynamicWidth(context, 0.6)),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return customGridCards(
                            context,
                            snapshot.data[index]["node"]["images"]["edges"][0]
                                ["node"]["src"],
                            snapshot.data[index]["node"]["vendor"],
                            snapshot.data[index]["node"]["title"],
                            snapshot.data[index]["node"]["variants"]["edges"][0]
                                ["node"]["compareAtPrice"],
                            snapshot.data[index]["node"]["variants"]["edges"][0]
                                ["node"]["price"]);
                      },
                    ));
              }),
        ),
      ),
    );
  }
}

errorHandlingWidget(context, AsyncSnapshot snaphot1, widget) {
  if (snaphot1.connectionState == ConnectionState.done) {
    if (snaphot1.data == false) {
      return text(context, "Retry", 0.04, CustomColors.customBlack);
    } else {
      return widget;
    }
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}
