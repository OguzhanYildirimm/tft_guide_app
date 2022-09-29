import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tft_guide_app/constants/text_style.dart';
import 'package:tft_guide_app/constants/theme.dart';
import 'package:tft_guide_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teamfight Tactics Guide',
        theme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                color: ProjectColors().colorTransparent,
                centerTitle: true),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: ProjectColors().colorDarkGrey,
                selectedItemColor: ProjectColors().colorAmber,
                unselectedItemColor: ProjectColors().colorWhite,
                selectedIconTheme: const IconThemeData(size: 28),
                selectedLabelStyle: bottomNavBarTextStyle(),
                unselectedLabelStyle: bottomNavBarTextStyle()),
								cardTheme: const CardTheme(shape: RoundedRectangleBorder(),elevation: 5)),
        home: const HomePage());
  }
}
