import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customBlue,
        body: Center(
          child: Container(
            width: CustomSizes().dynamicWidth(context, .9),
            height: CustomSizes().dynamicHeight(context, .9),
            child: Categories(context),
          ),
        ),
      ),
    );
  }
}

Widget Categories(context) {
  return TextButton(
    onPressed: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => Material(
        color: CustomColors.noColor,
        child: Center(
          child: Container(
            width: CustomSizes().dynamicWidth(context, .9),
            height: CustomSizes().dynamicHeight(context, .85),
            color: CustomColors.customWhite.withOpacity(0.75),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: CustomSizes().dynamicHeight(context, 0.04),
                  horizontal: CustomSizes().dynamicWidth(context, 0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      CustomRoutes().pop(context);
                    },
                    child: Icon(Icons.clear_outlined),
                  ),
                  CustomSizes().heightBox(context, 0.03),
                  text(context, "Categories", 0.07, CustomColors.customBlack,
                      bold: true),
                  CustomSizes().heightBox(context, 0.04),
                  Container(
                    height: CustomSizes().dynamicHeight(context, 0.62),
                    width: CustomSizes().dynamicWidth(context, 0.8),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: 6,
                        itemBuilder: (BuildContext i, index) {
                          return CategoriesItemCard(context, "item", "data:image/png;base64,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");
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    child: const Text('Show Dialog'),
  );
}

Widget CategoriesItemCard(context,text,image){
  return Container(
    width: CustomSizes().dynamicWidth(context, 0.07),
    height: CustomSizes().dynamicHeight(context, 0.08),
    child: Row(
      children: [
          text(context, text, 0.045, CustomColors.customBlack,),
        Image.network(image)
      ],
    ),
  );
}