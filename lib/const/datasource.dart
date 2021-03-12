import 'package:todo_tracker/model/todo_item.dart';

class Datasource {
  static List<TodoItem> todoItems = [
    TodoItem('First', true),
    TodoItem('Second', false),
  ];
}
