import 'package:flutter/material.dart';
import 'package:i12_into_012/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todoJson',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00EFBCD5)),
      ),
      home: ListPage(),
    );
  }
}
