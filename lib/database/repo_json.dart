import 'dart:convert';
import 'dart:io';

import 'package:i12_into_012/database/repo.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:path_provider/path_provider.dart';

class RepoJson implements Repo {
  String? _path;
  final _fileName = 'state.json';

  Future<List<ToDo>?> getToDos() async {
    List<ToDo>? result;
    await getApplicationDocumentsDirectory().then((dir) async {
      _path = dir.path;
      final file = File('$_path/$_fileName');
      if (file.existsSync()) {
        final jsonString = file.readAsStringSync();
        final json = jsonDecode(jsonString) as List<dynamic>;
        final todos =
            List<ToDo>.from(
              json.map((todo) => ToDo.fromJson(todo as Map<String, dynamic>)),
            )..sort(
              (a, b) => a.createdAt.millisecondsSinceEpoch.compareTo(
                b.createdAt.millisecondsSinceEpoch,
              ),
            );

        result = todos;
      } else {
        result = await _saveJsonInFile(<ToDo>[]);
      }
    });
    return result;
  }

  Future<ToDo?> addToDo(ToDo todo) async {
    final toDoList = await getToDos();
    if (toDoList == null) {
      Exception('keine Liste gefunden');
      return null;
    }
    toDoList.add(todo);
    await _saveJsonInFile(toDoList);
    return todo;
  }

  Future<ToDo?> updateToDo(ToDo todo) async {
    final toDoList = await getToDos();
    if (toDoList == null) {
      Exception('keine Liste gefunden');
      return null;
    }
    toDoList
      ..removeWhere((e) => e.id == todo.id)
      ..add(todo);
    await _saveJsonInFile(toDoList);
    return todo;
  }

  Future<ToDo?> removeToDo(ToDo todo) async {
    final toDoList = await getToDos();
    if (toDoList == null) {
      Exception('keine Liste gefunden');
      return null;
    }
    toDoList.removeWhere((e) => e.id == todo.id);
    await _saveJsonInFile(toDoList);
    return todo;
  }

  Future<List<ToDo>?> _saveJsonInFile(List<ToDo> toDoList) async {
    if (_path == null) return null;
    final json = toDoList.map((element) => element.toJson()).toList();
    final file = File('$_path/$_fileName');
    await file.writeAsString(jsonEncode(json));
    return toDoList;
  }
}
