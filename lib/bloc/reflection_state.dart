import 'package:equatable/equatable.dart';
import 'package:pp_787/storages/models/reflection.dart';

class ReflectionState extends Equatable{
  const ReflectionState({
    this.id,
    this.firstWord,
    this.secondWord,
    this.thirdWord,
    this.feelSameThing,
    this.describeAnotherPerson,
    this.emotionInfluenceActions,
    this.emotionInBody,
    this.date,
  });

  final int? id;
  final String? firstWord;
  final String? secondWord;
  final String? thirdWord;
  final String? feelSameThing;
  final String? describeAnotherPerson;
  final String? emotionInfluenceActions;
  final String? emotionInBody;
  final DateTime? date;

  factory ReflectionState.fromIsarModel(Reflection reflection) {
    return ReflectionState(
        id: reflection.id,
        firstWord: reflection.firstWord,
        secondWord: reflection.secondWord,
        thirdWord: reflection.thirdWord,
        feelSameThing: reflection.feelSameThing,
        describeAnotherPerson: reflection.describeAnotherPerson,
        emotionInfluenceActions: reflection.emotionInfluenceActions,
        emotionInBody: reflection.emotionInBody,
        date: reflection.date,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    firstWord,
    secondWord,
    thirdWord,
    feelSameThing,
    describeAnotherPerson,
    emotionInfluenceActions,
    emotionInBody,
    date,
  ];

  ReflectionState copyWith({
    int? id,
    String? firstWord,
    String? secondWord,
    String? thirdWord,
    String? feelSameThing,
    String? describeAnotherPerson,
    String? emotionInfluenceActions,
    String? emotionInBody,
    DateTime? date,
  }) {
    return ReflectionState(
        id: id ?? this.id,
        firstWord: firstWord ?? this.firstWord,
        secondWord: secondWord ?? this.secondWord,
        thirdWord: thirdWord ?? this.thirdWord,
        feelSameThing: feelSameThing ?? this.feelSameThing,
        describeAnotherPerson: describeAnotherPerson ?? this.describeAnotherPerson,
        emotionInfluenceActions: emotionInfluenceActions ?? this.emotionInfluenceActions,
        emotionInBody: emotionInBody ?? this.emotionInBody,
        date: date ?? this.date,
    );
  }

  Reflection toIsarModel() {
    return Reflection()
    ..firstWord = firstWord
    ..secondWord = secondWord
    ..thirdWord = thirdWord
    ..feelSameThing = feelSameThing
    ..describeAnotherPerson = describeAnotherPerson
    ..emotionInfluenceActions = emotionInfluenceActions
    ..emotionInBody = emotionInBody
    ..date = date;
  }
}

