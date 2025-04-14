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
  navigationBarTheme: const NavigationBarThemeData(
  backgroundColor: Color(0xFF252525),
  indicatorColor: Color(0xFF4D4D4D), 
  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  elevation: 0,
  iconTheme: WidgetStatePropertyAll(
    IconThemeData(color: Colors.white),
  ),
  labelTextStyle: WidgetStatePropertyAll(
    TextStyle(color: Colors.white),
  ),
),
  );