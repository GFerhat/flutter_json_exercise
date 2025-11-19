import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';
import 'package:path_provider/path_provider.dart';

final refToDo = NotifierProvider<ToDoNotifier, ToDoList>(
  ToDoNotifier.new,
);

class ToDoNotifier extends Notifier<ToDoList> {
  String? _path;
  static const _fileName = 'state.json';
  ToDoNotifier() {
    unawaited(
      getApplicationDocumentsDirectory().then((dir) async {
        _path = dir.path;
        final file = File('$_path/$_fileName');
        if (file.existsSync()) {
          final jsonString = file.readAsStringSync();
          final json = jsonDecode(jsonString) as Map<String, dynamic>;
          final newState = ToDoList.fromJson(json);
          state = newState;
        }
      }),
    );
  }

  Future<void> _saveState() async {
    if (_path == null) return;
    final json = state.toJson();
    final file = File('$_path/$_fileName');
    await file.writeAsString(jsonEncode(json));
  }

  @override
  ToDoList build() => ToDoList([]);

  Future<void> addTask(ToDo task) async {
    state.addTask(task);
    state = ToDoList(state.tasks);
    await _saveState();
  }

  Future<void> toggle(int id) async {
    final tasks = [...state.tasks];
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].id == id) {
        tasks[i] = tasks[i].copyWith(isDone: !tasks[i].isDone);
        break;
      }
    }
    state = state.copyWith(tasks: tasks);
    await _saveState();
  }

  ///documentation
  Future<void> removeTask(ToDo task) async {
    final tasks = [...state.tasks];
    final newTasks = tasks.where((t) => task.id != t.id).toList();
    state = state.copyWith(tasks: newTasks);
    await _saveState();
  }
}
