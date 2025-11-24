import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/database/json_repo_provider.dart';
import 'package:i12_into_012/state/todo.dart';

final refJsonToDo = AsyncNotifierProvider<LocalJsonNotifier, List<ToDo>>(() {
  return LocalJsonNotifier();
});

class LocalJsonNotifier extends AsyncNotifier<List<ToDo>> {
  @override
  Future<List<ToDo>> build() async {
    final todos = await ref.read(refRepoJson).getToDos();
    return todos ?? [];
  }

  Future<ToDo?> addTask(ToDo todo) async {
    if (state.hasValue) {
      await ref.read(refRepoJson).addToDo(todo);

      final newState = List<ToDo>.from(state.value!)..add(todo);
      state = AsyncValue.data(newState);
      return todo;
    }
    return null;
  }

  Future<ToDo?> toggleDone(String id) async {
    if (state.hasValue) {
      final oldToDo = state.value!.firstWhere((e) => e.id == id);
      final newToDo = oldToDo.copyWith(isDone: !oldToDo.isDone);
      final result = await ref.read(refRepoJson).updateToDo(newToDo);
      final newState = List<ToDo>.from(state.value!)
        ..removeWhere((e) => e.id == id)
        ..add(result ?? oldToDo);
      state = AsyncValue.data(newState);
      return result;
    }
    return null;
  }

  Future<ToDo?> removeTask(ToDo todo) async {
    if (state.hasValue) {
      final result = await ref.read(refRepoJson).removeToDo(todo);
      state.value!.removeWhere((e) => e.id == todo.id);
      return result;
    }
    return null;
  }
}
