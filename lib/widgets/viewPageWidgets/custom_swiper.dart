import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/utils/dynamic_sizes.dart';
import 'package:mik_and_min/widgets/viewPageWidgets/tinder_page.dart';

customSwiper(context, productData) {
  return SizedBox(
    height: CustomSizes().dynamicHeight(context, 0.45),
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return tinderImage(
            context,
            productData["images"]["edges"][index]["node"]["src"],
            productData["title"],
            index);
      },
      itemCount: productData["images"]["edges"].length,
      autoplay: true,
      autoplayDelay: 4000,
      itemWidth: CustomSizes().dynamicWidth(context, 0.75),
      itemHeight: CustomSizes().dynamicHeight(context, 0.38),
      layout: SwiperLayout.STACK,
      scrollDirection: Axis.vertical,
      pagination: const SwiperPagination(
        builder: DotSwiperPaginationBuilder(
            activeColor: CustomColors.customBlack,
            color: CustomColors.customGrey),
      ),
    ),
  );
}
