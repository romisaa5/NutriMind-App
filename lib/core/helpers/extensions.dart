import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nutri_mind/generated/l10n.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

extension LocalizationExtensions on S {
  // ---------------- Meal ----------------

  String mealLabel(String key) {
    switch (key) {
      case 'mealBreakfast':
        return mealBreakfast;

      case 'mealLunch':
        return mealLunch;

      case 'mealDinner':
        return mealDinner;

      default:
        return '';
    }
  }

  // ---------------- Weekly Days ----------------

  String dayLabel(String key) {
    switch (key) {
      case 'daySaturdayShort':
        return daySaturdayShort;

      case 'daySundayShort':
        return daySundayShort;

      case 'dayMondayShort':
        return dayMondayShort;

      case 'dayTuesdayShort':
        return dayTuesdayShort;

      case 'dayWednesdayShort':
        return dayWednesdayShort;

      case 'dayThursdayShort':
        return dayThursdayShort;

      case 'dayFridayShort':
        return dayFridayShort;

      default:
        return '';
    }
  }

  // ---------------- Tips ----------------

  String tipTitle(String key) {
    switch (key) {
      case 'drinkEnoughWater':
        return drinkEnoughWater;

      case 'dontCompareYourself':
        return dontCompareYourself;

      case 'dailyWalk':
        return dailyWalk;

      case 'sleepIsImportant':
        return sleepIsImportant;

      case 'spreadProtein':
        return spreadProtein;

      default:
        return '';
    }
  }

  String tipDescription(String key) {
    switch (key) {
      case 'drinkEnoughWaterDesc':
        return drinkEnoughWaterDesc;

      case 'dontCompareYourselfDesc':
        return dontCompareYourselfDesc;

      case 'dailyWalkDesc':
        return dailyWalkDesc;

      case 'sleepIsImportantDesc':
        return sleepIsImportantDesc;

      case 'spreadProteinDesc':
        return spreadProteinDesc;

      default:
        return '';
    }
  }

  String tipCategory(String key) {
    switch (key) {
      case 'nutritionCategory':
        return nutritionCategory;

      case 'mentalCategory':
        return mentalCategory;

      case 'sportCategory':
        return sportCategory;

      default:
        return '';
    }
  }
}
