import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfo/core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';

import '../../../../../../feature/homepage/view/model/tvseries_model.dart';
import '../../constant/constant.dart';
import 'shimmers/CarouselShimmer.dart';

class CustomCarousel extends StatelessWidget {
  final List<ResultsTv> data;
   CustomCarousel({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.30 < 350) ? 350 : size.height * 0.30,
      child: CarouselSlider.builder(itemCount:  data.length, itemBuilder:(BuildContext context,int index,int realIndex){
        var url= data[index].backdropPath.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container(
          height: size.height*200,
          width:size.width*200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: CachedNetworkImage(
            placeholder:(context, url) =>
                ShimmerWidget(height: size.height*200, width: size.width*200),
            errorWidget: (context,
                error, stackTrace) {
              return Container(
                color:
                Colors.grey[800],
                child: const Center(
                  child: Icon(
                      Icons
                          .broken_image,
                      color: Colors
                          .grey),
                ),
              );
            },
            imageUrl: "$imageUrl$url",
            // progressIndicatorBuilder: (context, url, downloadProgress) =>
            //   CarouselShimmer(),
          ),
        )),
       // SizedBox(height: 20,),
        Text(data[index].name.toString(),style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
      ],
    ) ;
    },

       options: CarouselOptions(
         height:  (size.height * 0.30 < 350) ? 350 : size.height * 0.30,
         aspectRatio: 16/9,
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
