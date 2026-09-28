import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  const ChatBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: Text(text),
    );
  }
}
