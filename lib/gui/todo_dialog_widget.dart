import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/json_todo_notifier.dart';

class AddToDoDialog extends ConsumerWidget {
  const AddToDoDialog({
    required TextEditingController controller,
    super.key,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Whats the task ?'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Enter your task'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            final inputText = _controller.text;
            if (inputText.isEmpty) {
              Navigator.of(context).pop();
              return;
            }
            ref.read(refToDo.notifier).addTask(ToDo(task: inputText));
            Navigator.of(context).pop();
          },
          child: const Text('SUBMIT'),
        ),
      ],
    );
  }
}
