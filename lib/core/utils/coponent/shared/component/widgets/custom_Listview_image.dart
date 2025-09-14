import 'package:flutter/material.dart';

import '../../../../../../feature/homepage/view/model/upcomingmodel.dart';
import '../../../../../../feature/searchpage/view/detailPage.dart';
import '../../constant/constant.dart';

class CustomListviewImage extends StatelessWidget {
  List<Results> results;
  int length;
  Size size;

   CustomListviewImage({super.key,required this.length,required this.results,required this.size});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

        shrinkWrap: true,
        scrollDirection:Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(
                              movieId:
                              results[
                              index]
                                  .id ??
                                  0)));
            },
            child: Column(
              children: [
                //Text("${provider.movie[index].title}",style: TextStyle(color: Colors.white),),
            Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 8,),
                  child:
                  ClipRRect(

                      borderRadius:BorderRadius.circular(10),
                      child: Image.network("${imageUrl}${results[index].posterPath}",height: size.height*0.250 ,width: size.width*0.328,fit: BoxFit.cover,)),
                ),
              ],
            ),
          );
        });
  }
}
