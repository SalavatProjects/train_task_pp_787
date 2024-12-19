import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:pp_787/bloc/anchor_state.dart';
import 'package:pp_787/storages/isar.dart';
import 'package:pp_787/bloc/mood_state.dart';
import 'package:pp_787/bloc/reflection_state.dart';
import 'package:pp_787/bloc/trigger_state.dart';
import 'package:pp_787/storages/models/reflection.dart';

part 'moods_state.dart';

class MoodsBloc extends Cubit<MoodsState> {
  MoodsBloc() : super(const MoodsState());

  Future<void> getMoods() async {
    final moods = await AppIsarDatabase.getMoods();
    emit(state.copyWith(
        moods: moods.map((e) => MoodState.fromIsarModel(e)).toList())
    );
  }

  Future<void> addMood(MoodState mood) async {
    await AppIsarDatabase.addMood(mood.toIsarModel());
    await getMoods();
  }

  Future<void> getReflections() async {
    final reflections = await AppIsarDatabase.getReflections();
    emit(state.copyWith(
      reflections: reflections.map((e) => ReflectionState.fromIsarModel(e)).toList()
    ));
  }

  Future<void> addReflection(ReflectionState reflection) async {
    await AppIsarDatabase.addReflection(reflection.toIsarModel());
    await getReflections();
  }

  /*Future<void> updateReflection(int id, ReflectionState reflection) async {
    await AppIsarDatabase.updateReflection(id, reflection.toIsarModel());
    await getReflections();
  }*/

  Future<void> getTriggers() async {
    final triggers = await AppIsarDatabase.getTriggers();
    emit(state.copyWith(
        triggers: triggers.map((e) => TriggerState.fromIsarModel(e)).toList()
    ));
  }

  Future<void> addTrigger(TriggerState trigger) async {
    await AppIsarDatabase.addTrigger(trigger.toIsarModel());
    await getTriggers();
  }

  Future<void> updateTrigger(int id, TriggerState trigger) async {
    await AppIsarDatabase.updateTrigger(id, trigger.toIsarModel());
    await getTriggers();
  }

  Future<void> deleteTrigger(int id) async {
    await AppIsarDatabase.deleteTrigger(id);
    await getTriggers();
  }

  Future<void> getAnchors() async {
    final anchors = await AppIsarDatabase.getAnchors();
    emit(state.copyWith(
        anchors: anchors.map((e) => AnchorState.fromIsarModel(e)).toList()
    ));
  }

  Future<void> addAnchor(AnchorState anchor) async {
    await AppIsarDatabase.addAnchor(anchor.toIsarModel());
    await getAnchors();
  }

  Future<void> updateAnchor(int id, AnchorState anchor) async {
    await AppIsarDatabase.updateAnchor(id, anchor.toIsarModel());
    await getAnchors();
  }

  void updateDate(DateTime value) {
    emit(state.copyWith(date: value));
  }
}
