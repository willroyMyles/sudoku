import 'package:flutter/material.dart';
import 'package:sudoku_app/startPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: StartScreen(),
    theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.red)),
  ));
}
