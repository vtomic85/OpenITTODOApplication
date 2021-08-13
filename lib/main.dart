import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/app/home/home_view_model.dart';
import 'package:todo_tracker/app/home/widgets/custom_circular_progress_indicator.dart';
import 'package:todo_tracker/app/home/widgets/my_app_with_theme.dart';
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
      builder: (context, themeManager, _) => FutureBuilder<ThemeData>(
        future: themeManager.theme,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyAppWithTheme(snapshot.data!);
          } else {
            return CustomCircularProgressIndicator();
          }
        },
      ),
    );
  }
}
