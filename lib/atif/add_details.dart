import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/widgets/app_bar.dart';

import '../utils/config.dart';
import '../utils/dynamic_sizes.dart';
import '../widgets/form_fields.dart';
import '../widgets/text_widget.dart';

class AddDetails extends StatefulWidget {
  AddDetails({Key? key}) : super(key: key);

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
        endDrawer: customAppBar(context),
        body: Container(
          height: CustomSizes().dynamicHeight(context, 1),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
              CustomSizes().heightBox(context, .06),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
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
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
