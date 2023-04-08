import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sudoku_app/startPage.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Navigation Basics',
    home: StartScreen(),
    theme:
        ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.red)),
  ));
}
