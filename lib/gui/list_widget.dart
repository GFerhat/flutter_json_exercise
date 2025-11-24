import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/json_todo_notifier.dart';
import 'package:i12_into_012/trash/extension.dart';

class todoList extends ConsumerWidget {
  const todoList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(refToDo);
    return ListView.builder(
      itemCount: todoList.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final task = todoList.tasks[index];
        return Dismissible(
          dismissThresholds: const {DismissDirection.endToStart: 0.65},
          key: ValueKey(task.id),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await ref.read(refToDo.notifier).removeTask(task);
          },
          background: ListTile(
            title: Container(
              height: 49,
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              decoration:
                  Theme.of(
                        context,
                      )
                      .extension<ListTileContainerDecoration>()
                      ?.decoration
                      .copyWith(color: Colors.red),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          child: ListTile(
            title: Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.all(3),
              decoration: Theme.of(
                context,
              ).extension<ListTileContainerDecoration>()?.decoration,
              child: Row(
                children: [
                  Checkbox(
                    value: todoList.tasks[index].isDone,
                    onChanged: (bool? x) async {
                      await ref
                          .read(refToDo.notifier)
                          .toggleDone(todoList.tasks[index].id);
                    },
                  ),
                  Text(todoList.tasks[index].task),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
