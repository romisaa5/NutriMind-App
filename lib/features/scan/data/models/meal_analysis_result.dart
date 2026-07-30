class MealAnalysisResult {
  final String name;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;
  final int fiber;
  final int sugar;
  final int sodium;
  final String advice;

  const MealAnalysisResult({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
    required this.advice,
  });

  factory MealAnalysisResult.fromJson(Map<String, dynamic> json) {
    int _toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.round();
      return int.tryParse(value.toString()) ?? 0;
    }

    return MealAnalysisResult(
      name: json['name']?.toString() ?? 'وجبة',
      calories: _toInt(json['calories']),
      protein: _toInt(json['protein']),
      carbs: _toInt(json['carbs']),
      fat: _toInt(json['fat']),
      fiber: _toInt(json['fiber']),
      sugar: _toInt(json['sugar']),
      sodium: _toInt(json['sodium']),
      advice: json['advice']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'fiber': fiber,
      'sugar': sugar,
      'sodium': sodium,
      'advice': advice,
    };
  }
}
