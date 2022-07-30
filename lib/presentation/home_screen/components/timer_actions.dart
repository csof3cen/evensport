import 'package:iconsax/iconsax.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(kCardPadding),
        child: SizedBox(
          width: double.maxFinite,
          child: Wrap(
            spacing: 30,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.play),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.pause),
              )
            ],
          ),
        ),
      ),
    );
  }
}
