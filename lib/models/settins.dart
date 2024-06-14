import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier  {
  ThemeMode _themeMode = ThemeMode.light;
  Color _appBarColor = Colors.blue;
  Color _scaffoldColor = Colors.white;

  ThemeMode get themeMode => _themeMode;
  Color get appBarColor => _appBarColor;
  Color get scaffoldColor => _scaffoldColor;

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void setAppBarColor(Color color) {
    _appBarColor = color;
    notifyListeners();
  }

  void setScaffoldColor(Color color) {
    _scaffoldColor = color;
    notifyListeners();
  }
}

class Note {
  final int id;
  final String title;
  final String description;
  final String date;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });
}

class Reja {
  final int id;
  final String title;
  final String date;

  Reja({
    required this.id,
    required this.title,
    required this.date,
  });
}

