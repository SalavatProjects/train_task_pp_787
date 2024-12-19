import 'package:isar/isar.dart';

part 'anchor.g.dart';

@collection
class Anchor {
  Id id = Isar.autoIncrement;

  String? name;
}