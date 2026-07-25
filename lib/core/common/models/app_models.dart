import 'package:flutter/material.dart';

/// ------------------- Meal Model -------------------
enum MealType { breakfast, lunch, dinner }

extension MealTypeX on MealType {
  String get labelKey {
    switch (this) {
      case MealType.breakfast:
        return 'mealBreakfast';
      case MealType.lunch:
        return 'mealLunch';
      case MealType.dinner:
        return 'mealDinner';
    }
  }

  IconData get icon {
    switch (this) {
      case MealType.breakfast:
        return Icons.wb_sunny_rounded;
      case MealType.lunch:
        return Icons.lunch_dining_rounded;
      case MealType.dinner:
        return Icons.nightlight_round;
    }
  }
}

class MealModel {
  final MealType type;
  final String? name;
  final String? imageUrl;
  final int? calories;
  final int? protein;
  final int? carbs;
  final int? fat;
  final DateTime? loggedAt;

  const MealModel({
    required this.type,
    this.name,
    this.imageUrl,
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
    this.loggedAt,
  });

  bool get isLogged => calories != null;
}

/// ------------------- Chat Model -------------------
class ChatMessageModel {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessageModel({required this.text, required this.isUser, DateTime? time})
    : time = time ?? DateTime.now();
}

class TipModel {
  final String titleKey;
  final String descriptionKey;
  final IconData icon;
  final String categoryKey;

  const TipModel({
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
    required this.categoryKey,
  });
}

class WeeklyCalorieEntry {
  final String dayKey;
  final int calories;

  const WeeklyCalorieEntry({required this.dayKey, required this.calories});
}

/// ------------------- Dummy Data -------------------
class DummyData {
  static List<MealModel> todayMeals = [
    MealModel(
      type: MealType.breakfast,
      name: 'بيض مسلوق وجبنة قريش',
      calories: 320,
      protein: 22,
      carbs: 18,
      fat: 14,
      loggedAt: DateTime.now(),
    ),
    MealModel(
      type: MealType.lunch,
      name: 'صدور فراخ مشوية مع أرز',
      calories: 480,
      protein: 34,
      carbs: 45,
      fat: 12,
      loggedAt: DateTime.now(),
    ),
    const MealModel(type: MealType.dinner),
  ];

  static const List<WeeklyCalorieEntry> weeklyCalories = [
    WeeklyCalorieEntry(dayKey: 'daySaturdayShort', calories: 1650),
    WeeklyCalorieEntry(dayKey: 'daySundayShort', calories: 1720),
    WeeklyCalorieEntry(dayKey: 'dayMondayShort', calories: 1480),
    WeeklyCalorieEntry(dayKey: 'dayTuesdayShort', calories: 1900),
    WeeklyCalorieEntry(dayKey: 'dayWednesdayShort', calories: 1550),
    WeeklyCalorieEntry(dayKey: 'dayThursdayShort', calories: 1380),
    WeeklyCalorieEntry(dayKey: 'dayFridayShort', calories: 800),
  ];
  static List<TipModel> tips = [
    const TipModel(
      titleKey: 'drinkEnoughWater',
      descriptionKey: 'drinkEnoughWaterDesc',
      icon: Icons.water_drop_rounded,
      categoryKey: 'nutritionCategory',
    ),

    const TipModel(
      titleKey: 'dontCompareYourself',
      descriptionKey: 'dontCompareYourselfDesc',
      icon: Icons.self_improvement_rounded,
      categoryKey: 'mentalCategory',
    ),

    const TipModel(
      titleKey: 'dailyWalk',
      descriptionKey: 'dailyWalkDesc',
      icon: Icons.directions_walk_rounded,
      categoryKey: 'sportCategory',
    ),

    const TipModel(
      titleKey: 'sleepIsImportant',
      descriptionKey: 'sleepIsImportantDesc',
      icon: Icons.bedtime_rounded,
      categoryKey: 'mentalCategory',
    ),

    const TipModel(
      titleKey: 'spreadProtein',
      descriptionKey: 'spreadProteinDesc',
      icon: Icons.egg_alt_rounded,
      categoryKey: 'nutritionCategory',
    ),
  ];
}
