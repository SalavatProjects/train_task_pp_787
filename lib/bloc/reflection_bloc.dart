import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'reflection_state.dart';

class ReflectionBloc extends Cubit<ReflectionState> {
  ReflectionBloc({ReflectionState? reflection}) : super(reflection ?? const ReflectionState());

  void updateFirstWord(String value) {
    emit(state.copyWith(firstWord: value));
  }

  void updateSecondWord(String value) {
    emit(state.copyWith(secondWord: value));
  }

  void updateThirdWord(String value) {
    emit(state.copyWith(thirdWord: value));
  }

  void updateFeelSameThing(String value) {
    emit(state.copyWith(feelSameThing: value));
  }

  void updateDescribeAnotherPerson(String value) {
    emit(state.copyWith(describeAnotherPerson: value));
  }

  void updateEmotionInfluenceActions(String value) {
    emit(state.copyWith(emotionInfluenceActions: value));
  }

  void updateEmotionInBody(String value) {
    emit(state.copyWith(emotionInBody: value));
  }

  void updateDate(DateTime value) {
    emit(state.copyWith(date: value));
  }
}
