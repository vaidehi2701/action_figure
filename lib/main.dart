import 'package:action_figure/view/navigation_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//devDiariesWithVee on Instagram
//devDiariesWithVee on Youtube
//vaidehi2701 on Github

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Action Figure App',
      home: NavigationScreen(),
    );
  }
}
