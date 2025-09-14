
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/homepage/view/homepage.dart';
import '../../../../../../feature/hotAndNew/view/hotandnew.dart';
import '../../../../../../feature/searchpage/view/searchPage.dart';
import 'controller_bottom_nav/controller_bottom_nav.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabControllerProvider(),
      child: Builder(
        builder: (context) {
          return DefaultTabController(
            length: 3,
            child: Consumer<TabControllerProvider>(
              builder: (context, tabProvider, _) {
                // Get the controller and sync with provider
                final controller = DefaultTabController.of(context);
                if (controller != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    tabProvider.setController(controller);
                  });
                }


                return Scaffold(
                  backgroundColor: Colors.black,
                  bottomNavigationBar: Container(
                    color: Colors.black,
                    height: 70,
                    child: TabBar(
                      onTap: (index) => tabProvider.changeIndex(index),
                      tabs: const [
                        Tab(icon: Icon(Icons.home), text: "Home"),
                        Tab(icon: Icon(Icons.search), text: "Search"),
                        Tab(icon: Icon(Icons.person), text: 'New and Hot'),
                      ],
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.cyanAccent,
                    ),
                  ),
                  body:  TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Homepage(),
                      SearchPage(),
                      Hotandnew(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}