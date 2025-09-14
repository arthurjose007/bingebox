import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/utils/coponent/shared/component/widgets/bottom_nav.dart';
import 'core/utils/coponent/shared/component/widgets/controller_bottom_nav/controller_bottom_nav.dart';
import 'feature/homepage/view/controller/homecontroller.dart';
import 'feature/searchpage/controller/searchController.dart';
import 'feature/searchpage/view/searchPage.dart';
import 'feature/splashScreen/view/splashScreen.dart';
import 'myhttpoverrides/myhttpoverride.dart';
void main() {
  HttpClient.enableTimelineLogging = false;
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomePageProvider()),
    ChangeNotifierProvider(create: (_) => SearchProvider()),
    ChangeNotifierProvider(create: (_) => TabControllerProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'BingeBox',
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.black, fontSize: 24),
            bodyMedium: TextStyle(color: Colors.black, fontSize: 24)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.black),
        fontFamily: GoogleFonts.ptSans().fontFamily,
        useMaterial3: true,
      ),
      home:Splashscreen()
      //SearchPage()
    );
  }
}
