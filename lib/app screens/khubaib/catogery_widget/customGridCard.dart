import "package:flutter/material.dart";

import '../../../atif/product_array.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/config.dart';
import '../../../utils/dynamic_sizes.dart';
import '../../../widgets/text_widget.dart';
import '../view_page.dart';

class CustomGridCard extends StatefulWidget {
    final dynamic productData;
  final dynamic text1;
  final dynamic image;
  const CustomGridCard({this.productData, this.text1, this.image, Key? key }) : super(key: key);

  @override
  State<CustomGridCard> createState() => _CustomGridCardState();
}

class _CustomGridCardState extends State<CustomGridCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CustomRoutes().push(
        context,
        ViewPage(
          productData: widget.productData,
          image: widget.image,
          text1: widget.text1,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: CustomSizes().dynamicWidth(context, 0.42),
            height: CustomSizes().dynamicWidth(context, 0.4),
            decoration: BoxDecoration(
              color: CustomColors.customWhite,
              image: DecorationImage(
                image: NetworkImage(
                 widget.productData["images"]["edges"][0]["node"]["src"],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: CustomSizes().dynamicWidth(context, 0.42),
            height: CustomSizes().dynamicWidth(context, 0.15),
            color: CustomColors.customGrey.withOpacity(0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                text(
                  context,
                  widget.productData["vendor"],
                  0.025,
                  CustomColors.customBlack,
                ),
                text(
                  context,
                  widget.productData["title"],
                  0.025,
                  CustomColors.customBlack,
                  bold: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: CustomSizes().dynamicWidth(context, 0.02)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productData["variants"]["edges"][0]["node"]
                            ["compareAtPrice"],
                        style: TextStyle(
                          color: CustomColors.customGrey,
                          fontSize: CustomSizes().dynamicHeight(context, 0.012),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      text(
                        context,
                       widget.productData["variants"]["edges"][0]["node"]["price"],
                        0.025,
                        CustomColors.customPink,
                      ),
                      GestureDetector(
                       onTap: () {
                          setState(() {});
                          var check = "";
                          if (wishlistArray.isEmpty) {
                            wishlistArray.add(widget.productData);
                            wishlistCheck.add(widget.productData["title"]);
                            print(wishlistArray);
                            print(wishlistCheck);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: text(context, "Item Added to Wishlist",
                                    0.06, CustomColors.customWhite),
                              ),
                            );
                          } else {
                            if (wishlistCheck
                                .contains(widget.productData['title'])) {
                              wishlistArray.remove(widget.productData);
                              wishlistCheck.remove(widget.productData["title"]);
                              print(wishlistArray);
                              print(wishlistCheck);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: text(
                                      context,
                                      "Item Removed from Wishlist",
                                      0.06,
                                      CustomColors.customWhite),
                                ),
                              );
                              setState(() {});
                              check == "yes";
                            } else {
                              check = "no";
                              setState(() {});
                            }

                            if (check == "no" && check != "yes") {
                              wishlistArray.add(widget.productData);
                              wishlistCheck.add(widget.productData["title"]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: text(
                                      context,
                                      "Item Added to Wishlist",
                                      0.06,
                                      CustomColors.customWhite),
                                ),
                              );
                              setState(() {});
                            }

                            // wishlistArray.removeAt(index);
                            // wishlistCheck.removeAt(index);
                            // print(wishlistArray);
                            // print(wishlistCheck);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: text(context, "Item Removed from Wishlist",
                            //         0.06, CustomColors.customWhite),
                            //   ),
                            // );
                          }
                        },
                        child: wishlistCheck.contains(widget.productData['title'])
                            ? Icon(
                                Icons.star,
                                size:
                                    CustomSizes().dynamicHeight(context, 0.025),
                              )
                            : Icon(
                                Icons.star_border_outlined,
                                size:
                                    CustomSizes().dynamicHeight(context, 0.025),
                              ),
                      ),
                    ],
                  ),
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
}