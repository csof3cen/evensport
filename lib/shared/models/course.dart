import 'package:hive/hive.dart';
import 'package:evensport/shared/models/seance.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
class Course extends HiveObject {
  @HiveField(0)
  DateTime? date;

  @HiveField(1)
  double distance = 0;

  @HiveField(2)
  String? duration;

  @HiveField(3)
  double speed = 0;

  @HiveField(4)
  double calories = 0;

  @HiveField(5)
  Seance? seance;
}
