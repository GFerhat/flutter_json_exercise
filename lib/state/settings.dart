class Settings {
  final bool isDarkmode;

  const Settings({this.isDarkmode = false});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(isDarkmode: json['isDarkmode'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkmode': isDarkmode,
    };
  }
}