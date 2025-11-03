import 'dart:io';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/state/settings.dart';
import 'package:path_provider/path_provider.dart';

final refSettings = NotifierProvider<SettingsNotifier, Settings>(
  () => SettingsNotifier(),
);

class SettingsNotifier extends Notifier<Settings> {
  String? _path;
  static const _fileName = 'settings.json';

  SettingsNotifier() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final dir = await getApplicationDocumentsDirectory();
    _path = dir.path;
    final file = File('$_path/$_fileName');
    if (await file.exists()) {
      final jsonString = await file.readAsString();
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      state = Settings.fromJson(json);
    } else {
      state = Settings(); // Standardwerte
    }
  }

  Future<void> _saveSettings() async {
    if (_path == null) return;
    final json = state.toJson();
    final file = File('$_path/$_fileName');
    await file.writeAsString(jsonEncode(json));
  }

  void toggleDarkmode() {
    state = Settings(isDarkmode: !state.isDarkmode);
    _saveSettings();
  }

  @override
  Settings build() => Settings();
}
