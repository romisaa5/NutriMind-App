import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nutri_mind/core/config/groq_config.dart';
import 'package:nutri_mind/core/helpers/secure_storage_helper.dart';
import 'package:nutri_mind/core/helpers/shared_pref_helper.dart';
import 'package:nutri_mind/core/services/firebase/firebase_auth_service.dart';
import 'package:nutri_mind/core/services/firebase/firestore_service.dart';
import 'package:nutri_mind/core/services/gemini/groq_nutrition_service.dart';
import 'package:nutri_mind/features/auth/data/repos/auth_repository.dart';
import 'package:nutri_mind/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nutri_mind/features/scan/data/repos/meal_repository.dart';
import 'package:nutri_mind/features/scan/data/repos/meal_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  final sharedPrefs = await SharedPrefHelper.init();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageHelper>(
    () => SecureStorageHelper(getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  getIt.registerLazySingleton(() => FirebaseAuthService(getIt()));

  getIt.registerLazySingleton(() => FirestoreService(getIt()));

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(authService: getIt(), firestore: getIt()),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(getIt<FirestoreService>()),
  );

  getIt.registerLazySingleton<GroqNutritionService>(
    () => GroqNutritionService(
      apiKey: GroqConfig.apiKey,
      model: GroqConfig.model,
    ),
  );
}
