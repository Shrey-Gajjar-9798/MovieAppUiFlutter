import 'package:flutter/material.dart';
import 'package:internmovie/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MoviesApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
