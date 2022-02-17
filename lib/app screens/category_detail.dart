import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../widgets/app_bar.dart';
import '../widgets/basic_widgets.dart';

class CategoryDetail extends StatefulWidget {
  final dynamic function, text1;
  const CategoryDetail({Key? key, this.text1, this.function}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      endDrawer: customDrawer(context),
      appBar: customAppBar(context,
          bottomText: true, title: widget.text1 ?? ""),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: CustomSizes().dynamicHeight(context, .02),
          ),
          child: widget.function != null
              ? FutureBuilder(
                  future: widget.function,
                  builder: (context, AsyncSnapshot snapshot) {
                    return errorHandlingWidget(
                      context,
                      snapshot,
                    );
                  })
              : FutureBuilder(
                  future: getShopifyProductsBestSelling(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return errorHandlingWidget(
                      context,
                      snapshot,
                    );
                  }),
        ),
      ),
    );
  }
}

errorHandlingWidget(
  context,
  AsyncSnapshot snaphot1,
) {
  if (snaphot1.connectionState == ConnectionState.done) {
    if (snaphot1.data == false || snaphot1.data == "Server Error") {
      return Center(
          child: text(context, "Retry", 0.04, CustomColors.customBlack));
    } else if (snaphot1.data.length == 0) {
      return Center(
          child: text(context, "No products", 0.04, CustomColors.customBlack));
    } else {
      return GridView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: (snaphot1.data).length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (CustomSizes().dynamicWidth(context, 0.5) /
              CustomSizes().dynamicWidth(context, 0.6)),
        ),
        itemBuilder: (BuildContext context, int index) {
          return customGridCards(
            context,
            snaphot1.data[index]["node"],
          );
        },
      );
    }
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}
