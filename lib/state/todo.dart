import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class ToDo with _$ToDo {
  const factory ToDo({
    required DateTime createdAt,
    required String id,
    @JsonKey(
      fromJson: _intToBool,
      toJson: _boolToInt,
    )
    @Default(false)
    bool isDone,
    @Default('') String task,
  }) = _ToDo;

  factory ToDo.fromJson(Map<String, Object?> json) => _$ToDoFromJson(json);
}

bool _intToBool(dynamic value) {
  return value != 0;
}

int _boolToInt(bool value) {
  return value ? 1 : 0;
}
