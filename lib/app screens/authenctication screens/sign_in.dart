import 'dart:ui';
import 'package:cool_alert/cool_alert.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/login.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/buttons.dart';
import 'package:mik_and_min/widgets/form_fields.dart';
import 'package:mik_and_min/widgets/shopify_functions.dart';
import 'package:mik_and_min/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../choice/choice.dart';


final firstName = TextEditingController();
final lastName = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();
final cPassword = TextEditingController();
final _formKey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    userSignUp() async {
    const createUserAccessToken = r'''
              mutation customerCreate($input: CustomerCreateInput!) {
  customerCreate(input: $input) {
    customer {
      id
    }
    customerUserErrors {
      code
      field
      message
    }
  }
}

            ''';
    var variables = {
      "input": {
        "email": email.text.toString(),
        "password": password.text.toString(),
        "firstName": firstName.text.toString(),
        "lastName": lastName.text.toString()
      }
    };
    final HttpLink httpLink = HttpLink(
        "https://$storeName.myshopify.com/api/2021-10/graphql.json",
        defaultHeaders: {
          "X-Shopify-Storefront-Access-Token":
              storeFrontAccessToken
        });
    GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
    final QueryOptions options = QueryOptions(
        document: gql(createUserAccessToken), variables: variables);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      return "Server Error";
    } else {
      if (result.data!["customerCreate"]["customer"] != null) {
        return result.data!["customerCreate"]["customer"]["id"];
      } else {
        return result.data!["customerCreate"]["customer"];
      }
    }
  }


  
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          "Register",
                          .08,
                          CustomColors.customWhite,
                          bold: true,
                        ),
                        CustomSizes().heightBox(context, .06),
                        text(
                          context,
                          "First Name",
                          .05,
                          CustomColors.customWhite,
                        ),
                        SizedBox(
                          width: CustomSizes().dynamicWidth(context, .7),
                          child: inputTextField(
                            context,
                            "First Name",
                            firstName,
                            white: true,
                            function: (value) {
                              if (value!.isEmpty) {
                                return 'Enter A Valid First Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomSizes().heightBox(context, .04),
                        text(
                          context,
                          "Last Name",
                          .05,
                          CustomColors.customWhite,
                        ),
                        SizedBox(
                          width: CustomSizes().dynamicWidth(context, .7),
                          child: inputTextField(
                            context,
                            "Last Name",
                            lastName,
                            white: true,
                            function: (value) {
                              if (value!.isEmpty) {
                                return 'Enter A Valid Last Name';
                              }
                              return null;
                            },
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
                        CustomSizes().heightBox(context, .04),
                        text(
                          context,
                          "Confirm Password",
                          .05,
                          CustomColors.customWhite,
                        ),
                        SizedBox(
                          width: CustomSizes().dynamicWidth(context, .7),
                          child: inputTextField(
                            context,
                            "Confirm Password",
                            cPassword,
                            password: true,
                            white: true,
                            function: (value) {
                              if (value!.isEmpty ||
                                  value.toString() != password.text) {
                                return 'Enter The Same Password As Above';
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomSizes().heightBox(context, .04),
                        coloredButton(
                            context, "SIGN UP", CustomColors.customPink,
                            width: CustomSizes().dynamicWidth(context, .5),
                            function: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            setState(() {
                              isLoading = true;
                            });
                            var response = await userSignUp();
                            if (response == "Server Error") {
                              setState(() {
                                isLoading = false;
                              });
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                title: "Network Error",
                                text: "Check your internet as well",
                                backgroundColor: CustomColors.customPink,
                                confirmBtnColor: CustomColors.customPink,
                              );
                            } else if (response == null) {
                              setState(() {
                                isLoading = false;
                              });
                              // customAlert(context);
                            } else if (response != null) {
                              var accessToken = await loginUser(
                                email.text.toString(),
                                password.text.toString(),
                              );

                              setState(() {
                                isLoading = false;
                              });
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.success,
                                title: "Successfully Created",
                                text: "",
                                backgroundColor: CustomColors.customPink,
                                confirmBtnColor: CustomColors.customPink,
                                onConfirmBtnTap: () async {
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
                                    globalAccessToken = accessToken.toString();
                                    SharedPreferences saveUser =
                                        await SharedPreferences.getInstance();

                                    saveUser.setString(
                                        "loginInfo", accessToken.toString());
                                    CustomRoutes().pushAndRemoveUntil(
                                      context,
                                      const Choice()
                                    );
                                    email.clear();
                                    password.clear();
                                    firstName.clear();
                                    lastName.clear();
                                    cPassword.clear();
                                  }
                                },
                              );
                            } else {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.info,
                                title: "Unidentified Error",
                                 backgroundColor: CustomColors.customPink,
                                confirmBtnColor: CustomColors.customPink,
                              );
                            }
                          },
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
      ),
    );
  }
}
