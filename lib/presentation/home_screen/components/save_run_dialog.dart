import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:evensport/shared/models/course.dart';
import 'package:evensport/shared/services/formatted_stop_watch.dart';

Future<dynamic> saveRunDialog(
    BuildContext context, double totalRunTime, double calories) async {
  var coursesBox = await Hive.openBox(runningsBoxName);
  Course course = Course();
  var currentSeance = coursesBox.get(weeksSeances)[DateTime.now().weekday - 1];
  TextEditingController distanceController = TextEditingController();
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(kCardPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formattedStopwatch(totalRunTime),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Distance parcourue en mètres"),
                      const SizedBox(height: 5),
                      TextField(
                        controller: distanceController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          label: Text("Distance parcourue"),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Annuler"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          course.seance = currentSeance;
                          course.date = DateTime.now();
                          course.calories = calories;
                          course.distance = double.parse(
                              distanceController.text.replaceAll(",", "."));
                          course.duration = formattedStopwatch(totalRunTime);
                          course.speed =
                              ((course.distance / totalRunTime) * 3.6);
                          coursesBox.get(coursesList).add(course);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: kFgColor,
                              content: Text(
                                "Séance enregistrée",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text("Enregistrer"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}
