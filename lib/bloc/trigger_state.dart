import 'package:equatable/equatable.dart';
import 'package:pp_787/storages/models/trigger.dart';


class TriggerState extends Equatable {
  const TriggerState({
    this.id,
    this.name,
    this.iconsPath = const [],
  });


  final int? id;
  final String? name;
  final List<String> iconsPath;

  factory TriggerState.fromIsarModel(Trigger trigger) {
    return TriggerState(
        id: trigger.id,
        name: trigger.name,
        iconsPath: trigger.iconsPath ?? const [],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, iconsPath];

  TriggerState copyWith({
    int? id,
    String? name,
    List<String>? iconsPath,
  }) {
    return TriggerState(
        id: id ?? this.id,
        name: name ?? this.name,
        iconsPath: iconsPath ?? this.iconsPath,
    );
  }

  Trigger toIsarModel() {
    return Trigger()
    ..name = name
    ..iconsPath = iconsPath;
  }
}

