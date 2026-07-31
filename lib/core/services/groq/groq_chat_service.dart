import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../common/models/app_models.dart';
import '../../error/failures.dart';
import '../../utils/app_result.dart';

class GroqChatService {
  final String apiKey;
  final String model;
  final String baseUrl;

  GroqChatService({
    required this.apiKey,
    this.model = 'llama-3.3-70b-versatile',
    this.baseUrl = 'https://api.groq.com/openai/v1/chat/completions',
  });

  static const String _systemPrompt = '''
You are the in-app assistant for "NutriMind", a mental-health and nutrition tracking app.

Your ONLY job is to help users with topics related to:
- Nutrition, calories, macros (protein, carbs, fat), meals, and healthy eating habits
- Their relationship with food and emotional wellbeing around eating (without diagnosing any mental health condition)
- How to use the app's features (scanning meals, logging breakfast/lunch/dinner, viewing nutrition history, daily tips)

If the user asks about anything unrelated to these topics (general knowledge, coding, entertainment, politics, unrelated personal advice, etc.), politely decline in one short sentence and redirect them back to nutrition or wellbeing topics. Do not answer unrelated questions even if the user insists or rephrases the request.

Language rule (very important): ALWAYS reply in the exact same language as the user's latest message.
- If the user wrote in Arabic, reply entirely in friendly Egyptian-Arabic, matching a warm supportive tone.
- If the user wrote in English, reply entirely in English.
- Never mix languages in a single reply, and never translate or repeat the user's message back to them.

Keep replies warm, supportive, and concise (2-4 sentences). Never give a medical diagnosis. If the user shows signs of severe distress, gently encourage them to reach out to a professional or a trusted person, without being preachy or repetitive.
''';

  Future<AppResult<String>> sendMessage({
    required List<ChatMessageModel> history,
    required String newMessage,
  }) async {
    if (newMessage.trim().isEmpty) {
      return const Err(ChatFailure(FailureCode.chatEmptyResponse));
    }

    try {
      final messages = <Map<String, String>>[
        {'role': 'system', 'content': _systemPrompt},
        ...history.map(
          (m) => {'role': m.isUser ? 'user' : 'assistant', 'content': m.text},
        ),
        {'role': 'user', 'content': newMessage.trim()},
      ];

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': model,
          'messages': messages,
          'temperature': 0.4,
          'max_tokens': 500,
        }),
      );

      if (response.statusCode != 200) {
        return Err(
          ChatFailure(
            FailureCode.chatRequestFailed,
            'HTTP ${response.statusCode}: ${response.body}',
          ),
        );
      }

      final decoded =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      final choices = decoded['choices'] as List?;
      final content = (choices != null && choices.isNotEmpty)
          ? (choices.first['message']?['content'] as String?)?.trim()
          : null;

      if (content == null || content.isEmpty) {
        return const Err(ChatFailure(FailureCode.chatEmptyResponse));
      }

      return Success(content);
    } catch (e) {
      return Err(ChatFailure(FailureCode.chatRequestFailed, e.toString()));
    }
  }
}
