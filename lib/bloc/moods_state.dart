part of 'moods_bloc.dart';

class MoodsState extends Equatable{

  const MoodsState({
    this.moods = const [],
    this.reflections = const [],
    this.triggers = const [],
    this.anchors = const [],
    this.date,
  });

  final List<MoodState> moods;
  final List<ReflectionState> reflections;
  final List<TriggerState> triggers;
  final List<AnchorState> anchors;
  final DateTime? date;

  @override
  // TODO: implement props
  List<Object?> get props => [moods, reflections, triggers, anchors, date];

  MoodsState copyWith({
    List<MoodState>? moods,
    List<ReflectionState>? reflections,
    List<TriggerState>? triggers,
    List<AnchorState>? anchors,
    DateTime? date,
  }) {
    return MoodsState(
        moods: moods ?? this.moods,
        reflections: reflections ?? this.reflections,
        triggers: triggers ?? this.triggers,
        anchors: anchors ?? this.anchors,
        date: date ?? this.date,
    );
  }
}

