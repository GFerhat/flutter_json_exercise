// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoList _$ToDoListFromJson(Map<String, dynamic> json) => _ToDoList(
  tasks:
      (json['tasks'] as List<dynamic>?)
          ?.map((e) => ToDo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ToDoListToJson(_ToDoList instance) => <String, dynamic>{
  'tasks': instance.tasks,
};
