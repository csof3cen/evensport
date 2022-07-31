import 'dart:async';
import 'package:evensport/main.dart';
import 'components/timer_actions.dart';
import 'package:flutter/material.dart';
import 'package:evensport/consts.dart';
import 'components/stopwatch_status_card.dart';
import 'package:evensport/shared/services/get_calories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stopwatch stopwatch = getStopWatch();
  double seconds = 0;
  double calories = 0;

  incrementData() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds = stopwatch.elapsedMilliseconds / 1000;
      getCalories(seconds);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            incrementData();
          });
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StopWatchStatusCard(seconds: seconds, calories: calories),
        Container(
          margin: EdgeInsets.only(top: kPadding),
          child: TimerActions(stopwatch: stopwatch),
        ),
      ],
    );
  }
}
