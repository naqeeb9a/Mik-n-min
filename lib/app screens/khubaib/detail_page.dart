import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customWhite,
        body: Column(
          children: [
             appBar(context,bottomtext: true,title:"Jacket & Sweaters"),
            Divider(
              thickness: CustomSizes().dynamicWidth(context, 0.007),
            ),
            Expanded(
              child: GridView.builder(
             
                primary: true,
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (45.0 / 60.0),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return card(context);
                },
              ),
            ),
            //  SizedBox(
            //   height: CustomSizes().dynamicHeight(context, 0.55),
            //   child: Swiper(
            //     itemBuilder: (BuildContext context, int index) {
            //       return ClipRRect(
            //         borderRadius: BorderRadius.circular(
            //         CustomSizes().dynamicWidth(context, 0.01),
            //         ),
            //         child: Container(
            //               width: CustomSizes().dynamicWidth(context, 0.7),
            //               height: CustomSizes().dynamicHeight(context, 0.4),
            //               color: CustomColors.customBlack,
            //               child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(
            //                   CustomSizes().dynamicWidth(context, 0.02),
            //                   ),
            //                   child: Container(
            //                     width: CustomSizes().dynamicWidth(context, 0.68),
            //                     height: CustomSizes().dynamicHeight(context, 0.38),
            //                     color: CustomColors.customBlue,

            //                   ),
            //                 ),
            //         ),
            //       );
            //     },
            //     itemCount: 3,
            //     autoplay: true,
            //     // itemWidth: 300.0,
            //     // itemHeight: 400.0,
            //     layout: SwiperLayout.TINDER,
            //     pagination: const SwiperPagination(
            //       alignment: Alignment.centerRight,
            //       builder: DotSwiperPaginationBuilder(activeColor: CustomColors.customBlack),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget chip(context, title) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: CustomSizes().dynamicWidth(context, 0.01),
      vertical: CustomSizes().dynamicHeight(context, 0.0035),
    ),
    decoration: BoxDecoration(
      color: CustomColors.customWhite,
      borderRadius: BorderRadius.all(
        Radius.circular(
          CustomSizes().dynamicWidth(context, 0.035),
        ),
      ),
      border: Border.all(color: CustomColors.customBlack),
    ),
    child: Center(
        child: text(
      context,
      title,
      0.025,
      CustomColors.customBlack,
    )),
  );
}

Widget card (context) {
  return Container(
                   
                   
                    child: Column(
                      children: [
                        Container(
                            width: CustomSizes().dynamicWidth(context, 0.42),
                            height: CustomSizes().dynamicHeight(context, 0.2),
                            color: CustomColors.customWhite,
                            child: Center(
                              child: text(context, "image", 0.02,
                                  CustomColors.customBlack),
                            )),
                        Container(
                          width: CustomSizes().dynamicWidth(context, 0.42),
                          height: CustomSizes().dynamicHeight(context, 0.07),
                          color: CustomColors.customGrey.withOpacity(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              text(context, "CocoBee", 0.025,
                                  CustomColors.customBlack),
                              text(context, "Teal Turquoise Hoodie", 0.025,
                                  CustomColors.customBlack,
                                  bold: true),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomSizes().widthBox(context, 0.05),
                                  Text(
                                    "Rs.3190",
                                    style: TextStyle(
                                        color: CustomColors.customGrey,
                                        fontSize: CustomSizes()
                                            .dynamicHeight(context, 0.012),
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  text(context, "Rs.1569", 0.025,
                                      CustomColors.customPink),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: CustomSizes()
                                          .dynamicWidth(context, 0.02),
                                    ),
                                    child: Icon(
                                      Icons.star_border_outlined,
                                      size: CustomSizes()
                                          .dynamicHeight(context, 0.025),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ],
                          ),
                        ),
                       
                        Divider(
                         thickness: CustomSizes().dynamicWidth(context, 0.002),
                        ),
                      ],
                    ),
                  );
}

Widget appBar(context,{bottomtext = false,title}) {
  return Padding(
              padding: EdgeInsets.only(
                  top: CustomSizes().dynamicHeight(context, 0.01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: CustomSizes().dynamicWidth(context, 0.05),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: CustomSizes().dynamicHeight(context, .029),
                        backgroundColor: CustomColors.customBlue,
                        child: CircleAvatar(
                          backgroundColor: CustomColors.customWhite,
                          radius: CustomSizes().dynamicHeight(context, .027),
                        ),
                      ),
                      bottomtext== true ?text(context, title, 0.02,
                          CustomColors.customBlack,
                          bold: true): Container(),
                    ],
                  ),
                  chip(context, "1-3 YEARS"),
                  chip(context, "3-6 YEARS"),
                  chip(context, "6+ YEARS"),
                  Icon(
                    Icons.menu,
                    size: CustomSizes().dynamicWidth(context, 0.08),
                  ),
                ],
              ),
            );
}