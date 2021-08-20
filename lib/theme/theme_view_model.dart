import 'package:flutter/material.dart';
import 'package:todo_tracker/shared/storage_manager.dart';

class ThemeViewModel extends ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.grey,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  ThemeData? _themeData;

  Future<ThemeData> get theme async {
    if (_themeData == null) {
      final themeValue = await StorageManager.readData('themeMode');
      var themeMode = themeValue ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
    }
    await Future.delayed(const Duration(seconds: 1), () {});
    return _themeData!;
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  void toggleMode() {
    if (_themeData == darkTheme) {
      setLightMode();
    } else {
      setDarkMode();
    }
  }
}
