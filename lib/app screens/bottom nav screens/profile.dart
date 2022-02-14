import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/app_routes.dart';

import '../../utils/config.dart';
import '../../utils/dynamic_sizes.dart';
import '../../widgets/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

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
          child: SlideTransition(
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
                          "User Name",
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
                        text(
                          context,
                          "Wishlist",
                          .032,
                          CustomColors.customBlack,
                          bold: true,
                        ),
                        text(
                          context,
                          "Order History",
                          .032,
                          CustomColors.customBlack,
                          bold: true,
                        ),
                        text(
                          context,
                          "Track Order",
                          .032,
                          CustomColors.customBlack,
                          bold: true,
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
          ),
        ),
      ],
    );
  }
}
