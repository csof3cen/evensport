import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:evensport/presentation/calendar/calendar.dart';
import 'package:evensport/presentation/home_screen/home_screen.dart';
import 'package:evensport/presentation/stats_screen/stats_screen.dart';
import 'package:evensport/shared/components/layouts/scaffold_template.dart';

const homeScreenRoute = "/";
const calendarScreenRoute = "/calendrier";
const statsScreenRoute = "/calendrier";

List<Widget> bottomNavigationBarItems() {
  return const [
    HomeScreen(),
    CalendarScreen(),
    StatsScreen(),
  ];
}

Map<String, Widget Function(BuildContext)> appRoutes(Stopwatch stopwatch) {
  return {
    homeScreenRoute: (context) => const ScaffoldTemplate(
          showFloatingActionButton: true,
          child: HomeScreen(),
        ),
    calendarScreenRoute: (context) => const ScaffoldTemplate(
          child: CalendarScreen(),
        ),
    // ignore: equal_keys_in_map
    statsScreenRoute: (context) => const ScaffoldTemplate(
          child: StatsScreen(),
        ),
  };
}

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
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: kPrimaryColor,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: false,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(15),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(horizontal: 13),
    labelStyle: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: Colors.grey.withOpacity(0.3),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);
