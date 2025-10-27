import 'package:i12_into_012/state/todo.dart';

class ToDoList {
  final List<ToDo> tasks;

  ToDoList(this.tasks);

  void addTask(ToDo task) {
    tasks.add(task);
  }

  double get tasksDoneInPercent {
    int tasksDoneCounter = 0;
    if (tasks.isEmpty) return 0;
    for (final t in tasks) {
      if (t.isDone) tasksDoneCounter++;
    }
    return 100 * tasksDoneCounter / tasks.length;
  }

  Map<String, dynamic> toJson() => {
    'tasks': tasks.map((e) => e.toJson()).toList(),
  };

  factory ToDoList.fromJson(Map<String, dynamic> json) => ToDoList(
    (json['tasks'] as List)
        .map((e) => ToDo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  ToDoList copyWith({List<ToDo>? tasks}) => ToDoList(tasks ?? this.tasks);
}
