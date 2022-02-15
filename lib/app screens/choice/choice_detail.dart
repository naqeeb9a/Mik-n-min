import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/bottom%20nav%20screens/tabbar.dart';

// import 'package:mik_and_min/app%20screens/khubaib/category_detail.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';

class ChoiceDetail extends StatefulWidget {
  final String label, image;

  const ChoiceDetail({Key? key, required this.label, required this.image})
      : super(key: key);

  @override
  _ChoiceDetailState createState() => _ChoiceDetailState();
}

class _ChoiceDetailState extends State<ChoiceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: CustomSizes().dynamicWidth(context, 1),
        height: CustomSizes().dynamicHeight(context, 1),
        child: Stack(
          children: [
            Container(
              width: CustomSizes().dynamicWidth(context, 1),
              height: CustomSizes().dynamicHeight(context, 1),
              decoration: BoxDecoration(
                color: CustomColors.customPink,
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 1),
                decoration: BoxDecoration(
                  color: CustomColors.customBlack.withOpacity(.4),
                ),
              ),
            ),
            Center(
              child: text(
                context,
                widget.label,
                .12,
                CustomColors.customWhite,
                bold: true,
              ),
            ),
            Positioned(
              bottom: CustomSizes().dynamicHeight(context, .02),
              child: SizedBox(
                width: CustomSizes().dynamicWidth(context, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        CustomRoutes().push(context, const CustomTabBar());
                      },
                      child: ChoiceChip(
                        label: text(
                          context,
                          "1-3 YEARS",
                          .04,
                          CustomColors.customBlack,
                          bold: true,
                        ),
                        selected: true,
                        backgroundColor: CustomColors.customWhite,
                      ),
                    ),
                    const ChoiceChip(
                      label: Text("3-6 YEARS"),
                      selected: true,
                    ),
                    const ChoiceChip(
                      label: Text("6+ YEARS"),
                      selected: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
