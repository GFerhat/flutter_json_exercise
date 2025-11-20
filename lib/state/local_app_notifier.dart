import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:i12_into_012/state/json_todo_notifier.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';
import 'package:path_provider/path_provider.dart';

class LocalJsonNotifier extends ToDoNotifier {
  String? _path;
  static const _fileName = 'state.json';
  LocalJsonNotifier() {
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

  Future<ToDoList> addTask(ToDo task) async {
    state.addTask(task);
    state = ToDoList(state.tasks);
    await _saveState();
    return state;
  }

  @override
  Future<bool> toggleDone(int id) async {
    final tasks = [...state.tasks];
    int i = 0;
    for (i = 0; i < tasks.length; i++) {
      if (tasks[i].id == id) {
        tasks[i] = tasks[i].copyWith(isDone: !tasks[i].isDone);
        break;
      }
    }
    state = state.copyWith(tasks: tasks);
    await _saveState();
    return tasks[i].isDone;
  }

  ///documentation
  Future<ToDoList> removeTask(ToDo task) async {
    final tasks = [...state.tasks];
    final newTasks = tasks.where((t) => task.id != t.id).toList();
    state = state.copyWith(tasks: newTasks);
    await _saveState();
    return state;
  }
}
