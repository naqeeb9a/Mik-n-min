import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/bottom%20nav%20screens/cart.dart';
import 'package:mik_and_min/app%20screens/bottom%20nav%20screens/categories_page.dart';
import 'package:mik_and_min/app%20screens/bottom%20nav%20screens/landing_page.dart';
import 'package:mik_and_min/app%20screens/bottom%20nav%20screens/profile.dart';
import 'package:mik_and_min/app%20screens/bottom%20nav%20screens/search.dart';
import 'package:mik_and_min/utils/config.dart';
import '../../utils/dynamic_sizes.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  double iconSize = 0.05;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              LandingPage(),
              const Search(),
              const CategoriesPage(),
              const Cart(),
              const Profile(),
            ],
          ),
          Positioned(
            bottom: 0.0,
            child: Material(
              color: CustomColors.customWhite.withOpacity(.8),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: CustomSizes().dynamicWidth(context, .12),
                    width: CustomSizes().dynamicWidth(context, 1),
                    color: CustomColors.customWhite.withOpacity(.2),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: CustomColors.noColor,
                      onTap: (index) {
                        if (index == 2) {
                          _tabController!.index = _tabController!.previousIndex;
                          showDialog(
                            barrierDismissible: true,
                            useSafeArea: true,
                            context: context,
                            barrierColor: CustomColors.customSkimColor,
                            builder: (context) {
                              return const CategoriesPage();
                            },
                          );
                        } else if (index == 4) {
                          _tabController!.index = _tabController!.previousIndex;
                          showDialog(
                            barrierDismissible: true,
                            useSafeArea: true,
                            context: context,
                            barrierColor: Colors.white60,
                            builder: (context) {
                              return const Profile();
                            },
                          );
                        }
                      },
                      tabs: [
                        Tab(
                          icon: Image.asset(
                            "assets/home.png",
                            width: CustomSizes().dynamicWidth(context, iconSize),
                          ),
                        ),
                        Tab(
                          icon: Image.asset(
                            "assets/search.png",
                            width: CustomSizes().dynamicWidth(context, iconSize),
                          ),
                        ),
                        Tab(
                          icon: Image.asset(
                            "assets/bottom_category.png",
                            width: CustomSizes().dynamicWidth(context, iconSize),
                          ),
                        ),
                        Tab(
                          icon: Image.asset(
                            "assets/cart.png",
                            width: CustomSizes().dynamicWidth(context, iconSize),
                          ),
                        ),
                        Tab(
                          icon: Image.asset(
                            "assets/profile.png",
                            width: CustomSizes().dynamicWidth(context, iconSize),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
