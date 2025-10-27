class ToDo {
  final bool isDone;
  final String task;

  static int idCounter = 0;
  final int id = idCounter++;

  ToDo({required this.task, this.isDone = false});

  Map<String, dynamic> toJson() => {
    'isDone': isDone,
    'task': task,
  };

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
    task: json['task'] as String,
    isDone: json['isDone'] as bool,
  );

  ToDo copyWith({bool? isDone, String? task}) => ToDo(
    isDone: isDone ?? this.isDone,
    task: task ?? this.task,
  );
}
