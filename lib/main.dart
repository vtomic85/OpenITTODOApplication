import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/app/about/about_screen.dart';
import 'package:todo_tracker/app/home/home_screen.dart';
import 'package:todo_tracker/app/home/home_view_model.dart';
import 'package:todo_tracker/theme/theme_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
        ChangeNotifierProvider<ThemeViewModel>(create: (_) => ThemeViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (context, themeManager, _) => MaterialApp(
        theme: themeManager.getTheme(),
        routes: {
          '/': (context) => HomeScreen(),
          '/about': (context) => AboutPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
