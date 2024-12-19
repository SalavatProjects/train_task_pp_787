import 'package:equatable/equatable.dart';
import 'package:pp_787/storages/models/mood.dart';

class MoodState extends Equatable{

  const MoodState({
    this.id,
    this.iconPath,
    this.name,
    this.generallyFeeling,
    this.strength = 0,
    this.triggeredBy,
    this.date,
  });

  final int? id;
  final String? iconPath;
  final String? name;
  final int? generallyFeeling;
  final int strength;
  final String? triggeredBy;
  final DateTime? date;

  factory MoodState.fromIsarModel(Mood mood) {
    return MoodState(
      id: mood.id,
      iconPath: mood.iconPath,
      name: mood.name,
      generallyFeeling: mood.generallyFeeling,
      strength: mood.strength ?? 0,
      triggeredBy: mood.triggeredBy,
      date: mood.date
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, iconPath, name, generallyFeeling, strength, triggeredBy, date];

  MoodState copyWith({
    int? id,
    String? iconPath,
    String? name,
    int? generallyFeeling,
    int? strength,
    String? triggeredBy,
    DateTime? date,
  }) {
    return MoodState(
      id: id ?? this.id,
      iconPath: iconPath ?? this.iconPath,
      name: name ?? this.name,
      generallyFeeling: generallyFeeling ?? this.generallyFeeling,
      strength: strength ?? this.strength,
      triggeredBy: triggeredBy ?? this.triggeredBy,
      date: date ?? this.date
    );
  }

  Mood toIsarModel() {
    return Mood()
        ..iconPath = iconPath
        ..name = name
        ..generallyFeeling = generallyFeeling
        ..strength = strength
        ..triggeredBy = triggeredBy
        ..date = date;
  }
}

