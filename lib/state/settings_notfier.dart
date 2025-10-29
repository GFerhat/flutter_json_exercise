import 'package:flutter_riverpod/flutter_riverpod.dart';

final refSettings = NotifierProvider<SettingsNotfier, Settings>(
  SettingsNotfier.new,
);

class SettingsNotfier extends Notifier<Settings> {
  void toggleDarkmode() {
    state = Settings(isDarkmode: !state.isDarkmode);
  }

  @override
  Settings build() => Settings();
}

@override
class Settings {
  const Settings({this.isDarkmode = false});
  final bool isDarkmode;
}
