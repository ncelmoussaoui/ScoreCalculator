import 'package:flutter/material.dart';
import 'package:score_calculator/page/score_palculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Punkte Rechner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScoreCalculator(),
    );
  }
}
