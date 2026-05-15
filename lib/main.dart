import 'package:flutter/material.dart';
import 'package:semana8/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF577FCD),
        scaffoldBackgroundColor: Color(0xFF9EC9E2),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF253F7C),
        ),
      ),
      home: LoginScreen()
    );
  }
}