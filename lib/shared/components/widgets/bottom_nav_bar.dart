import 'package:flutter/material.dart';
import 'package:evensport/config.dart';
import 'package:evensport/consts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:evensport/shared/services/push_screen_without_animation.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        pushScreenWithoutAnimation(
          context,
          target: bottomNavigationBarItems[index],
        );
      },
      items: [
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.lightningBolt, size: bottomNavBarIconSize),
          label: "Courir",
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.calendar, size: bottomNavBarIconSize),
          label: "Calendrier",
        ),
        BottomNavigationBarItem(
          icon: HeroIcon(HeroIcons.chartPie, size: bottomNavBarIconSize),
          label: "Statistiques",
        ),
      ],
    );
  }
}
