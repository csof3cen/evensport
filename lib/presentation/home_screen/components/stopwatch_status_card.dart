import 'dart:async';

import 'package:evensport/consts.dart';
import 'package:evensport/shared/services/get_calories.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:evensport/shared/extensions/double.dart';
import 'package:evensport/shared/services/formatted_stop_watch.dart';

class StopWatchStatusCard extends StatefulWidget {
  const StopWatchStatusCard({
    Key? key,
    required this.seconds,
    required this.calories,
  }) : super(key: key);

  final double seconds;
  final double calories;

  @override
  State<StopWatchStatusCard> createState() => _StopWatchStatusCardState();
}

class _StopWatchStatusCardState extends State<StopWatchStatusCard> {
  double calories = 0.0;
  incrementData() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      calories = getCalories(widget.seconds);
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
    return Card(
      child: Container(
        padding: EdgeInsets.all(kCardPadding),
        width: double.maxFinite,
        child: Column(
          children: [
            Text(
              formattedStopwatch(widget.seconds),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: kPadding),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                color: kSuccessColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Séance de Footing",
                style: TextStyle(
                  color: kSuccessColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: kPadding),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kWarningColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const HeroIcon(
                    HeroIcons.fire,
                    color: kWarningColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kPadding / 2.5),
                  child: Text(
                    "${calories.toPrecision(3)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Text(
                  "Calories",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
