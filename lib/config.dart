import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:evensport/presentation/calendar/calendar.dart';
import 'package:evensport/presentation/home_screen/home_screen.dart';
import 'package:evensport/presentation/stats_screen/stats_screen.dart';

const homeScreenRoute = "/";
const calendarScreenRoute = "/calendrier";
const statsScreenRoute = "/calendrier";

const bottomNavigationBarItems = [
  HomeScreen(),
  CalendarScreen(),
  StatsScreen(),
];

Map<String, Widget Function(BuildContext)> appRoutes = {
  homeScreenRoute: (context) => const HomeScreen(),
  calendarScreenRoute: (context) => const CalendarScreen(),
  // ignore: equal_keys_in_map
  statsScreenRoute: (context) => const StatsScreen(),
};

var appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 5,
  ),
  scaffoldBackgroundColor: kBgColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0XFF1B1B29),
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    sizeConstraints: BoxConstraints(minHeight: 70, minWidth: 70),
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
  ),
  cardTheme: CardTheme(
    color: kFgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCardBorderRadius),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    ),
  ),
);
