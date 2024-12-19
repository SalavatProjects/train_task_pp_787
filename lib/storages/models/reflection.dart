import 'package:isar/isar.dart';

part 'reflection.g.dart';

@collection
class Reflection {
  Id id = Isar.autoIncrement;

  String? firstWord;
  String? secondWord;
  String? thirdWord;
  String? feelSameThing;
  String? describeAnotherPerson;
  String? emotionInfluenceActions;
  String? emotionInBody;
  DateTime? date;
}