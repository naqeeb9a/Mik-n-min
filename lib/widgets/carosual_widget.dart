
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';

import '../utils/dynamic_sizes.dart';

homeSlider(context) {
  return CarouselSlider(
    options: CarouselOptions(
        height: CustomSizes().dynamicHeight(context, 0.4),
        enlargeCenterPage: true),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: CustomSizes().dynamicWidth(context, 1),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: CustomColors.customPink,
                  borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 0.05),
                  )),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      CustomSizes().dynamicWidth(context, 0.05),
                    )),
              ));
        },
      );
    }).toList(),
  );
}
