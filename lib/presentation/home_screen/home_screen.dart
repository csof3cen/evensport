import 'components/status_card.dart';
import 'components/timer_actions.dart';
import 'package:flutter/material.dart';
import 'package:evensport/consts.dart';
import 'package:evensport/shared/components/layouts/scaffold_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      showAppBar: true,
      showBottomNavigationBar: true,
      children: [
        const StatusCard(),
        Container(
          margin: EdgeInsets.only(top: kPadding),
          child: const TimerActions(),
        ),
      ],
    );
  }
}
