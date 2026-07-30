import 'package:nutri_mind/core/utils/app_result.dart';
import '../../../../core/common/models/app_models.dart';

abstract class MealRepository {
  Future<AppResult<void>> saveMeal({
    required String uid,
    required MealModel meal,
  });
  Stream<List<MealModel>> streamTodayMeals(String uid);
}
