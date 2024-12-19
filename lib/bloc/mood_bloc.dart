import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pp_787/bloc/mood_state.dart';

class MoodBloc extends Cubit<MoodState> {
  MoodBloc({MoodState? mood}) : super(mood ?? const MoodState());

  void updateIconPath(String value) {
    emit(state.copyWith(iconPath: value));
  }

  void updateName(String value) {
    emit(state.copyWith(name: value));
  }

  void updateGenerallyFilled(int value) {
    emit(state.copyWith(generallyFeeling: value));
  }

  void updateStrength(int value) {
    emit(state.copyWith(strength: value));
  }

  void updateTriggeredBy(String value) {
    emit(state.copyWith(triggeredBy: value));
  }

  void updateDate(DateTime value) {
    emit(state.copyWith(date: value));
  }

  void setIconPathToNull() {
    emit(MoodState(
      iconPath: null,
      name: state.name,
      generallyFeeling: state.generallyFeeling,
      strength: state.strength,
      triggeredBy: state.triggeredBy,
      date: state.date,
    ));
  }

  void setNameToNull() {
    emit(MoodState(
      iconPath: state.iconPath,
      name: null,
      generallyFeeling: state.generallyFeeling,
      strength: state.strength,
      triggeredBy: state.triggeredBy,
      date: state.date,
    ));
  }
}
