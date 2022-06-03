import 'package:flutter/material.dart';
import 'package:new_app/data/todo_item/models/todo_item.dart';

class HomeViewModel with ChangeNotifier {
  List<TodoItem> todoItems = List.generate(5, (index) => TodoItem('Todo $index', false));
}