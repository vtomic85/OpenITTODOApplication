import 'package:flutter/material.dart';
import 'package:new_app/home/home_screen.dart';
import 'package:new_app/home/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
    child: const HomeScreen(),
  ));
}
