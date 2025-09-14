import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netfo/core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';

class ComingSoon extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  final String dateformat;

  const ComingSoon(
      {super.key,
      required this.imageUrl,
      required this.overview,
      required this.logoUrl,
      required this.month,
      required this.day, required this.dateformat});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height* 0.990,
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(height: size.height *0.01),
              Text(
                month,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                day,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              )
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
                  child: SizedBox(
                    height: size.height * 0.630,
                    width: size.width* 0.790,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => ShimmerWidget(height: size.height * 0.800, width: size.width* 0.500),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
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
                        Container(
                          width: size.width * 0.360,
                          height: size.height * 0.150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: logoUrl,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ),

                        Row(children: [
                          Column(
                            children: [
                              Icon(
                                Icons.notifications_none_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              Text(
                                "Remind me",
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              Text(
                                "Info",
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Column(
                  children: [
                    Text(
                      "Coming to $dateformat",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height:size.height*0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        overview,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    )
                 ],
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
