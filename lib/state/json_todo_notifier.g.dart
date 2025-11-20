// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_todo_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoNotifier _$ToDoNotifierFromJson(Map<String, dynamic> json) =>
    _ToDoNotifier()
      ..state = ToDoList.fromJson(json['state'] as Map<String, dynamic>);

Map<String, dynamic> _$ToDoNotifierToJson(_ToDoNotifier instance) =>
    <String, dynamic>{'state': instance.state};
