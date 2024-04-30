import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/shared/constants/temp_carousels.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: TEMP_CAROUSELS.map(
        (item) {
          return Image.asset(
            item.imagePath,
            width: 270.w,
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 100.w,
        enableInfiniteScroll: false,
        padEnds: false,
        viewportFraction: 0.8,
      ),
    );
  }
}
