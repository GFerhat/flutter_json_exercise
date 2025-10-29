import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/list_page.dart';
import 'package:i12_into_012/state/settings_notfier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

///THIS IS THE MAIM APP
class MyApp extends ConsumerWidget {
  ///THIS IS THE MAIM APP
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(refSettings);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todoJson',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00EFBCD5)),
      ),
      themeMode: settingsState.isDarkmode ? ThemeMode.dark : ThemeMode.light,
      home: const ListPage(),
    );
  }
}
