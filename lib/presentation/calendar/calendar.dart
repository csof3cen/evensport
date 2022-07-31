import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:evensport/shared/extensions/strings.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var coursesBox = Hive.openBox(runningsBoxName);

  TextEditingController courseHourController = TextEditingController();

  var selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();

    getCurrentWeekDays() {
      dayFormatted(day) => DateFormat.E("fr").format(day).toUpperCase();

      List<Widget> days = [];
      for (var i = 0; i < 7; i++) {
        var nextDay = today.add(Duration(days: i));
        days.add(
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedDay = nextDay;
                });
              },
              child: Ink(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 40,
                  child: Column(
                    children: [
                      Text(
                        dayFormatted(nextDay)
                            .substring(0, dayFormatted(nextDay).length - 1),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: (nextDay.day == selectedDay.day)
                              ? kPrimaryColor
                              : Colors.transparent,
                        ),
                        child: Text(
                          nextDay.day.toString().padLeft(2, '0'),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - ((kPadding * 4) + 10),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: days,
          ),
        ),
      );
    }

    return Column(
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
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(kPadding),
                  child: Column(
                    children: [
                      getCurrentWeekDays(),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: kPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                DateFormat.yMMMMEEEEd("fr")
                                    .format(selectedDay)
                                    .capitalize(),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: kPadding / 2),
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kWarningColor.withOpacity(0.1),
                              ),
                              child: const Text(
                                "Séance de ...",
                                // "Séance de ${coursesBox.get(weeksSeances)[DateTime.now().weekday - 1].type} à ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: kWarningColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: kPadding),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: Card(
                                          child: Container(
                                            height: 200,
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                                child: const Text("Modifier la séance"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: kPadding),
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: ((context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(kCardPadding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Heure des séances"),
                            const SizedBox(height: 3),
                            const TextField(
                              autofocus: true,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: false,
                                signed: false,
                              ),
                              decoration: InputDecoration(
                                label: Text("Heure des séances"),
                              ),
                            ),
                            SizedBox(height: kPadding),
                            Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  // await getBox().put(
                                  //   courseHour,
                                  //   courseHourController.value,
                                  // );
                                },
                                child: const Text("Enregistrer"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
            child: const Text("Modifier l'heure des séances"),
          ),
        ),
      ],
    );
  }
}
