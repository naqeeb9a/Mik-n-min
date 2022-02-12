import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/form_fields.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
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
                    "Register",
                    .08,
                    CustomColors.customWhite,
                    bold: true,
                  ),
                  CustomSizes().heightBox(context, .06),
                  text(
                    context,
                    "Name",
                    .05,
                    CustomColors.customWhite,
                  ),
                  SizedBox(
                    width: CustomSizes().dynamicWidth(context, .7),
                    child: inputTextField(
                      context,
                      "Email",
                      name,
                    ),
                  ),
                  CustomSizes().heightBox(context, .04),
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
                  CustomSizes().heightBox(context, .04),
                  text(
                    context,
                    "Password",
                    .05,
                    CustomColors.customWhite,
                  ),
                  SizedBox(
                    width: CustomSizes().dynamicWidth(context, .7),
                    child: inputTextField(
                      context,
                      "Password",
                      password,
                    ),
                  ),
                  CustomSizes().heightBox(context, .04),
                  coloredButton(
                    context,
                    "SIGN UP",
                    CustomColors.customPink,
                    width: CustomSizes().dynamicWidth(context, .5),
                  ),
                  CustomSizes().heightBox(context, .04),
                  richTextWidget(
                    context,
                    "Already have an account? ",
                    "\nLog In Here",
                    CustomSizes().dynamicWidth(context, .04),
                    CustomSizes().dynamicWidth(context, .04),
                    true,
                    CustomColors.customWhite,
                    CustomColors.customWhite,
                    false,
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
