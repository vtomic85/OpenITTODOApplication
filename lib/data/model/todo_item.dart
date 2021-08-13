import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';


part 'todo_item.g.dart';

@JsonSerializable(explicitToJson: true)
class TodoItem {
  String id;
  String description;
  bool done;

  TodoItem(this.description, this.done, {String? id}) : this.id = id ?? Uuid().v1();

  factory TodoItem.fromJson(Map<String, dynamic> json) => _$TodoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);

}
