import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'anchor_state.dart';

class AnchorBloc extends Cubit<AnchorState> {
  AnchorBloc({AnchorState? anchor}) : super(anchor ?? const AnchorState());

  void updateName(String value) {
    emit(state.copyWith(name: value));
  }
}
