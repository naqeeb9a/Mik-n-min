import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/choice/choice_detail.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class Choice extends StatefulWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            choiceCard(context, "Boy", "assets/choice_boy.png"),
            CustomSizes().heightBox(context, .06),
            choiceCard(context, "Girl", "assets/choice_girl.png"),
          ],
        ),
      ),
    );
  }
}

Widget choiceCard(context, label, image) {
  return GestureDetector(
    onTap: () {
      CustomRoutes().push(
        context,
        ChoiceDetail(label: label, image: image),
      );
    },
    child: Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: CustomSizes().dynamicHeight(context, .08),
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
                width: CustomSizes().dynamicWidth(context, 1),
              ),
            ),
          ),
          CustomSizes().heightBox(context, .014),
          text(
            context,
            label,
            .05,
            CustomColors.customBlack,
            bold: true,
          ),
        ],
      ),
    ),
  );
}
