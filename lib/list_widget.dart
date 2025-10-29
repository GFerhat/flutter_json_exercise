import 'dart:ffi';

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
        return Dismissible(
          key: ValueKey(todoList.tasks[index].id),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            ref.read(refToDo.notifier).removeTask(todoList.tasks[index].id);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: ListTile(
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
          ),
        );
      },
    );
  }
}
