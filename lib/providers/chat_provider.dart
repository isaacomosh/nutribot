import 'package:flutter/foundation.dart';
import 'package:nutribot/models/chat_message.dart';
import 'package:nutribot/services/gemini_nutrition_service.dart';

class ChatProvider extends ChangeNotifier {
  final GeminiNutritionService _nutritionService;
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String? _errorMessage;

  ChatProvider(this._nutritionService);

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> sendMessage(String text) async {
    final message = text.trim();
    if (message.isEmpty || _isLoading) return;

    _messages.add(ChatMessage(text: message, isUser: true));
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _nutritionService.sendMessage(message);
      _messages.add(ChatMessage(text: response, isUser: false));
    } catch (error) {
      _errorMessage = error.toString().replaceFirst('Bad state: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}