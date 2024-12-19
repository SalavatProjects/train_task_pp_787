import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pp_787/storages/models/mood.dart';
import 'package:pp_787/storages/models/reflection.dart';
import 'package:pp_787/storages/models/trigger.dart';
import 'package:pp_787/storages/models/anchor.dart';

abstract class AppIsarDatabase {
  static late final Isar _instance;

  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return _instance = await Isar.open(
        [MoodSchema, ReflectionSchema, TriggerSchema, AnchorSchema],
        directory: dir.path,
    );
  }

  static Future<List<Mood>> getMoods() async {
    return await _instance.writeTxn(
        () async => await _instance.moods.where().findAll(),
    );
  }

  static Future<void> addMood(Mood mood) async {
    await _instance.writeTxn(() async => await _instance.moods.put(mood));
  }

  static Future<List<Reflection>> getReflections() async {
    return await _instance.writeTxn(
        () async => await _instance.reflections.where().findAll(),
    );
  }

  static Future<void> addReflection(Reflection reflection) async {
    await _instance.writeTxn(() async => await _instance.reflections.put(reflection));
  }

  static Future<void> updateReflection(int id, Reflection newReflection) async {
    await _instance.writeTxn(() async {
      final reflection = await _instance.reflections.get(id);
      if (reflection != null) {
        reflection
          ..firstWord = newReflection.firstWord
          ..secondWord = newReflection.secondWord
          ..thirdWord = newReflection.thirdWord
          ..feelSameThing = newReflection.feelSameThing
          ..describeAnotherPerson = newReflection.describeAnotherPerson
          ..emotionInfluenceActions = newReflection.emotionInfluenceActions
          ..emotionInBody = newReflection.emotionInBody
          ..date = newReflection.date;
        return await _instance.reflections.put(reflection);
      }
    });
  }

  static Future<List<Trigger>> getTriggers() async {
    return await _instance.writeTxn(
        () async => await _instance.triggers.where().findAll(),
    );
  }

  static Future<void> addTrigger(Trigger trigger) async {
    await _instance.writeTxn(() async => await _instance.triggers.put(trigger));
  }

  static Future<void> updateTrigger(int id, Trigger newTrigger) async {
    await _instance.writeTxn(() async {
      final trigger = await _instance.triggers.get(id);
      if (trigger != null) {
        trigger
          ..name = newTrigger.name
          ..iconsPath = newTrigger.iconsPath;
        return await _instance.triggers.put(trigger);
      }
    });
  }

  static Future<List<Anchor>> getAnchors() async {
    return await _instance.writeTxn(
          () async => await _instance.anchors.where().findAll(),
    );
  }

  static Future<void> addAnchor(Anchor anchor) async {
    await _instance.writeTxn(() async => await _instance.anchors.put(anchor));
  }

  static Future<void> updateAnchor(int id, Anchor newAnchor) async {
    await _instance.writeTxn(() async {
      final anchor = await _instance.anchors.get(id);
      if (anchor != null) {
        anchor.name = newAnchor.name;
        return await _instance.anchors.put(anchor);
      }
    });
  }
}