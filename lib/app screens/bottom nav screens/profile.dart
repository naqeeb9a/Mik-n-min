import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/login.dart';
import 'package:mik_and_min/app%20screens/khubaib/wishlist.dart';
import 'package:mik_and_min/utils/app_routes.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/shopify_functions.dart';
import '../../widgets/text_widget.dart';

class Profile extends StatefulWidget {
  final dynamic cont;

  const Profile({Key? key, this.cont}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late BuildContext dynamicContext;

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: CustomSizes().dynamicHeight(context, .06),
          ),
          child: globalAccessToken == "guest"
              ? SlideTransition(
                  position: _offsetAnimation,
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        CustomSizes().dynamicWidth(context, .034),
                      ),
                    ),
                    backgroundColor: CustomColors.customWhite,
                    insetPadding: EdgeInsets.all(
                      CustomSizes().dynamicWidth(context, 0.02),
                    ),
                    child: Container(
                      width: CustomSizes().dynamicWidth(context, 1),
                      height: CustomSizes().dynamicHeight(context, .2),
                      color: CustomColors.noColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomSizes().dynamicWidth(context, 0.036),
                        vertical: CustomSizes().dynamicHeight(context, 0.018),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSizes().widthBox(context, .006),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/profile.png",
                                color: CustomColors.customBlack,
                                width: CustomSizes().dynamicWidth(context, .1),
                              ),
                              text(
                                context,
                                "Guest",
                                .03,
                                CustomColors.customBlack,
                                bold: true,
                              ),
                              text(
                                context,
                                "Profile",
                                .024,
                                CustomColors.customGrey,
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            color: CustomColors.customBlack,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => CustomRoutes()
                                    .push(context, const WishList()),
                                child: text(
                                  context,
                                  "Wishlist",
                                  .032,
                                  CustomColors.customBlack,
                                  bold: true,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: text(
                                        context,
                                        "Please Sign in to View order History",
                                        .04,
                                        CustomColors.customBlack,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                    ),
                                  );
                                },
                                child: text(
                                  context,
                                  "Order History",
                                  .032,
                                  CustomColors.customBlack,
                                  bold: true,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: text(
                                        context,
                                        "Please Sign in to View Track Order",
                                        .04,
                                        CustomColors.customBlack,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                    ),
                                  );
                                },
                                child: text(
                                  context,
                                  "Track Order",
                                  .032,
                                  CustomColors.customBlack,
                                  bold: true,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            color: CustomColors.customBlack,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              text(
                                context,
                                "Address",
                                .032,
                                CustomColors.customBlack,
                                bold: true,
                              ),
                              text(
                                context,
                                "Settings",
                                .032,
                                CustomColors.customBlack,
                                bold: true,
                              ),
                              text(
                                context,
                                "Log Out",
                                .032,
                                CustomColors.customBlack,
                                bold: true,
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                CustomRoutes().pop(context);
                              },
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : FutureBuilder(
                  future: getUserData(globalAccessToken, context),
                  builder: (context, AsyncSnapshot snapshot) {
                    return SlideTransition(
                      position: _offsetAnimation,
                      child: Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            CustomSizes().dynamicWidth(context, .034),
                          ),
                        ),
                        backgroundColor: CustomColors.customWhite,
                        insetPadding: EdgeInsets.all(
                          CustomSizes().dynamicWidth(context, 0.02),
                        ),
                        child: Container(
                          width: CustomSizes().dynamicWidth(context, 1),
                          height: CustomSizes().dynamicHeight(context, .2),
                          color: CustomColors.noColor,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                CustomSizes().dynamicWidth(context, 0.036),
                            vertical:
                                CustomSizes().dynamicHeight(context, 0.018),
                          ),
                          child: (snapshot.connectionState ==
                                  ConnectionState.waiting)
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                )
                              : (snapshot.data.toString() == "Server Error")
                                  ? Center(
                                      child: text(
                                        context,
                                        "Something went wrong!!!",
                                        .04,
                                        CustomColors.customBlack,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomSizes().widthBox(context, .006),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/profile.png",
                                              color: CustomColors.customBlack,
                                              width: CustomSizes()
                                                  .dynamicWidth(context, .1),
                                            ),
                                            text(
                                              context,
                                              "${snapshot.data["firstName"].toString()} ${snapshot.data["lastName"].toString()}",
                                              .03,
                                              CustomColors.customBlack,
                                              bold: true,
                                              maxLines: 2,
                                            ),
                                            text(
                                              context,
                                              "Profile",
                                              .024,
                                              CustomColors.customGrey,
                                            ),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          thickness: 1,
                                          color: CustomColors.customBlack,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () => CustomRoutes().push(
                                                  context, const WishList()),
                                              child: text(
                                                context,
                                                "Wishlist",
                                                .032,
                                                CustomColors.customBlack,
                                                bold: true,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ScaffoldMessenger.of(
                                                        widget.cont)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: text(
                                                      context,
                                                      "Please Sign in to View order History",
                                                      .04,
                                                      CustomColors.customBlack,
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 1000),
                                                  ),
                                                );
                                              },
                                              child: text(
                                                context,
                                                "Order History",
                                                .032,
                                                CustomColors.customBlack,
                                                bold: true,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: text(
                                                      context,
                                                      "Please Sign in to View Track Order",
                                                      .04,
                                                      CustomColors.customBlack,
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 1000),
                                                  ),
                                                );
                                              },
                                              child: text(
                                                context,
                                                "Track Order",
                                                .032,
                                                CustomColors.customBlack,
                                                bold: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          thickness: 1,
                                          color: CustomColors.customBlack,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            text(
                                              context,
                                              "Address",
                                              .032,
                                              CustomColors.customBlack,
                                              bold: true,
                                            ),
                                            text(
                                              context,
                                              "Settings",
                                              .032,
                                              CustomColors.customBlack,
                                              bold: true,
                                            ),
                                            text(
                                              context,
                                              "Log Out",
                                              .032,
                                              CustomColors.customBlack,
                                              bold: true,
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              CustomRoutes().pop(context);
                                            },
                                            child: const Icon(
                                                Icons.arrow_drop_down),
                                          ),
                                        )
                                      ],
                                    ),
                        ),
                      ),
                    );
                  },

                  // if (snapshot.connectionState == ConnectionState.done) {
                  //   if (snapshot.data == "Server Error") {
                  //     return Center(
                  //       child: retry(context),
                  //     );
                  //   } else {
                  //     SlideTransition(
                  //       position: _offsetAnimation,
                  //       child: Dialog(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(
                  //             CustomSizes().dynamicWidth(context, .034),
                  //           ),
                  //         ),
                  //         backgroundColor: CustomColors.customWhite,
                  //         insetPadding: EdgeInsets.all(
                  //           CustomSizes().dynamicWidth(context, 0.02),
                  //         ),
                  //         child: Container(
                  //           width: CustomSizes().dynamicWidth(context, 1),
                  //           height: CustomSizes().dynamicHeight(context, .2),
                  //           color: CustomColors.noColor,
                  //           padding: EdgeInsets.symmetric(
                  //             horizontal:
                  //                 CustomSizes().dynamicWidth(context, 0.036),
                  //             vertical:
                  //                 CustomSizes().dynamicHeight(context, 0.018),
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               CustomSizes().widthBox(context, .006),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Image.asset(
                  //                     "assets/profile.png",
                  //                     color: CustomColors.customBlack,
                  //                     width: CustomSizes()
                  //                         .dynamicWidth(context, .1),
                  //                   ),
                  //                   text(
                  //                     context,
                  //                     snapshot.data["firstName"],
                  //                     .03,
                  //                     CustomColors.customBlack,
                  //                     bold: true,
                  //                   ),
                  //                   text(
                  //                     context,
                  //                     "Profile",
                  //                     .024,
                  //                     CustomColors.customGrey,
                  //                   ),
                  //                 ],
                  //               ),
                  //               const VerticalDivider(
                  //                 thickness: 1,
                  //                 color: CustomColors.customBlack,
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   GestureDetector(
                  //                     onTap: () => CustomRoutes()
                  //                         .push(context, const WishList()),
                  //                     child: text(
                  //                       context,
                  //                       "Wishlist",
                  //                       .032,
                  //                       CustomColors.customBlack,
                  //                       bold: true,
                  //                     ),
                  //                   ),
                  //                   GestureDetector(
                  //                     onTap: () => CustomRoutes().push(
                  //                         context,
                  //                         const OrderHistory(
                  //                             text1: "Order History")),
                  //                     child: text(
                  //                       context,
                  //                       "Order History",
                  //                       .032,
                  //                       CustomColors.customBlack,
                  //                       bold: true,
                  //                     ),
                  //                   ),
                  //                   GestureDetector(
                  //                     onTap: () => CustomRoutes().push(
                  //                         context,
                  //                         const TrackOrder(
                  //                             text1: "Track Order")),
                  //                     child: text(
                  //                       context,
                  //                       "Track Order",
                  //                       .032,
                  //                       CustomColors.customBlack,
                  //                       bold: true,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               const VerticalDivider(
                  //                 thickness: 1,
                  //                 color: CustomColors.customBlack,
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   text(
                  //                     context,
                  //                     "Address",
                  //                     .032,
                  //                     CustomColors.customBlack,
                  //                     bold: true,
                  //                   ),
                  //                   text(
                  //                     context,
                  //                     "Settings",
                  //                     .032,
                  //                     CustomColors.customBlack,
                  //                     bold: true,
                  //                   ),
                  //                   text(
                  //                     context,
                  //                     "Log Out",
                  //                     .032,
                  //                     CustomColors.customBlack,
                  //                     bold: true,
                  //                   ),
                  //                 ],
                  //               ),
                  //               Align(
                  //                 alignment: Alignment.bottomRight,
                  //                 child: GestureDetector(
                  //                   onTap: () {
                  //                     CustomRoutes().pop(context);
                  //                   },
                  //                   child: const Icon(Icons.arrow_drop_down),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // } else {
                  //   return Center(child: Text(snapshot.data.toString()));
                  // }
                  //
                  // // else {
                  // //   return const Center(child: Text("no Data"));
                  // // }
                  // return const Center(child: Text("no Data"));
                  // },
                ),
        ),
      ],
    );
  }
}
