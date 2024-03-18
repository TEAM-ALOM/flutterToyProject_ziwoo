import 'package:flutter/material.dart';
import 'package:test_proj/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(), //HomeScreen을 불러오기
    );
  }
}
