// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return TodoItem(
    json['description'] as String,
    json['done'] as bool,
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'done': instance.done,
    };
