import 'package:flutter_test/flutter_test.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_list.dart';

void main() {
  test('toJson', () {
    final todolist = ToDoList([
      ToDo(task: 'Buy groceries'),
      ToDo(task: 'Buy more groceries', isDone: true),
      ToDo(task: 'Buy even more groceries'),
    ]);
    final json = todolist.toJson();
    expect(json['tasks'] != null, true);
    expect(json['tasks'] is List, true);
    expect((json['tasks'] as List).length, 3);
  });
}
