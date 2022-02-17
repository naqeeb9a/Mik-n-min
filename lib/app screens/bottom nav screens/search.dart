import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/app_bar.dart';
import 'package:mik_and_min/widgets/drawer/drawer.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: customDrawer(context),
        appBar: customAppBar(context,elevate: false),
        body: SingleChildScrollView(
          child: Container(
             width: CustomSizes().dynamicWidth(context, 1),
            height:CustomSizes().dynamicHeight(context, 1),
            decoration: const BoxDecoration(
              image: DecorationImage(fit:BoxFit.contain,image: NetworkImage('https://png.pngitem.com/pimgs/s/293-2934735_computer-icons-search-box-circle-hd-png-download.png',))
            ),
            child: Column(
              children: [
                searchField(context, search)  
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget searchField (context,fieldcontroller) {
  return  SizedBox(
                  width: CustomSizes().dynamicWidth(context, 0.95),
                  height: CustomSizes().dynamicHeight(context, 0.06),
                  child: TextFormField(
                    controller:  fieldcontroller,
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
                        borderSide: BorderSide(color: CustomColors.customGrey.withOpacity(0.65),),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.customGrey),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.customGrey.withOpacity(0.65)),
                      ),
                    ),
                    cursorHeight: CustomSizes().dynamicHeight(context, 0.03),
                    cursorColor: CustomColors.customGrey.withOpacity(0.65),
                    cursorWidth: CustomSizes().dynamicWidth(context, 0.0025),
                  ),
                );
}