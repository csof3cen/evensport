import 'package:evensport/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: homeScreenRoute,
      theme: appTheme,
    );
  }
}
