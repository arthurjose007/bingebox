import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/coponent/shared/component/widgets/comingSoon.dart';
import '../../../../core/utils/coponent/shared/component/widgets/shimmers/hotandnewLoadingshimmer.dart';
import '../../../../core/utils/coponent/shared/constant/constant.dart';
import '../../../homepage/view/controller/homecontroller.dart';
import '../../../homepage/view/model/upcomingmodel.dart';

class CommingSoonMovies extends StatelessWidget {
  int selectedone = 0;
  CommingSoonMovies({super.key, required this.selectedone});
  List<Results> movieListData = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final provider = HomePageProvider();
        // Call the appropriate controller based on selectedone
        if (selectedone == 0) {
          provider.upcomingMoviesController(context);
        } else {
          provider.popularMovieController(context);
        }
        return provider;
      },

      child:
          Consumer<HomePageProvider>(builder: (context, homeProvider, child) {
        if (selectedone == 0) {
          movieListData = homeProvider.movie;
        } else {
          movieListData = homeProvider.popularList;
        }
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body:               homeProvider.popularMovieerrrormessage.isNotEmpty||homeProvider.upcomingerrrormessage.isNotEmpty?Center(child: Text(homeProvider.popularMovieerrrormessage,style: TextStyle(fontSize: 20,color: Colors.white),),):
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context,index){
                    return SizedBox(height: 20,);

                  },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: movieListData.length,
                    itemBuilder: (context, index) {
                      DateTime date = DateTime.parse(
                          movieListData[index].releaseDate.toString());
                      int? day = date.day;
                      String? monthAbbreviation =
                          DateFormat('MMM').format(date);
                      return homeProvider.isLoading||homeProvider.popularIsLoading?
                      HotandNewLoading(): Column(
                        children: [

                          ComingSoon(

                              imageUrl:
                                  "${imageUrl}${movieListData[index].posterPath}",
                              overview:
                                  movieListData[index].overview.toString(),
                              logoUrl:
                                  "${imageUrl}${movieListData[index].backdropPath}",
                              month: monthAbbreviation,
                              day: day.toString(), dateformat: DateFormat('dd-MMM-yyyy').format(date),)
                        ],
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
