import 'package:flutter/cupertino.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: Color(0xFF3A6BC9),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFF2F6FC),
        textTheme: CupertinoTextThemeData(
          primaryColor: Color(0xFF1C3A7A),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}