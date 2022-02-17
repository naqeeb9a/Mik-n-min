import 'package:flutter/material.dart';
import 'package:mik_and_min/app%20screens/khubaib/image_preview.dart';
import 'package:mik_and_min/utils/app_routes.dart';
import 'package:mik_and_min/utils/config.dart';

import '../../utils/dynamic_sizes.dart';

tinderImage(context, image, name, index) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: CustomSizes().dynamicHeight(context, 0.04),
    ),
    child: InkWell(
      onTap: () => CustomRoutes()
          .push(context, ImagePreview(image: image, name: name, index: index)),
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.customWhite,
            borderRadius: BorderRadius.circular(
              CustomSizes().dynamicWidth(context, 0.04),
            ),
            border: Border.all(
              color: CustomColors.customGrey.withOpacity(0.5),
              width: CustomSizes().dynamicWidth(context, 0.012),
            ),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      ),
    ),
  );
}
