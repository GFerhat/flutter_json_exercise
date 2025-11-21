import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:i12_into_012/state/local_app_notifier.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';

final refToDo = NotifierProvider<ToDoNotifier, ToDoList>(() {
  return LocalJsonNotifier();
});

abstract class ToDoNotifier extends Notifier<ToDoList> {
  Future<ToDoList> addTask(ToDo task);
  Future<bool> toggleDone(String id);
  Future<ToDoList> removeTask(ToDo task);
}
