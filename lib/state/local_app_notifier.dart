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
          final list = [...newState.tasks]
            ..sort(
              (a, b) => a.createdAt.millisecondsSinceEpoch.compareTo(
                b.createdAt.millisecondsSinceEpoch,
              ),
            );

          state = newState.copyWith(tasks: list);
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
  ToDoList build() => ToDoList();

  @override
  Future<ToDoList> addTask(ToDo task) async {
    final tempList = List<ToDo>.from([...state.tasks, task]);
    state = state.copyWith(tasks: tempList);
    await _saveState();
    return state;
  }

  @override
  Future<bool> toggleDone(String id) async {
    final tasks = [...state.tasks];
    final task = tasks.where((element) => element.id == id).first;
    final newTask = task.copyWith(isDone: !task.isDone);
    final newTasks = tasks.where((t) => id != t.id).toList()
      ..add(newTask)
      ..sort(
        (a, b) => a.createdAt.millisecondsSinceEpoch.compareTo(
          b.createdAt.millisecondsSinceEpoch,
        ),
      );
    state = state.copyWith(tasks: newTasks);

    await _saveState();
    return tasks.where((element) => element.id == id).first.isDone;
  }

  @override
  ///documentation
  Future<ToDoList> removeTask(ToDo task) async {
    final tasks = [...state.tasks];
    final newTasks = tasks.where((t) => task.id != t.id).toList();
    state = state.copyWith(tasks: newTasks);
    await _saveState();
    return state;
  }
}
