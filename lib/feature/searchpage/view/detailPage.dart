import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/coponent/shared/component/widgets/shimmers/detailpageShimmer.dart';
import '../../../core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';
import '../../../core/utils/coponent/shared/constant/constant.dart';
import '../controller/searchController.dart';

class DetailPage extends StatelessWidget {
  final int movieId;
  DetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ChangeNotifierProvider(
          lazy: true,
          create: (context) => SearchProvider()
            ..movieDetailsController(context, movieId)
            ..recommendationsController(context, movieId),
          child: Consumer<SearchProvider>(builder: (context, provider, child) {
            late String genretext = provider.movieDetailsList[0].genres!
                .map((genre) => genre.name)
                .join(',');
            return provider.movieDetLoading
                ? DetailPagesShimmer()
                : provider.movieDetailsList.isEmpty
                    ? SizedBox.shrink()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            provider.movieDetailsList.isEmpty
                                ? Text(
                                    "No data found",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.4,
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 5,
                                          left: 0,
                                          child: IconButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              icon: Icon(
                                                Icons.arrow_back_ios_new_outlined,
                                                color: Colors.white,
                                              )),
                                        ),
                                        CachedNetworkImage(
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              ShimmerWidget(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  width: double.infinity),
                                          imageUrl:
                                              "$imageUrl${provider.movieDetailsList[0].backdropPath}",
                                          errorWidget:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[800],
                                              child: const Center(
                                                child: Icon(Icons.broken_image,
                                                    color: Colors.grey),
                                              ),
                                            );
                                          },
                                        ),
                                        IconButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_outlined,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ),
                            Column(
                              children: [
                                provider.movieDetailsList[0].title == null
                                    ? Text(
                                        "Title is not available",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    : Text(
                                        provider.movieDetailsList[0].title
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    provider.movieDetailsList[0].releaseDate ==
                                            null
                                        ? Text(
                                            "Release Date is not showing",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            provider
                                                .movieDetailsList[0].releaseDate
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      genretext,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Text(
                                  provider.movieDetailsList[0].overview
                                      .toString(),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                provider.recommendationIsLoading
                                    ? CircularProgressIndicator()
                                    : provider.recommendationList.length >= 1
                                        ? Column(
                                            children: [
                                              Text(
                                                "More like this",
                                              ),
                                              GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:NeverScrollableScrollPhysics() ,
                                                  itemCount: provider
                                                      .recommendationList
                                                      .length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio: 1.2 / 2,
                                                    mainAxisSpacing: 15,
                                                    crossAxisSpacing: 5,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return CachedNetworkImage(
                                                      placeholder: (context,
                                                              url) =>
                                                          ShimmerWidget(
                                                              height: 170,
                                                              width: double
                                                                  .infinity),
                                                      imageUrl:
                                                          "$imageUrl${provider.recommendationList[index].backdropPath}",
                                                      fit: BoxFit.cover,
                                                      height: 170,
                                                      width: double.infinity,
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
                                                    );
                                                  }),
                                            ],
                                          )
                                        : Text("Something went wrong"),
                              ],
                            ),
                          ],
                        ),
                      );
          }),
        ),
      ),
    );
  }
}

class tvDetailPage extends StatelessWidget {
  final int movieId;
  tvDetailPage({super.key, required this.movieId});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ChangeNotifierProvider(
          lazy: true,
          create: (context) => SearchProvider()
            ..tvDetailsController(context, movieId)
            ..tvrecommendationsController(context, movieId),
          child: Consumer<SearchProvider>(builder: (context, provider, child) {
            late String genretext = provider.tvDetailsList[0].genres!
                .map((genre) => genre.name)
                .join(',');
            return provider.tvDetLoading
                ? DetailPagesShimmer()
                : provider.tvDetailsList.isEmpty
                    ? SizedBox.shrink()
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            provider.tvDetailsList.isEmpty
                                ? Text(
                                    "No data found",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                : SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.4,
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        CachedNetworkImage(
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              ShimmerWidget(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  width: double.infinity),
                                          imageUrl:
                                              "$imageUrl${provider.tvDetailsList[0].backdropPath}",
                                          errorWidget:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[800],
                                              child: const Center(
                                                child: Icon(Icons.broken_image,
                                                    color: Colors.grey),
                                              ),
                                            );
                                          },
                                        ),
                                        IconButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_outlined,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ),
                            Column(
                              children: [
                                provider.tvDetailsList[0].title == null
                                    ? Text(
                                        "Title is not available",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    : Text(
                                        provider.tvDetailsList[0].title
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      provider.tvDetailsList[0].releaseDate
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      genretext,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Text(
                                  provider.tvDetailsList[0].overview.toString(),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                provider.tvrecommendationIsLoading
                                    ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ShimmerWidget(height: 200, width: double.infinity),
                                    )
                                    : provider.tvrecommendationList.length >= 1
                                        ? Column(
                                            children: [
                                              Text(
                                                "More like this",
                                              ),
                                              SizedBox(
                                                height: 500,
                                                child: GridView.builder(
                                                    shrinkWrap: true,
                                                    //physics:
                                                    // NeverScrollableScrollPhysics(),
                                                    itemCount: provider
                                                        .recommendationList
                                                        .length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      childAspectRatio: 1.2 / 2,
                                                      mainAxisSpacing: 15,
                                                      crossAxisSpacing: 5,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return CachedNetworkImage(
                                                        placeholder: (context,
                                                                url) =>
                                                            ShimmerWidget(
                                                                height: 170,
                                                                width: double
                                                                    .infinity),
                                                        imageUrl:
                                                            "$imageUrl${provider.tvrecommendationList[index].backdropPath}",
                                                        fit: BoxFit.cover,
                                                        height: 170,
                                                        width: double.infinity,
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
                                                      );
                                                    }),
                                              ),
                                            ],
                                          )
                                        : Text("Something went wrong"),
                              ],
                            ),
                          ],
                        ),
                      );
          }),
        ),
      ),
    );
  }
}
