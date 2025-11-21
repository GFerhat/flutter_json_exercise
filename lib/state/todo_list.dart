import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:i12_into_012/state/todo.dart';
part 'todo_list.freezed.dart';
part 'todo_list.g.dart';

@freezed
abstract class ToDoList with _$ToDoList {
  const factory ToDoList({
    @Default([]) List<ToDo> tasks,
  }) = _ToDoList;

  const ToDoList._();

  factory ToDoList.fromJson(Map<String, Object?> json) =>
      _$ToDoListFromJson(json);

  double get tasksDoneInPercent {
    int tasksDoneCounter = 0;
    if (tasks.isEmpty) return 0;
    for (final t in tasks) {
      if (t.isDone) tasksDoneCounter++;
    }
    return 100 * tasksDoneCounter / tasks.length;
  }
}
