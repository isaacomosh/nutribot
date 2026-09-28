import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //top header row
            Row(
              children: [
                Row(children: [Icon(Icons.menu), Icon(Icons.settings)]),
                Text("Nutribot"),
              ],
            ),
            Text("Nutribot"),
          ],
        ),
      ),
    );
  }
}
