import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/todo_notifier.dart';

class todoList extends ConsumerWidget {
  todoList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(refToDo);
    return ListView.builder(
      itemCount: todoList.tasks.length,
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
                  value: todoList.tasks[index].isDone,
                  onChanged: (bool? x) {
                    ref
                        .read(refToDo.notifier)
                        .toggle(todoList.tasks[index].id);
                  },
                ),
                Text("${todoList.tasks[index].task}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
