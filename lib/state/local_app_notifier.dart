import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/database/json_repo_provider.dart';
import 'package:i12_into_012/database/repo.dart';
import 'package:i12_into_012/database/sqflite_repo.dart';
import 'package:i12_into_012/database/sqflite_repo_provider.dart';
import 'package:i12_into_012/state/todo.dart';

final refRepo = AsyncNotifierProvider<LocalNotifier, List<ToDo>>(() {
  return LocalNotifier(repo: refRepoSqflite);
});

class LocalNotifier extends AsyncNotifier<List<ToDo>> {
  LocalNotifier({required this.repo});
  final Provider<Repo> repo;
  @override
  Future<List<ToDo>> build() async {
    final todos = await ref.read(repo).getToDos();
    return todos ?? [];
  }

  Future<void> addTask(ToDo todo) async {
    if (state.hasValue) {
      await ref.read(repo).addToDo(todo);

      final newState = List<ToDo>.from(state.value!)..add(todo);
      state = AsyncValue.data(newState);
    }
  }

  Future<void> toggleDone(String id) async {
    if (state.hasValue) {
      final oldToDo = state.value!.firstWhere((e) => e.id == id);
      final newToDo = oldToDo.copyWith(isDone: !oldToDo.isDone);
      final result = await ref.read(repo).updateToDo(newToDo);
      if (result == null) {
        log('fehler beim speichern in db');
        return;
      }
      final newState = state.value!
          .map((e) => e.id == id ? result : e)
          .toList();
      state = AsyncValue.data(newState);
    }
  }

  Future<void> removeTask(ToDo todo) async {
    if (state.hasValue) {
      final result = await ref.read(repo).removeToDo(todo);
      if (result == null) {
        log('fehler beim löschen von eintrag');
        return;
      }
      state = AsyncValue.data(
        state.value!.where((e) => e.id != todo.id).toList(),
      );
    }
  }
}
