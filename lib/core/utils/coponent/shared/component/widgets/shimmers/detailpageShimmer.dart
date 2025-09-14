import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import 'shimmerWidgets.dart';



class DetailPagesShimmer extends StatelessWidget {
  DetailPagesShimmer({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
            ShimmerWidget(
                height:
                MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  ShimmerWidget(
                    height: 10,
    width: 50,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(
                        width: 10,
                      ),
                      ShimmerWidget(height: MediaQuery.of(context).size.height*0.200, width: MediaQuery.of(context).size.height*0.400)
                    ],
                  ),



                ],
              ),
            ]),
          ),
        );

}}
