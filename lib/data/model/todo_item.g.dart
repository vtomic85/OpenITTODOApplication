// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return TodoItem(
    json['description'] as String,
    json['done'] as bool,
  );
}

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'description': instance.description,
      'done': instance.done,
    };
