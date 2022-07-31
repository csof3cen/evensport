import '../widgets/app_drawer.dart';
import 'package:evensport/main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:evensport/consts.dart';
import 'package:flutter/material.dart';
import 'package:evensport/config.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScaffoldTemplate extends StatefulWidget {
  const ScaffoldTemplate({
    this.index = 0,
    required this.child,
    this.showFloatingActionButton = false,
    Key? key,
  }) : super(key: key);

  final int index;
  final Widget child;
  final bool showFloatingActionButton;

  @override
  State<ScaffoldTemplate> createState() => _ScaffoldTemplateState();
}

class _ScaffoldTemplateState extends State<ScaffoldTemplate> {
  int index = 0;
  Widget child = Container();

  @override
  void initState() {
    index = widget.index;
    child = widget.child;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedIconTheme: const IconThemeData(color: kPrimaryColor),
          unselectedItemColor: Colors.grey,
          onTap: (indexTab) {
            if (stopwatch.isRunning || stopwatch.elapsedMilliseconds != 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: kFgColor,
                  content: Text(
                    "Concentrez-vous sur la course !",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
              return;
            }
            setState(() {
              index = indexTab;
              child = bottomNavigationBarItems()[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:
                  HeroIcon(HeroIcons.lightningBolt, size: bottomNavBarIconSize),
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
        ),
        floatingActionButton: widget.showFloatingActionButton
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
        appBar: AppBar(
          elevation: 3,
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
        ),
        body: ValueListenableBuilder<Box>(
          valueListenable: Hive.box(runningsBoxName).listenable(),
          builder: (context, box, widget) {
            return SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
                padding: EdgeInsets.only(bottom: kPadding),
                child: SingleChildScrollView(
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
