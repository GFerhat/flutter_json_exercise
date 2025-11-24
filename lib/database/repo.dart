import 'package:i12_into_012/state/todo.dart';

abstract class Repo {
  Future<List<ToDo>?> getToDos();

  Future<ToDo?> addToDo(ToDo todo);

  Future<ToDo?> updateToDo(ToDo todo);

  Future<ToDo?> removeToDo(ToDo todo);
}
