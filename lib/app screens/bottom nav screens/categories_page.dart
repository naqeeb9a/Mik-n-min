
import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';
import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/categoriesPageWidgets/category_grid.dart';
import '../../widgets/text_widget.dart';

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: SafeArea(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  CustomSizes().dynamicWidth(context, .034),
                ),
              ),
              backgroundColor: CustomColors.customWhite.withOpacity(.96),
              insetPadding: EdgeInsets.all(
                CustomSizes().dynamicWidth(context, 0.04),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSizes().dynamicHeight(context, 0.02),
                ),
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 0.88),
                color: CustomColors.noColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSizes().heightBox(context, 0.06),
                    GestureDetector(
                      onTap: () {
                        CustomRoutes().pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: CustomSizes().dynamicHeight(context, 0.01),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: CustomColors.customGrey,
                        ),
                      ),
                    ),
                    CustomSizes().heightBox(context, 0.04),
                    text(context, "Categories", 0.07, CustomColors.customBlack,
                        bold: true),
                    CustomSizes().heightBox(context, 0.06),
                    categoryGrid(context),
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
