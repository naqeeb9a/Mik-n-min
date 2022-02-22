import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/basic_widgets.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customWhite,
      drawerScrimColor: CustomColors.customSkimColor,
      endDrawer: customDrawer(context),
      appBar: customAppBar(context, onlyText: true, titleText: "Search"),
      body: SafeArea(
        child: Column(
          children: [
            searchField(context, search),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  retry(context),
                  Image.asset(
                    "assets/search.png",
                    color: CustomColors.customGrey.withOpacity(0.4),
                  ),
                  CustomSizes().heightBox(context, 0.1),
                  text(
                    context,
                    "Search for Something you are looking for",
                    0.03,
                    CustomColors.customGrey.withOpacity(0.5),
                    alignText: TextAlign.center,
                  ),
                  CustomSizes().heightBox(context, 0.3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget searchField(context, fieldcontroller) {
  return Container(
    padding: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.02)),
    child: TextFormField(
      controller: fieldcontroller,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(
          fontSize: CustomSizes().dynamicWidth(context, 0.03),
          fontWeight: FontWeight.w500,
          color: CustomColors.customGrey.withOpacity(0.65),
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: CustomColors.customGrey.withOpacity(0.65),
          size: CustomSizes().dynamicWidth(context, 0.05),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.customGrey.withOpacity(0.4),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.customGrey),
        ),
        border: UnderlineInputBorder(
          borderSide:
              BorderSide(color: CustomColors.customGrey.withOpacity(0.65)),
        ),
      ),
      cursorHeight: CustomSizes().dynamicHeight(context, 0.03),
      cursorColor: CustomColors.customGrey.withOpacity(0.65),
      cursorWidth: CustomSizes().dynamicWidth(context, 0.0025),
    ),
  );
}
