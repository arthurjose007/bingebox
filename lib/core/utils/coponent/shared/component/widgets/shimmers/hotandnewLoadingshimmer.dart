import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfo/core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';

class HotandNewLoading extends StatelessWidget {


  const HotandNewLoading(
      {super.key,
     });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height* 0.990,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Column(
            children: [
              SizedBox(height: size.height *0.04),
              ShimmerWidget(height:  size.height *0.100, width: size.width *0.100)
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ShimmerWidget(
                        height: size.height * 0.680,
                        width: size.width* 0.790,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerWidget(
                              width: size.width * 0.360,
                              height: size.height * 0.150,

                            ),

                            Row(children: [
                             ShimmerWidget(height: size.height * 0.07, width: size.width*0.09),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              ShimmerWidget(height: size.height * 0.07, width: size.width*0.09),

                            ],),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),


                  ],
                )),
          )
        ],
      ),
    );
    //3:33
  }
}
