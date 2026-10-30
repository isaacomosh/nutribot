import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nutribot/home.dart';
import 'package:nutribot/providers/chat_provider.dart';
import 'package:nutribot/services/gemini_nutrition_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ChatProvider(GeminiNutritionService()),
      child: const Nutribot(),
    ),
  );
}

class Nutribot extends StatelessWidget {
  const Nutribot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Home());
  }
}
