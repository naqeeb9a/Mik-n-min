import 'dart:ui';
import 'package:cool_alert/cool_alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/form_fields.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
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
                      CustomSizes().heightBox(context, .03),
                      // coloredButton(
                      //   context,
                      //   "Send Verification code",
                      //   CustomColors.customPink,
                      //   width: CustomSizes().dynamicWidth(context, .5),
                      //   fontSize: .034,
                      //   function: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       CustomRoutes().pop(context);
                      //     }
                      //   },

                      // ),
                       Padding(
                        padding: EdgeInsets.only(
                          top: CustomSizes().dynamicHeight(context, .1),
                        ),
                        child: loading == true
                            ? jumpingDots(context)
                            :  coloredButton(
                                context,
                                "Send Verification code",
                                CustomColors.customPink,
                                width: CustomSizes().dynamicWidth(context, .5),
                                fontSize: .034,
                                function: () async {
                                   if (!_formKey.currentState!.validate()) {
                              return;
                            } else {
                              setState(() {
                                loading = true;

                              });
                              var result = await passwordReset(
                                  email.text.toString());

                              if (result == "Server Error") {
                                setState(() {
                                  loading = false;
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
                              } else if (result == "done") {
                                setState(() {
                                  loading = false;
                                });
                                CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.success,
                                    title: "Email Sent",
                                    text:
                                        "An email has been sent to you. PLease proceed there!!",
                                    backgroundColor: CustomColors.customPink,
                                    confirmBtnColor: CustomColors.customPink,
                                    animType: CoolAlertAnimType.scale,
                                    onCancelBtnTap: () {
                                      CustomRoutes().pop(context);
                                      CustomRoutes().pop(context);
                                    });
                              }
                            }
                                }
                              ), 
                       
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    CustomRoutes().pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      CustomSizes().dynamicHeight(context, .02),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.customWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget jumpingDots(context) {
  // return Image.asset(
  //   "assets/icons/loading.gif",
  //   height: dynamicHeight(context, .16),
  // );
  return Center(
    child: JumpingText(
      ".....",
      end: const Offset(0.0, -0.1),
      style: TextStyle(
        color:  CustomColors.customWhite ,
        fontSize: CustomSizes().dynamicWidth(context, .08),
      ),
    ),
  );
}


}