import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'trigger_state.dart';

class TriggerBloc extends Cubit<TriggerState> {
  TriggerBloc({TriggerState? trigger}) : super(trigger ?? const TriggerState());

  void updateName(String value) {
    emit(state.copyWith(name: value));
  }

  void updateIconsPath(List<String> value) {
    emit(state.copyWith(iconsPath: List.from(value)));
  }
}
