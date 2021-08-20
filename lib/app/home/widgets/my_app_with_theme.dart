import 'package:flutter/material.dart';
import 'package:todo_tracker/app/about/about_screen.dart';
import 'package:todo_tracker/app/home/home_screen.dart';

class MyAppWithTheme extends StatelessWidget {
  final ThemeData data;

  MyAppWithTheme(this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: data,
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
      },
      initialRoute: '/',
    );
  }
}
