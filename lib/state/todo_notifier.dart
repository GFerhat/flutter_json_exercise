import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';
import 'package:path_provider/path_provider.dart';

final refToDo = NotifierProvider<ToDoNotifier, ToDoList>(
  () => ToDoNotifier(),
);

class ToDoNotifier extends Notifier<ToDoList> {
  String? _path;

  static const _fileName = 'state.json';
  ToDoNotifier() {
    getApplicationDocumentsDirectory().then((dir) async {
      _path = dir.path;
      final file = File('$_path/$_fileName');
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        final newState = ToDoList.fromJson(json);
        state = newState;
      }
    });
  }

  void _saveState() async {
    if (_path == null) return;
    final json = state.toJson();
    final file = File('$_path/$_fileName');
    await file.writeAsString(jsonEncode(json));
  }

  @override
  ToDoList build() => ToDoList([]);

  void addTask(ToDo task) {
    state.addTask(task);
    state = ToDoList(state.tasks);
  }

  void toggle(int id) {
    final tasks = [...state.tasks];
    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].id == id) {
        tasks[i] = tasks[i].copyWith(isDone: !tasks[i].isDone);
        break;
      }
    }
    state = state.copyWith(tasks: tasks);
    _saveState();
  }

  removeTask(int id) {
    final tasks = [...state.tasks];
    final newTasks = tasks.where((task) => task.id != id).toList();
    state = state.copyWith(tasks: newTasks);
    _saveState();
  }
}
