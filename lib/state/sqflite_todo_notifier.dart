import 'package:i12_into_012/state/json_todo_notifier.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';

class SqfliteTodoNotifier extends ToDoNotifier {
  @override
  Future<ToDoList> addTask(ToDo task) {
    throw UnimplementedError();
  }

  @override
  ToDoList build() {
    throw UnimplementedError();
  }

  @override
  Future<ToDoList> removeTask(ToDo task) {
    throw UnimplementedError();
  }

  @override
  Future<bool> toggleDone(String id) {
    throw UnimplementedError();
  }
}
