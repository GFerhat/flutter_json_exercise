import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/list_class.dart';
import 'package:i12_into_012/riverpod_state.dart';

class todoList extends ConsumerWidget {
  todoList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(toDoListProvider);
    if (listProvider.tasks.length == 0) {
      final newTask = Task(task: "learn coding today yeah!  ALPHA");
      final newTask1 = Task(task: "learn coding today yeah!  ALPHA2");
      final newTask2 = Task(task: "learn coding today yeah!  ALPHA3");
      final newTask3 = Task(task: "learn coding today yeah!  ALPHA4");
      ref.read(toDoListProvider).addTask(newTask);
      ref.read(toDoListProvider).addTask(newTask1);
      ref.read(toDoListProvider).addTask(newTask2);
      ref.read(toDoListProvider).addTask(newTask3);
    }
    return ListView.builder(
      itemCount: listProvider.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: listProvider.tasks[index].isDone,
                  onChanged: (bool? x) {
                    ref
                        .read(toDoListProvider.notifier)
                        .toggle(listProvider.tasks[index].id);
                  },
                ),
                Text("${listProvider.tasks[index].task}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
