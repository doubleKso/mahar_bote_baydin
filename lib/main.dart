import 'package:baydin_exe/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MahaBote());
}

class MahaBote extends StatelessWidget {
  const MahaBote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MahaBote",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
