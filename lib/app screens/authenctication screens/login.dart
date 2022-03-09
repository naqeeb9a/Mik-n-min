// ignore_for_file: unused_import

import 'dart:ui';

import 'package:cool_alert/cool_alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/forgot_password.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/sign_in.dart';
import 'package:mik_and_min/app%20screens/choice/choice.dart';
import 'package:mik_and_min/atif/payment_information.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/form_fields.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _formKey = GlobalKey<FormState>();
final email = TextEditingController();
final password = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
String globalAccessToken = "";
class _LoginState extends State<Login> {
  // final email = TextEditingController();
  // final password = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Container(
                  width: CustomSizes().dynamicWidth(context, 1),
                  height: CustomSizes().dynamicHeight(context, 1),
                  decoration: const BoxDecoration(
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
                          password: true,
                          white: true,
                          function: (value) {
                            if (value!.isEmpty) {
                              return 'Enter A Valid Password';
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
                      coloredButton(
                        context,
                        "LOG IN",
                        CustomColors.customPink,
                        width: CustomSizes().dynamicWidth(context, .5),
                        function: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          setState(() {
                            isLoading = true;
                          });
                          var accessToken = await loginUser(
                            email.text.toString(),
                            password.text.toString(),
                          );
                          globalAccessToken =accessToken;
                          print(globalAccessToken);
                          if (accessToken == "Server Error") {
                            setState(() {
                              isLoading = false;
                            });
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.warning,
                              title: "No Internet",
                              text: "Check your internet connection!!",
                              backgroundColor: CustomColors.customPink,
                              confirmBtnColor: CustomColors.customPink,
                              animType: CoolAlertAnimType.scale,
                            );
                          } else if (accessToken != null) {
                            //  globalAccessToken =accessToken.toString();
                            SharedPreferences saveUser =
                                await SharedPreferences.getInstance();
                            SharedPreferences saveUserEmail =
                                await SharedPreferences.getInstance();
                            SharedPreferences saveUserPassword =
                                await SharedPreferences.getInstance();
                            saveUser.setString(
                                "loginInfo", accessToken.toString());
                            saveUserEmail.setString("email", email.text);
                            saveUserPassword.setString(
                                "password", password.text);
                            CustomRoutes().pushAndRemoveUntil(
                              context,
                              const Choice(),
                            );
                            email.clear();
                            password.clear();
                          } else {
                            setState(() {
                              isLoading = false;
                            });

                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.error,
                              title: "",
                              text: "Username or Password not Matched!!",
                              backgroundColor: CustomColors.customPink,
                              confirmBtnColor: CustomColors.customPink,
                              animType: CoolAlertAnimType.scale,
                              flareAnimationName: "Dance",
                            );
                          }
                        },
                      ),
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
                      coloredButton(context, "CONTINUE AS GUEST",
                          CustomColors.customWhite,
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
        ),
      ),
    );
  }
}


dynamic customAlert(context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: CustomColors.noColor,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: CustomSizes().dynamicHeight(context, .2),
              ),
              child: Container(
                height: CustomSizes().dynamicHeight(context, .32),
                width: CustomSizes().dynamicWidth(context, .8),
                decoration: BoxDecoration(
                  color: CustomColors.customPink,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, .04),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: CustomSizes().dynamicHeight(context, .17),
                      width: CustomSizes().dynamicWidth(context, .8),
                      child: Center(
                        child: Icon(
                          Icons.email_outlined,
                          color: CustomColors.customWhite,
                          size: CustomSizes().dynamicWidth(context, .16),
                        ),
                      ),
                    ),
                    Container(
                      height: CustomSizes().dynamicHeight(context, .15),
                      width: CustomSizes().dynamicWidth(context, .8),
                      decoration: BoxDecoration(
                        color: CustomColors.customWhite,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            CustomSizes().dynamicWidth(context, .04),
                          ),
                          bottomLeft: Radius.circular(
                            CustomSizes().dynamicWidth(context, .04),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'This email is already registered',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  CustomSizes().dynamicWidth(context, .032),
                              color: CustomColors.customBlack,
                            ),
                          ),
                          coloredButton(context, "Ok", CustomColors.customPink,
                            width: CustomSizes().dynamicWidth(context, .16),
                          )
                          // coloredButton(
                          //   context,
                          //   "Ok",
                          //   width: CustomSizes().dynamicWidth(context, .16),
                          //   heigth: CustomSizes().dynamicHeight(context, .03),
                          //   function: () {
                          //     pop(context);
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
