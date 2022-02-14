import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SlideTransition(
      position: _offsetAnimation,
      child: SafeArea(
          child: Dialog(
        insetPadding: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.02)),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: CustomSizes().dynamicHeight(context, 0.02)),
          width: CustomSizes().dynamicWidth(context, 1),
          height: CustomSizes().dynamicHeight(context, 0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizes().heightBox(context, 0.1),
              InkWell(
                onTap: () {
                  CustomRoutes().pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: CustomColors.customGrey,
                ),
              ),
              CustomSizes().heightBox(context, 0.06),
              text(context, "Categories", 0.07, CustomColors.customBlack,
                  bold: true),
              Expanded(
                child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            CustomSizes().dynamicWidth(context, 0.4) /
                                CustomSizes().dynamicWidth(context, 0.2),
                        crossAxisSpacing:
                            CustomSizes().dynamicHeight(context, 0.02),
                        mainAxisSpacing:
                            CustomSizes().dynamicHeight(context, 0.02)),
                    itemBuilder: (context, index) {
                      return categoryItems(context, index, "item",
                          "https://www.kindpng.com/picc/m/9-93354_tshirt-fully-transparent-background-t-shirt-clip-art.png");
                    }),
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.arrow_drop_down))
            ],
          ),
        ),
      )),
    );
  }
}

categoryItems(context, index, text1, img) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      text(context, text1, 0.03, CustomColors.customBlack, bold: true),
      Image.network(
        img,
        width: CustomSizes().dynamicWidth(context, 0.15),
      )
    ],
  );
}
