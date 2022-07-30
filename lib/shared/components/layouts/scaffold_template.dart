import '../widgets/app_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:heroicons/heroicons.dart';

class ScaffoldTemplate extends StatelessWidget {
  const ScaffoldTemplate({
    this.index = 0,
    required this.children,
    this.showAppBar = false,
    this.showBottomNavigationBar = false,
    this.showFloatingActionButton = false,
    Key? key,
  }) : super(key: key);

  final int index;
  final bool showAppBar;
  final List<Widget> children;
  final bool showBottomNavigationBar;
  final bool showFloatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showFloatingActionButton
          ? FloatingActionButton(
              tooltip: "Ajouter un nouveau type de séance",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Card(
                        child: Container(
                          height: 300,
                        ),
                      ),
                    );
                  }),
                );
              },
              child: Icon(
                Iconsax.add,
                size: bottomNavBarIconSize,
              ),
            )
          : null,
      drawer: const AppDrawer(),
      appBar: showAppBar
          ? AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    tooltip: "Ouvrir le menu de navigation",
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const HeroIcon(HeroIcons.menuAlt2),
                  );
                },
              ),
              title: const Text(appName),
            )
          : null,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
          padding: EdgeInsets.only(bottom: kPadding),
          child: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          showBottomNavigationBar ? BottomNavBar(index: index) : null,
    );
  }
}
