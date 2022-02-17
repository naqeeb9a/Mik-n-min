import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/forgot_password.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/sign_in.dart';
import 'package:mik_and_min/app%20screens/choice/choice.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/form_fields.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      body: SafeArea(
        child: Stack(
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
                    "Login",
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
                      white: true,
                      function: (value) {
                        if (EmailValidator.validate(value)) {
                        } else {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
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
                      white: true,
                      function: (value) {
                        if (value.toString().isNotEmpty) {
                        } else {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomSizes().heightBox(context, .01),
                  GestureDetector(
                    onTap: () {
                      CustomRoutes().push(
                        context,
                        const ForgotPassword(),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: CustomSizes().dynamicHeight(context, .01),
                        bottom: CustomSizes().dynamicHeight(context, .01),
                        right: CustomSizes().dynamicWidth(context, .18),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: text(
                          context,
                          "Forgot Password?",
                          .03,
                          CustomColors.customWhite,
                        ),
                      ),
                    ),
                  ),
                  CustomSizes().heightBox(context, .03),
                  coloredButton(context, "LOG IN", CustomColors.customPink,
                      width: CustomSizes().dynamicWidth(context, .5),
                      function: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                  }),
                  CustomSizes().heightBox(context, .04),
                  richTextWidget(
                    context,
                    "Don't have an account? ",
                    "Register Here",
                    CustomSizes().dynamicWidth(context, .04),
                    CustomSizes().dynamicWidth(context, .04),
                    const SignUp(),
                    CustomColors.customWhite,
                    CustomColors.customWhite,
                    true,
                  ),
                  CustomSizes().heightBox(context, .1),
                  coloredButton(
                      context, "CONTINUE AS GUEST", CustomColors.customWhite,
                      width: CustomSizes().dynamicWidth(context, .5),
                      fontColor: false,
                      fontSize: .034, function: () {
                    CustomRoutes().push(context, const Choice());
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
