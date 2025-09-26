import 'package:flutter/material.dart';
import 'Home/HomePageView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}
