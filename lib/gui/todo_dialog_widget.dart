import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/local_app_notifier.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:uuid/uuid.dart';

class AddToDoDialog extends ConsumerWidget {
  const AddToDoDialog({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListAsync = ref.watch(refJsonToDo);
    if (todoListAsync is AsyncLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (todoListAsync is Error) {
      return const Center(child: Text('Error'));
    }
    return AlertDialog(
      title: const Text('Whats the task ?'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Enter your task'),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final inputText = _controller.text;
            if (inputText.isEmpty) {
              Navigator.of(context).pop();
              return;
            }
            await ref
                .read(refJsonToDo.notifier)
                .addTask(
                  ToDo(
                    id: const Uuid().v4(),
                    task: inputText,
                    createdAt: DateTime.now(),
                  ),
                );
            Navigator.of(context).pop();
          },
          child: const Text('SUBMIT'),
        ),
      ],
    );
  }
}
