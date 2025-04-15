import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF252525),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF3B3B3B),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF3B3B3B),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(color: Colors.white),
    unselectedLabelStyle: TextStyle(color: Colors.grey),
    elevation: 0,
  ),
);