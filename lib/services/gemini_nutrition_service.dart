import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiNutritionService {
  static const _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  late final GenerativeModel _model = GenerativeModel(
    model: 'gemini-2.5-flash',
    apiKey: _apiKey,
    systemInstruction: Content.system(
      'You are Nutribot, a nutrition information assistant. Give practical, '
      'clear answers and label calorie or nutrient values as estimates. Ask '
      'for serving size or preparation details when they materially affect '
      the answer. Do not diagnose conditions, prescribe treatment, or present '
      nutrition information as a substitute for professional medical advice.',
    ),
  );

  late final ChatSession _chat = _model.startChat();

  Future<String> sendMessage(String message) async {
    if (_apiKey.isEmpty) {
      throw StateError(
        'Gemini API key missing. Configure GEMINI_API_KEY when running the app.',
      );
    }

    final response = await _chat.sendMessage(Content.text(message));
    final answer = response.text?.trim();
    if (answer == null || answer.isEmpty) {
      throw StateError('Gemini returned an empty response. Please try again.');
    }
    return answer;
  }
}