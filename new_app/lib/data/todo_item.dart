import 'package:uuid/uuid.dart';

class TodoItem {
  String id;
  String description;
  bool done;

  TodoItem(this.description, this.done, {String? id})
      : id = id ?? const Uuid().v1();
}

final mockTodos = List.generate(500, (index) => TodoItem('Todo $index', false));