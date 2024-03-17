import 'package:flutter/material.dart';
import 'package:capstone_project_category/categoryPage/categoryMain.dart';
import 'package:capstone_project_category/categoryPage/categoryDetail.dart';
import 'package:capstone_project_category/categoryPage/foodInformation.dart';
import 'package:capstone_project_category/test/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
    );
  }
}
