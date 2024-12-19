import 'package:isar/isar.dart';

part 'mood.g.dart';

@collection
class Mood {
  Id id = Isar.autoIncrement;

  String? iconPath;
  String? name;
  int? generallyFeeling;
  int? strength;
  String? triggeredBy;
  DateTime? date;
}