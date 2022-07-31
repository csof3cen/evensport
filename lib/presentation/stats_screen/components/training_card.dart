import 'package:evensport/shared/models/seance.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:evensport/shared/extensions/strings.dart';
import 'package:evensport/shared/components/widgets/running_attribute.dart';

trainingCard({
  required int speed,
  required int calories,
  required String duration,
  required BuildContext context,
  required DateTime date,
  required Seance? seance,
  required double distance,
}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: kPadding),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(kCardPadding),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    DateFormat.yMMMMEEEEd("fr")
                        .format(date)
                        .toString()
                        .capitalize(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kPadding / 2),
                  child: Text(
                    "Séance de ${seance != null ? seance.type : 'type inconnue'} à ${seance != null ? seance.date!.hour : '(une heure inconnue)'}h sur une distance totale de ${distance / 1000} Km",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kPadding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      children: [
                        RuningAtrribute(
                          label: duration,
                          subLabel: "Temps",
                          icon: const Icon(
                            Iconsax.timer,
                            color: kPrimaryColor,
                          ),
                          labelColor: kPrimaryColor,
                          bgColor: kPrimaryColor,
                        ),
                        RuningAtrribute(
                          label: "$speed Km / h",
                          subLabel: "Vitesse",
                          labelColor: kSuccessColor,
                          bgColor: kSuccessColor,
                          icon: const Icon(
                            Iconsax.speedometer,
                            color: kSuccessColor,
                          ),
                        ),
                        RuningAtrribute(
                          label: "$calories",
                          subLabel: "Calories",
                          labelColor: kWarningColor,
                          bgColor: kWarningColor,
                          icon: const HeroIcon(
                            HeroIcons.fire,
                            color: kWarningColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
