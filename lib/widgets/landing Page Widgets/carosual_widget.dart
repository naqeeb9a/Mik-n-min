import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';

import '../../utils/dynamic_sizes.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              height: CustomSizes().dynamicHeight(context, 0.4),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              enlargeCenterPage: true),
          items: [
            "assets/landing_banner.png",
            "assets/landing_banner.png",
            "assets/landing_banner.png"
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin:
                       EdgeInsets.symmetric(horizontal: CustomSizes().dynamicWidth(context, 0.01), vertical: CustomSizes().dynamicWidth(context, 0.01)),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(i)),
                    border:
                        Border.all(width: 6, color: CustomColors.customPink),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      CustomSizes().dynamicWidth(context, 0.05),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3].asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: CustomSizes().dynamicWidth(context, 0.03),
                height: CustomSizes().dynamicWidth(context, 0.03),
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
