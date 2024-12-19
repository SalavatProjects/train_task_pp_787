import 'package:equatable/equatable.dart';
import 'package:pp_787/storages/models/anchor.dart';


class AnchorState extends Equatable{
  const AnchorState({
    this.id,
    this.name = '',
  });

  final int? id;
  final String name;

  factory AnchorState.fromIsarModel(Anchor anchor) {
    return AnchorState(
        id: anchor.id,
        name: anchor.name ?? '',
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];

  AnchorState copyWith({
    int? id,
    String? name
  }) {
    return AnchorState(
        id: id ?? this.id,
        name: name ?? this.name,
    );
  }

  Anchor toIsarModel() {
    return Anchor()
    ..name = name;
  }
}

