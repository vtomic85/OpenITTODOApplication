import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/app/about/about_screen.dart';
import 'package:todo_tracker/app/home/home_screen.dart';
import 'package:todo_tracker/app/home/home_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => HomeViewModel(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
      },
      initialRoute: '/',
    );
  }
}
