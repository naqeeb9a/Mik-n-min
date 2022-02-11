import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/carosual_widget.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            homeSlider(context),
            text(context, text, 0.04, CustomColors.customBlack)
          ],
        ),
      ),
    );
  }
}
