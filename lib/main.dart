import 'package:flutter/material.dart';
import 'package:vecto/screens/welcome.dart';
import 'package:vecto/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VECTO | Budgeting your next trip',
      home: MyHomePage(title: 'VECTO | Budgeting your next trip'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundGrey,
      body: WelcomeScreen(),
    );
  }
}
