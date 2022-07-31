import 'package:hive/hive.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'components/training_card.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    var coursesBox = Hive.box(runningsBoxName);
    List<Widget> courses = [];

    for (var i = 0; i < coursesBox.get(coursesList).length; i++) {
      var course = coursesBox.get(coursesList)[i];
      courses.add(
        trainingCard(
          distance: course.distance,
          seance: course.seance,
          context: context,
          speed: course.speed.round(),
          calories: course.calories.round(),
          duration: course.duration!,
          date: course.date!,
        ),
      );
    }

    // Trier par plus récent
    courses = courses.reversed.toList();

    return Column(
      children: [
        Card(
          child: Container(
            height: 400,
          ),
        ),
        Column(
          children: courses,
        ),
      ],
    );
  }
}
