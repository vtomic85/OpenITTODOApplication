import 'package:flutter/material.dart';
import 'package:todo_tracker/about_page.dart';
import 'package:todo_tracker/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
      },
      initialRoute: '/',
    );
  }
}
