class Task {
  bool isDone = false;
  String task;

  Task({required this.task});

  void toggle(bool isDone) {
    isDone = !isDone;
  }
}

class ToDoList {
  List<Task> tasks = [];

  ToDoList(this.tasks);

  void addTask(Task task) {
    tasks.add(task);
  }

  double tasksDoneInPercent() {
    int tasksDoneCounter = 0;
    if (tasks.isEmpty) return 0;
    for (final t in tasks) {
      if (t.isDone) tasksDoneCounter++;
    }
    return 100 * tasksDoneCounter / tasks.length;
  }
}
