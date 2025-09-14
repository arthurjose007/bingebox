import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/coponent/shared/component/widgets/custom_Listview_image.dart';
import '../../../core/utils/coponent/shared/component/widgets/shimmers/CarouselShimmer.dart';
import '../../../core/utils/coponent/shared/component/widgets/controller_bottom_nav/controller_bottom_nav.dart';
import '../../../core/utils/coponent/shared/component/widgets/custom_carousel.dart';
import '../../../core/utils/coponent/shared/component/widgets/shimmers/customListimagehompageShimmer.dart';
import '../../../core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';
import '../../../core/utils/coponent/shared/config/colors.dart';
import '../../../core/utils/coponent/shared/constant/constant.dart';
import 'controller/homecontroller.dart';

class Homepage extends StatelessWidget {
  Homepage({
    super.key,
  });

  @override
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider()
        ..tvSeriesController(context)
        ..upcomingMoviesController(context)
        ..nowplayingController(context)
        ..topRatedController(context)
        ..popularMovieController(context),
      child: Consumer<HomePageProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              leading:Text("  B",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 38,color: Colors.white),),
              title: Text("BingeBox",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 27,color: Colors.white),),
              actions: [
                InkWell(
                  onTap: () {
                    Provider.of<TabControllerProvider>(context, listen: false)
                        .changeIndex(1);
                  },
                  child: Icon(
                    Icons.search,
                    color: AppColor.primaryColor,
                  ),
                ),

                SizedBox(
                  width: 20,
                )
              ],
            ),
            body:
                Consumer<HomePageProvider>(builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    provider.tvisLoading
                        ? CarouselShimmer()
                        : CustomCarousel(
                            data: provider.tvResult,
                          ),
                    SizedBox(height: 18,),
                    Text(
                      "Upcoming Movies",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    provider.isLoading
                        ? SizedBox(
                            height: media.height * 0.285,
                            child: shimmerListView(
                                itemCount: 10,
                                height: media.height,
                                width: media.width))
                        : provider.movie.isNotEmpty
                            ? SizedBox(
                                height: media.height * 0.285,
                                width: double.infinity,
                                child: CustomListviewImage(
                                    size: media,
                                    length: provider.movie.length,
                                    results: provider.movie))
                            :SizedBox(
                        height: media.height * 0.285,
                        width: double.infinity,
                        child: BrokenImageView(
                            size: media,
                            length:10,
                            )),

                     // Image.asset('images/5.gif',height: 300,width: 300,),
                    Text(
                      "Now Playing",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    provider.nowisLoading
                        ? SizedBox(
                        height: media.height * 0.285,
                            child: shimmerListView(
                                itemCount: 10,
                                height: media.height,
                                width: media.width))
                        : provider.nowPlayMovie.isNotEmpty
                            ? SizedBox(
                        height: media.height * 0.285,
                                width: media.width,
                                child: CustomListviewImage(
                                  size: media,
                                  length: provider.nowPlayMovie.length,
                                  results: provider.nowPlayMovie,
                                ))
                            :SizedBox(
                        height: media.height * 0.285,
                        width: double.infinity,
                        child: BrokenImageView(
                          size: media,
                          length:10,
                        )),
//Top Rated

                    Text(
                      "Top Rated",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    provider.topRatedIsLoading
                        ? SizedBox(
                        height: media.height * 0.285,
                            child: shimmerListView(
                                itemCount: 10,
                                height: media.height,
                                width: media.width))
                        : provider.topRated.isNotEmpty
                            ? SizedBox(
                        height: media.height * 0.285,
                                width: media.width,
                                child: CustomListviewImage(
                                  size: media,
                                  length: provider.topRated.length,
                                  results: provider.topRated,
                                ))
                            :SizedBox(
                        height: media.height * 0.285,
                  width: double.infinity,
                  child: BrokenImageView(
                  size: media,
                  length:10,
                  )),
//popular Movies
                    Text(
                      "Popular Movies",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    provider.popularIsLoading
                        ? SizedBox(
                        height: media.height * 0.285,
                            child: shimmerListView(
                                itemCount: 10,
                                height: media.height,
                                width: media.width))
                        : provider.popularList.isNotEmpty
                            ? SizedBox(
                        height: media.height * 0.285,
                                width: media.width,
                                child: CustomListviewImage(
                                  size: media,
                                  length: provider.popularList.length,
                                  results: provider.popularList,
                                ))
                            : SizedBox(
                        height: media.height * 0.285,
                        width: double.infinity,
                        child: BrokenImageView(
                          size: media,
                          length:10,
                        )),

                    //      Image.asset('images/under_construction.gif',height: 300,width: 300,),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

Widget shimmerListView(
    {required int itemCount, required double height, required double width}) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: itemCount,
    itemBuilder: (context, index) => const Padding(
      padding: EdgeInsets.only(bottom: 10.0, left: 8),
      child: ShimmerWidget(height: 150, width: 135),
    ),
  );
}
//
// class CustomInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // If the input is empty, allow it
//     if (newValue.text.isEmpty) return newValue;
//
//     // Check the position of the cursor
//     int selectionIndex = newValue.selection.end;
//
//     // If the first character is being entered
//     if (selectionIndex == 1) {
//       // Only allow a letter as the first character
//       if (!RegExp(r'^[a-zA-Z]*$').hasMatch(newValue.text[0])) {
//         return oldValue; // reject if not a letter
//       }
//     }
//
//     return newValue;
//   }
// }
// TextField(
// // maxLength: 10,
// controller: textEditingController,
// autofocus: true,
// style: TextStyle(fontSize: 10),
// inputFormatters: [
// CustomInputFormatter(),
// FilteringTextInputFormatter.allow(
// RegExp(r'^[a-zA-Z0-9]*$')),
// LengthLimitingTextInputFormatter(10),
// ],
// contextMenuBuilder: (context, editableTextState) {
// return const SizedBox();
// },
// onChanged: (value) {
// // notifier.setText(value);
// print(textEditingController.text);
// },
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.grey),
// ),
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.grey), // Border color when enabled
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.grey,
// width: 2), // Border color when focused
// ),
// contentPadding: EdgeInsets.all(20),
// ),
// ),
