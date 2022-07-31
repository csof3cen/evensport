import 'package:evensport/config.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:evensport/shared/models/course.dart';
import 'package:evensport/shared/models/seance.dart';

Stopwatch stopwatch = Stopwatch();
getStopWatch() {
  return stopwatch;
}

List<Seance> weekSeancesList = [
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Footing",
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Footing",
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Fractionné",
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Fractionné",
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Footing Recupération",
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Footing",
  Seance()
    ..dayInWeek = 0
    ..date = DateTime.now()
    ..type = "Sortie Longue",
];

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..registerAdapter(CourseAdapter())
    ..registerAdapter(SeanceAdapter());

  await Hive.initFlutter();
  await Hive.openBox(runningsBoxName);
  //
  Box runbox = await Hive.openBox(runningsBoxName);
  // runbox.deleteAll([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

  runbox.put(coursesList, []);
  runbox.put(courseHour, 17);
  runbox.put(weeksSeances, weekSeancesList);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    stopwatch = Stopwatch();
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes(stopwatch),
      initialRoute: homeScreenRoute,
      theme: appTheme,
    );
  }
}
