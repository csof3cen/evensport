import 'package:intl/intl.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:evensport/shared/extensions/strings.dart';
import 'package:evensport/shared/components/layouts/scaffold_template.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();

    return ScaffoldTemplate(
      index: 1,
      showAppBar: true,
      showBottomNavigationBar: true,
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Aujourd'hui"),
                Text(
                  DateFormat.yMMMMEEEEd("fr").format(today).capitalize(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: kPadding),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kPrimaryColor.withOpacity(0.1),
                  ),
                  child: const Text(
                    "Séance de Footing à 17h",
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: kPadding),
          child: Card(
            child: Container(
              height: 500,
              padding: EdgeInsets.all(kPadding),
            ),
          ),
        ),
      ],
    );
  }
}
