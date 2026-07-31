import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_mind/core/utils/app_result.dart';
import 'package:nutri_mind/features/scan/data/repos/meal_repository.dart';
import '../../../../core/common/models/app_models.dart';
import '../../../../core/config/firestore_collections.dart';
import '../../../../core/services/firebase/firestore_service.dart';

class MealRepositoryImpl implements MealRepository {
  final FirestoreService _firestoreService;
  MealRepositoryImpl(this._firestoreService);

  @override
  Future<AppResult<void>> saveMeal({
    required String uid,
    required MealModel meal,
  }) async {
    final result = await _firestoreService.addDoc(
      path: FirestoreCollections.userMeals(uid),
      data: meal.toMap(),
    );
    return result.when(
      success: (_) => const Success(null),
      error: (failure) => Err(failure),
    );
  }

  @override
  Stream<List<MealModel>> streamTodayMeals(String uid) {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    return _firestoreService.streamCollection<MealModel>(
      path: FirestoreCollections.userMeals(uid),
      fromJson: MealModel.fromMap,
      queryBuilder: (query) => query
          .where(
            'loggedAt',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
          )
          .orderBy('loggedAt'),
    );
  }
}
