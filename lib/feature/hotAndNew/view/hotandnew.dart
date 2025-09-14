import 'package:flutter/material.dart';
import 'package:netfo/feature/hotAndNew/view/view/comingSoon.dart';

import '../../../core/utils/coponent/shared/config/colors.dart';
import '../../../core/utils/coponent/shared/constant/constant.dart';

class Hotandnew extends StatelessWidget {
  const Hotandnew({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Text(
              "New & hot",
              style: TextStyle(color: AppColor.primaryColor),
            ),
            actions: [
              Icon(
                Icons.cast,
                color: AppColor.primaryColor,
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(6),
              //   child: Container(
              //     color: Colors.blue,
              //     height: 27,
              //     width: 27,
              //   ),
              // ),
              SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
                isScrollable: false,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.primaryColor),
                padding: EdgeInsets.symmetric(horizontal: 50),
                dividerColor: AppColor.backGroundColor,
                labelColor: AppColor.backGroundColor,
                unselectedLabelColor: AppColor.primaryColor,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                tabs: [
                  Tab(
                    text: ' 🍿 Coming Soon',
                  ),
                  Tab(
                    text: " 🔥 Everyone's watching",
                  )
                ]),
          ),
          body: TabBarView(children: [
            CommingSoonMovies(
              selectedone: 0,
            ),
            CommingSoonMovies(
              selectedone: 1,
            ),
          ]),
        )));
  }
}
