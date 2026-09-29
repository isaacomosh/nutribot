import 'package:flutter/material.dart';
import 'package:nutribot/home.dart';

void main() {
  runApp(const Nutribot());
}

class Nutribot extends StatefulWidget {
  const Nutribot({super.key});

  @override
  State<Nutribot> createState() => _NutribotState();
}

class _NutribotState extends State<Nutribot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
