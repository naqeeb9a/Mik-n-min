import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
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
      content: StatefulBuilder(builder: (context, StateSetter setState) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    CustomSizes().dynamicWidth(context, .08),
                  ),
                ),
                child: Container(
                  height: CustomSizes().dynamicHeight(context, .5),
                  width: CustomSizes().dynamicWidth(context, .9),
                  decoration: BoxDecoration(
                    color: CustomColors.customWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        CustomSizes().dynamicWidth(context, .08),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
    // return AlertDialog(
    //   title: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: const [
    //       Icon(Icons.close_rounded),
    //     ],
    //   ),
    //   content: SizedBox(
    //     width: CustomSizes().dynamicWidth(context, 1),
    //     height: CustomSizes().dynamicHeight(context, .7),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Icon(Icons.arrow_drop_down),
    //       ],
    //     ),
    //   ],
    // );
  }
}
