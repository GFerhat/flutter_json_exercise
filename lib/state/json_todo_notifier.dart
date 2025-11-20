import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:i12_into_012/state/local_app_notifier.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';

part 'json_todo_notifier.freezed.dart';
part 'json_todo_notifier.g.dart';

final refToDo = NotifierProvider<ToDoNotifier, ToDoList>(() {
  return LocalJsonNotifier();
});

@freezed
abstract class ToDoNotifier extends Notifier<ToDoList> with _$ToDoNotifier {
  ToDoNotifier._();
  const factory ToDoNotifier() = _ToDoNotifier;

  factory ToDoNotifier.fromJson(Map<String, Object?> json) =>
      _$ToDoNotifierFromJson(json);
  Future<ToDoList> addTask(ToDo task);
  Future<bool> toggleDone(int id);
  Future<ToDoList> removeTask(ToDo task);
}
