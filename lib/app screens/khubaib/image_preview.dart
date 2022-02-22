import "package:flutter/material.dart";
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class ImagePreview extends StatefulWidget {
  final dynamic image;
  final String name;
  final int index ;
  const ImagePreview({this.image,required this.name, required this.index, Key? key}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        drawerScrimColor: CustomColors.customSkimColor,
        endDrawer: customDrawer(context),
        appBar: customAppBar(context),
        body: SafeArea(
          child: Stack(
            children: [
              Hero(
                 tag: 'tagImage${widget.index}',
                child: InteractiveViewer(
                  child: Container(
                        decoration: BoxDecoration(
                        color: CustomColors.customGrey.withOpacity(0.5),
                        image: DecorationImage(
                            image: NetworkImage(widget.image), fit: BoxFit.fitWidth)),

                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child :Container(
                   width: CustomSizes().dynamicWidth(context, 1),
                   height : CustomSizes().dynamicHeight(context,0.07),
                   decoration:  BoxDecoration(
                      color: CustomColors.customWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(CustomSizes().dynamicWidth(context, 0.065),),
                        topRight: Radius.circular(
                            CustomSizes().dynamicWidth(context, 0.065),
                          ),
                      ),
                    ),
                    child :Center(
                      child :text(context, widget.name, 0.05, CustomColors.customBlack,bold:true))
                    )

                )

            ],
          ),
        ),
      ),
    );
  }
}
