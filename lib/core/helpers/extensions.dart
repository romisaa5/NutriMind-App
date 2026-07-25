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

      case 'spreadProtein':
        return spreadProtein;

      case 'eatMoreVeggies':
        return eatMoreVeggies;

      case 'limitAddedSugar':
        return limitAddedSugar;

      case 'dontCompareYourself':
        return dontCompareYourself;

      case 'sleepIsImportant':
        return sleepIsImportant;

      case 'practiceGratitude':
        return practiceGratitude;

      case 'takeBreaks':
        return takeBreaks;

      case 'dailyWalk':
        return dailyWalk;

      case 'stretchDaily':
        return stretchDaily;

      case 'strengthTraining':
        return strengthTraining;

      case 'consistentSleepSchedule':
        return consistentSleepSchedule;

      case 'avoidScreensBeforeBed':
        return avoidScreensBeforeBed;

      case 'trackYourMeals':
        return trackYourMeals;

      case 'smallStepsCount':
        return smallStepsCount;

      default:
        return '';
    }
  }

  String tipDescription(String key) {
    switch (key) {
      case 'drinkEnoughWaterDesc':
        return drinkEnoughWaterDesc;

      case 'spreadProteinDesc':
        return spreadProteinDesc;

      case 'eatMoreVeggiesDesc':
        return eatMoreVeggiesDesc;

      case 'limitAddedSugarDesc':
        return limitAddedSugarDesc;

      case 'dontCompareYourselfDesc':
        return dontCompareYourselfDesc;

      case 'sleepIsImportantDesc':
        return sleepIsImportantDesc;

      case 'practiceGratitudeDesc':
        return practiceGratitudeDesc;

      case 'takeBreaksDesc':
        return takeBreaksDesc;

      case 'dailyWalkDesc':
        return dailyWalkDesc;

      case 'stretchDailyDesc':
        return stretchDailyDesc;

      case 'strengthTrainingDesc':
        return strengthTrainingDesc;

      case 'consistentSleepScheduleDesc':
        return consistentSleepScheduleDesc;

      case 'avoidScreensBeforeBedDesc':
        return avoidScreensBeforeBedDesc;

      case 'trackYourMealsDesc':
        return trackYourMealsDesc;

      case 'smallStepsCountDesc':
        return smallStepsCountDesc;

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

      case 'sleepCategory':
        return sleepCategory;

      case 'habitsCategory':
        return habitsCategory;

      default:
        return '';
    }
  }
}
