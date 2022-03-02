import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';
import '../widgets/app_bar.dart';
import '../widgets/basic_widgets.dart';

class CategoryDetail extends StatefulWidget {
  final dynamic function,image, text1;
  const CategoryDetail({Key? key, this.text1,this.image, this.function}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    // print(widget.image);

    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      endDrawer: customDrawer(context),
      appBar: customAppBar(context,
          bottomText: true, title: widget.text1 ?? "",image: widget.image),
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
                      widget.text1,
                        widget.image,
                    );
                  })
              : FutureBuilder(
                  future: getShopifyProductsBestSelling(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return errorHandlingWidget(
                      context,
                      snapshot,
                      widget.text1,
                        widget.image,
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
    text1,image
) {
  if (snaphot1.connectionState == ConnectionState.done) {
    if (snaphot1.data == false || snaphot1.data == "Server Error") {
      return Center(
          child: text(context, "Retry", 0.04, CustomColors.customBlack));
    } else if (snaphot1.data.length == 0) {
      return Center(
          child: text(context, "No products", 0.04, CustomColors.customBlack));
    } else {
      return Scrollbar(
        isAlwaysShown: true,
        interactive: true,
        showTrackOnHover: true,
        trackVisibility: true,
        radius: const Radius.circular(50.0),
        thickness: CustomSizes().dynamicWidth(context, 0.012),
        hoverThickness: CustomSizes().dynamicWidth(context, 0.02),
        child: GridView.builder(
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
              text1,
              image,
            );
          },
        ),
      );
    }
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}
