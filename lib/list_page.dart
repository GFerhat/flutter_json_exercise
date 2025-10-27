import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/appbar_widget.dart';
import 'package:i12_into_012/list_widget.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: myAppBar(),
      ),
      body: todoList(),
    );
  }
}
