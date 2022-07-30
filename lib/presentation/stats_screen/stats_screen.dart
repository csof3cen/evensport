import 'package:flutter/material.dart';
import 'package:evensport/shared/components/layouts/scaffold_template.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      index: 2,
      showAppBar: true,
      showBottomNavigationBar: true,
      children: [
        Container(
          height: 200,
          color: Colors.blue,
        ),
      ],
    );
  }
}
