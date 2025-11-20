import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/gui/settings_page.dart';
import 'package:i12_into_012/state/json_todo_notifier.dart';

class myAppBar extends ConsumerWidget {
  const myAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(refToDo);
    return AppBar(
      backgroundColor: Colors.lightBlue,
      title: Row(
        children: [
          Expanded(child: Text('to Do List')),
          Container(
            child: Text('${listProvider.tasksDoneInPercent}% finished'),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<Widget>(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
