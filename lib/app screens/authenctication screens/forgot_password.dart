import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/form_fields.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: CustomSizes().dynamicWidth(context, 1),
              height: CustomSizes().dynamicHeight(context, 1),
              decoration: const BoxDecoration(
                color: CustomColors.customPink,
                image: DecorationImage(
                  image: AssetImage("assets/login_bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: CustomSizes().dynamicWidth(context, 1),
                height: CustomSizes().dynamicHeight(context, 1),
                decoration: BoxDecoration(
                  color: CustomColors.customBlack.withOpacity(.28),
                ),
              ),
            ),
            SizedBox(
              width: CustomSizes().dynamicWidth(context, 1),
              height: CustomSizes().dynamicHeight(context, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(
                    context,
                    "Forgot Password?",
                    .08,
                    CustomColors.customWhite,
                    bold: true,
                  ),
                  CustomSizes().heightBox(context, .06),
                  text(
                    context,
                    "Email",
                    .05,
                    CustomColors.customWhite,
                  ),
                  SizedBox(
                    width: CustomSizes().dynamicWidth(context, .7),
                    child: inputTextField(
                      context,
                      "Email",
                      email,
                    ),
                  ),
                  CustomSizes().heightBox(context, .03),
                  coloredButton(
                    context,
                    "Send Verification code",
                    CustomColors.customPink,
                    width: CustomSizes().dynamicWidth(context, .5),
                    fontSize: .034,
                    function: () {
                      CustomRoutes().pop(context);
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
