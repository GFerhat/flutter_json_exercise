import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/settings_notfier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(refSettings);
    final settingsNotifier = ref.watch(refSettings.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Darkmode'),
            value: settingsState.isDarkmode,
            onChanged: (isDarkmode) {
              settingsNotifier.toggleDarkmode();
            },
          ),
        ],
      ),
    );
  }
}
