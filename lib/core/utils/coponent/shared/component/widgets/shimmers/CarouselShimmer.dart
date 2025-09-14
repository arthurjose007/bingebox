import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfo/core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';
import 'package:shimmer/shimmer.dart';

class CarouselShimmer extends StatelessWidget {
  CarouselShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: (size.height * 0.30 < 350) ? 350 : size.height * 0.30,
        child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Column(
              children: [
                Expanded(
                  child: ShimmerWidget(height:size.height*200,width: size.width*200,)

                ),
                SizedBox(height: 10,),

              ],
            );
          },
          options: CarouselOptions(

            height: (size.height * 0.30 < 350) ? 350 : size.height * 0.30,
            aspectRatio: 16 / 9,
            reverse: false,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}
// Shimmer Widget Class
