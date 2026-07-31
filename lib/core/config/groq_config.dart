import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroqConfig {
  const GroqConfig._();

  static String get apiKey => dotenv.env['GROQ_API_KEY'] ?? '';

  static String get model => dotenv.env['GROQ_MODEL'] ?? 'qwen/qwen3.6-27b';
  static const String baseUrl =
      'https://api.groq.com/openai/v1/chat/completions';
}
