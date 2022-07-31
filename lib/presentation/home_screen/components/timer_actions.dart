import 'package:evensport/shared/services/get_calories.dart';
import 'package:iconsax/iconsax.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:evensport/presentation/home_screen/components/save_run_dialog.dart';

class TimerActions extends StatefulWidget {
  const TimerActions({
    required this.stopwatch,
    Key? key,
  }) : super(key: key);

  final Stopwatch stopwatch;

  @override
  State<TimerActions> createState() => _TimerActionsState();
}

class _TimerActionsState extends State<TimerActions> {
  Stopwatch? stopWatch;

  @override
  void initState() {
    stopWatch = widget.stopwatch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(kCardPadding),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Wrap(
                spacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        stopWatch!.isRunning
                            ? stopWatch!.stop()
                            : stopWatch!.start();
                      });
                    },
                    icon: Icon(
                      stopWatch!.isRunning ? Iconsax.pause : Iconsax.play,
                      size: bottomNavBarIconSize,
                    ),
                  ),
                  stopWatch!.elapsedMilliseconds != 0
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              double totalRunTime =
                                  (stopWatch!.elapsedMilliseconds / 1000);
                              double calories = double.parse(
                                  getCalories(totalRunTime).toString());
                              stopWatch!.stop();
                              stopWatch!.reset();
                              saveRunDialog(context, totalRunTime, calories);
                            });
                          },
                          icon: Icon(
                            Icons.crop_square,
                            size: bottomNavBarIconSize,
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
