import 'package:flutter/material.dart';
import 'package:photo_gallery_app/album_page.dart';
import 'package:photo_gallery_app/album_page_random.dart';
import 'package:photo_gallery_app/theme.dart';
import 'package:photo_gallery_app/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const WelcomeScreen(),
    );
  }
}



