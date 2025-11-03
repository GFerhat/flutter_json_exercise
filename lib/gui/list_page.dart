import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/gui/appbar_widget.dart';
import 'package:i12_into_012/gui/list_widget.dart';
import 'package:i12_into_012/gui/todo_dialog_widget.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    void openDialog() => showDialog<AlertDialog>(
      context: context,
      builder: (context) => AddToDoDialog(controller: controller),
    );

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: myAppBar(),
      ),
      body: todoList(),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          onPressed: openDialog,
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
