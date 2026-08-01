import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:nutri_mind/core/helpers/enums.dart';
import 'package:nutri_mind/core/utils/app_result.dart';
import 'package:nutri_mind/features/scan/data/models/meal_analysis_result.dart';
import '../../error/failures.dart';

class GroqNutritionService {
  final String apiKey;
  final String model;
  static const String _endpoint =
      'https://api.groq.com/openai/v1/chat/completions';

  GroqNutritionService({required this.apiKey, this.model = 'qwen/qwen3.6-27b'});

  Future<AppResult<MealAnalysisResult>> analyzeMealImage({
    required Uint8List imageBytes,
    required MealType mealType,
  }) async {
    if (imageBytes.isEmpty) {
      return const Err(UnknownFailure('الصورة مش واضحة، جربي تاني'));
    }

    try {
      final base64Image = base64Encode(imageBytes);
      final prompt = _buildPrompt(mealType);

      final body = jsonEncode({
        'model': model,
        'reasoning_effort': 'none',
        'max_completion_tokens': 2048,
        'messages': [
          {
            'role': 'user',
            'content': [
              {'type': 'text', 'text': prompt},
              {
                'type': 'image_url',
                'image_url': {'url': 'data:image/jpeg;base64,$base64Image'},
              },
            ],
          },
        ],
      });

      final response = await http
          .post(
            Uri.parse(_endpoint),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $apiKey',
            },
            body: body,
          )
          .timeout(const Duration(seconds: 40));

      if (response.statusCode != 200) {
        return Err(
          UnknownFailure(
            'حصل خطأ من السيرفر (${response.statusCode}): ${response.body}',
          ),
        );
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final rawText = decoded['choices']?[0]?['message']?['content'] as String?;

      if (rawText == null || rawText.trim().isEmpty) {
        return const Err(
          UnknownFailure('معرفناش نحلل الصورة، جربي تاني بصورة أوضح'),
        );
      }

      final jsonMap = _extractJson(rawText);
      if (jsonMap == null) {
        return const Err(
          UnknownFailure('الرد جالنا بصيغة غير متوقعة، جربي تاني'),
        );
      }

      return Success(MealAnalysisResult.fromJson(jsonMap));
    } catch (e) {
      return Err(UnknownFailure('حصل خطأ أثناء تحليل الصورة: $e'));
    }
  }

  String _buildPrompt(MealType mealType) {
    return '''
أنتِ خبيرة تغذية. حللي صورة الأكل دي وارجعي تقدير غذائي تقريبي شامل.
الوجبة دي متسجلة كـ "${mealType.name}" (breakfast / lunch / dinner).

مهم جدًا: رد بـ JSON خام بس، من غير أي تفكير أو شرح أو مقدمة أو تعليق قبله أو بعده، ومن غير علامات ```.

ارجعي بصيغة JSON فقط بدون أي نص إضافي قبله أو بعده، بالمفاتيح دي بالظبط:
{
  "name": "اسم مختصر للوجبة بالعربي",
  "calories": رقم صحيح تقريبي للسعرات الحرارية,
  "protein": رقم صحيح تقريبي للبروتين بالجرام,
  "carbs": رقم صحيح تقريبي للكربوهيدرات بالجرام,
  "fat": رقم صحيح تقريبي للدهون بالجرام,
  "fiber": رقم صحيح تقريبي للألياف بالجرام,
  "sugar": رقم صحيح تقريبي للسكريات بالجرام,
  "sodium": رقم صحيح تقريبي للصوديوم بالمليجرام,
  "advice": "نصيحة غذائية قصيرة وشخصية (سطر أو اتنين) بالعربي حسب نوع الوجبة والقيم الغذائية دي، تساعد المستخدم يحسن نظامه الغذائي"
}

لو الصورة مش فيها أكل واضح، افترضي أقرب تقدير معقول ومتسيبيش أي قيمة فاضية.
النصيحة لازم تكون مبنية فعليًا على تحليل الوجبة (مثلاً لو صوديوم عالي انبهي، لو بروتين قليل بالنسبة للوجبة دي اقترحي إضافة، إلخ) مش نصيحة عامة.
''';
  }

  Map<String, dynamic>? _extractJson(String rawText) {
    var text = rawText.trim();

    if (text.startsWith('```')) {
      text = text
          .replaceAll(RegExp(r'^```json', multiLine: true), '')
          .replaceAll('```', '')
          .trim();
    }
    final firstBrace = text.indexOf('{');
    final lastBrace = text.lastIndexOf('}');
    if (firstBrace != -1 && lastBrace != -1 && lastBrace > firstBrace) {
      text = text.substring(firstBrace, lastBrace + 1);
    }

    try {
      return jsonDecode(text) as Map<String, dynamic>;
    } on FormatException {
      return null;
    }
  }
}
