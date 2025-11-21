// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDo _$ToDoFromJson(Map<String, dynamic> json) => _ToDo(
  createdAt: DateTime.parse(json['createdAt'] as String),
  id: json['id'] as String,
  isDone: json['isDone'] as bool? ?? false,
  task: json['task'] as String? ?? '',
);

Map<String, dynamic> _$ToDoToJson(_ToDo instance) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'isDone': instance.isDone,
  'task': instance.task,
};
