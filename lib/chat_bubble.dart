import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  const ChatBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text),
          ),
        ),
        Positioned(bottom: 0, left: 190, child: Text("23:33 PM")),
      ],
    );
  }
}
