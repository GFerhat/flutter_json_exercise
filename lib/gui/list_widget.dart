import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/database/sqflite_repo.dart';
import 'package:i12_into_012/state/local_app_notifier.dart';
import 'package:i12_into_012/trash/extension.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final SqfliteRepo _tasksSqfliteRepoSql = SqfliteRepo.instance;

    final todoListAsync = ref.watch(refRepo);
    print(todoListAsync.value);

    if (todoListAsync is AsyncLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (todoListAsync is Error) {
      return const Center(child: Text('Error'));
    }
    return Center(
      child: ListView.builder(
        itemCount: todoListAsync.value!.length,
        itemBuilder: (BuildContext context, int index) {
          final task = todoListAsync.value![index];
          return Dismissible(
            dismissThresholds: const {DismissDirection.endToStart: 0.65},
            key: ValueKey(task.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) async {
              await ref.read(refRepo.notifier).removeTask(task);
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
                      value: todoListAsync.value![index].isDone,
                      onChanged: (bool? x) async {
                        await ref
                            .read(refRepo.notifier)
                            .toggleDone(todoListAsync.value![index].id);
                      },
                    ),
                    Text(todoListAsync.value![index].task),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
