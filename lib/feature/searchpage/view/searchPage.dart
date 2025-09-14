import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/coponent/shared/component/widgets/shimmers/searchonloadshimmer.dart';
import '../../../core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';
import '../../../core/utils/coponent/shared/constant/constant.dart';
import '../../homepage/view/controller/homecontroller.dart';
import '../controller/searchController.dart';
import 'detailPage.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: Consumer<SearchProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 55,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: () {
                          provider.textController.clear();
                          provider.searchClear();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    controller: provider.textController,
                    onChanged: (value) {
                      provider.searchTvSeriesController(
                          context, provider.textController.text);
                    },
                  ),
                ),
                Expanded(
                  child: Consumer<SearchProvider>(
                    builder: (context, provider, child) {
                      final validItems = provider.searcList
                          .where((item) =>
                              item.backdropPath != null &&
                              item.backdropPath!.isNotEmpty)
                          .toList();

                      return provider.textController.text.isEmpty
                          ? ChangeNotifierProvider(
                              create: (context) => HomePageProvider()
                                ..upcomingMoviesController(context),
                              child: Consumer<HomePageProvider>(
                                  builder: (context, homeProvider, child) {
                                return HomePageProvider().isLoading
                                    ? Searchonloadshimmer()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Top Search",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Expanded(
                                            child: GridView.builder(
                                              //physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                childAspectRatio: 2.5,
                                                mainAxisSpacing: 0,
                                                crossAxisSpacing: 5,
                                              ),
                                              itemCount:
                                                  homeProvider.movie.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding: EdgeInsets.all(10),
                                                  height: 240,
                                                  width: 130,
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) => DetailPage(
                                                                  movieId: homeProvider
                                                                          .movie[
                                                                              index]
                                                                          .id ??
                                                                      0)));
                                                    },
                                                    child: Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                "$imageUrl${homeProvider.movie[index].backdropPath}",
                                                            fit: BoxFit.cover,
                                                            height: 240,
                                                            width: 130,
                                                            placeholder: (context,
                                                                    url) =>
                                                                ShimmerWidget(
                                                                    height: 240,
                                                                    width: 130),
                                                            errorWidget:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Container(
                                                                color: Colors
                                                                    .grey[800],
                                                                child:
                                                                    const Center(
                                                                  child: Icon(
                                                                      Icons
                                                                          .broken_image,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 40),
                                                        Expanded(
                                                          child: Text(
                                                            homeProvider
                                                                .movie[index]
                                                                .title
                                                                .toString(),
                                                            maxLines: 2,
                                                            softWrap: true,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                              }),
                            )
                          : validItems.isEmpty?

                      GridView.builder(

                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.2 / 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(3),
                                    child: ShimmerWidget(height: 170, width: double.infinity),
                                  ),),

                                 SizedBox(height: 4),


                              ],
                            ),
                          );
                        },
                      ):

                      GridView.builder(

                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1.2 / 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 5,
                                  ),
                                  itemCount: validItems.length,
                                  itemBuilder: (context, index) {
                                    final item = validItems[index];
                                    return Container(
                                      margin: const EdgeInsets.all(4),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      tvDetailPage(
                                                          movieId:
                                                              item.id ?? 0)));
                                        },
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "$imageUrl${item.backdropPath}",
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) => ShimmerWidget(height: 170, width: double.infinity),

                                                  height: 170,
                                                  width: double.infinity,
                                                  errorWidget: (context, error,
                                                      stackTrace) {
                                                    return Container(
                                                      color: Colors.grey[800],
                                                      child: const Center(
                                                        child: Icon(
                                                            Icons.broken_image,
                                                            color: Colors.grey),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              item.name.toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
