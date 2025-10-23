import 'package:flutter/material.dart';
import 'package:i12_into_012/appbar_widget.dart';
import 'package:i12_into_012/list_widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: myAppBar(),
      ),
      body: todoList(),
    );
  }
}
