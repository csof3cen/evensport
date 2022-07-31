import 'package:hive/hive.dart';

part 'seance.g.dart';

@HiveType(typeId: 1)
class Seance extends HiveObject {
  @HiveField(0)
  int dayInWeek = 0;

  @HiveField(1)
  String type = "";

  @HiveField(2)
  DateTime? date;
}
