import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(kCardPadding),
        width: double.maxFinite,
        child: Column(
          children: [
            Text(
              "01 : 10 : 05",
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
                  child: const Text(
                    "220",
                    style: TextStyle(
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
