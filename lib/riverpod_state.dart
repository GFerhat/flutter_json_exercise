import 'package:i12_into_012/list_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoNotifier extends Notifier<ToDoList> {
  @override
  ToDoList build() => ToDoList([]);

  void addTask(Task task) {
    state.addTask(task);
    state = ToDoList(state.tasks);
  }
}
