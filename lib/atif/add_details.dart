import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';
import '../widgets/buttons.dart';
import '../widgets/form_fields.dart';
import '../widgets/text_widget.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final name = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final postalCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context, onlyText: true, titleText: "CHECKOUT"),
        endDrawer: customDrawer(context),
        body: SingleChildScrollView(
          child: SizedBox(
            height: CustomSizes().dynamicHeight(context, .88),
            width: CustomSizes().dynamicWidth(context, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSizes().heightBox(context, .06),
                text(context, "Name", .05, CustomColors.customBlack),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "Name",
                    name,
                    function: (value) {
                      if (EmailValidator.validate(value)) {
                      } else {
                        return "Enter Valid Name";
                      }
                      return null;
                    },
                  ),
                ),
                CustomSizes().heightBox(context, .03),
                text(
                  context,
                  "Last Name",
                  .05,
                  CustomColors.customBlack,
                ),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "Last Name",
                    lastName,
                    function: (value) {
                      if (EmailValidator.validate(value)) {
                      } else {
                        return "Enter Valid Last Name";
                      }
                      return null;
                    },
                  ),
                ),
                CustomSizes().heightBox(context, .03),

                text(
                  context,
                  "Email",
                  .05,
                  CustomColors.customBlack,
                ),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "Email",
                    email,
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
                text(
                  context,
                  "Phone",
                  .05,
                  CustomColors.customBlack,
                ),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "Phone",
                    phone,
                    function: (value) {
                      if (EmailValidator.validate(value)) {
                      } else {
                        return "Enter Valid Ph N.O.";
                      }
                      return null;
                    },
                  ),
                ),
                CustomSizes().heightBox(context, .03),
                text(
                  context,
                  "Address",
                  .05,
                  CustomColors.customBlack,
                ),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "Address",
                    address,
                    function: (value) {
                      if (EmailValidator.validate(value)) {
                      } else {
                        return "Enter Valid Address";
                      }
                      return null;
                    },
                  ),
                ),
                CustomSizes().heightBox(context, .03),
                text(
                  context,
                  "City",
                  .05,
                  CustomColors.customBlack,
                ),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "City",
                    city,
                    function: (value) {
                      if (EmailValidator.validate(value)) {
                      } else {
                        return "Enter Valid City";
                      }
                      return null;
                    },
                  ),
                ),
                CustomSizes().heightBox(context, .03),

                text(
                  context,
                  "Postal Code",
                  .05,
                  CustomColors.customBlack,
                ),
                SizedBox(
                  width: CustomSizes().dynamicWidth(context, .7),
                  child: inputTextField(
                    context,
                    "Postal Code",
                    postalCode,
                    function: (value) {
                      if (EmailValidator.validate(value)) {
                      } else {
                        return "Enter Valid Postal Code";
                      }
                      return null;
                    },
                  ),
                ),
                CustomSizes().heightBox(context, 0.17),
                coloredButton(
                  context,
                  "PAYMENT",
                  CustomColors.customPink,
                  fontColor: true,
                  width: CustomSizes().dynamicWidth(context, 0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
