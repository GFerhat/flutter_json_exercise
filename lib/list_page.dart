import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/appbar_widget.dart';
import 'package:i12_into_012/list_widget.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:i12_into_012/state/todo_notifier.dart';

class ListPage extends ConsumerWidget {
  ListPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    final todoListNotfier = ref.watch(refToDo);

    void openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Whats the task ?'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter your task'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final inputText = controller.text;
              if (inputText.isEmpty) {
                Navigator.of(context).pop();
                return;
              }
              ref.read(refToDo.notifier).addTask(ToDo(task: inputText));
              Navigator.of(context).pop();
            },
            child: Text('SUBMIT'),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: myAppBar(),
      ),
      body: todoList(),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          onPressed: () {
            openDialog();
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
