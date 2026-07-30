import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_mind/core/utils/app_result.dart';

import '../../../../core/common/models/user_model.dart';
import '../../../../core/config/firestore_collections.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firestore_service.dart';
import '../../../../core/utils/app_result_auth.dart';

class AuthRepository {
  final FirebaseAuthService authService;
  final FirestoreService firestore;

  AuthRepository({required this.authService, required this.firestore});

  Future<AppResultAuth<UserModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await authService.register(
        email: email,
        password: password,
      );

      final user = UserModel(
        uid: credential.user!.uid,
        name: name,
        email: email,
      );

      await firestore.setDoc(
        data: user.toJson(),
        path: FirestoreCollections.users,
        docId: user.uid,
      );

      return Success(user);
    } on FirebaseAuthException catch (e) {
      return Error(AuthFailure(e.message ?? "Registration Failed"));
    } catch (_) {
      return const Error(UnknownFailure("Something went wrong"));
    }
  }

  Future<AppResultAuth<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await authService.login(
        email: email,
        password: password,
      );

      final result = await firestore.getDoc<UserModel>(
        path: FirestoreCollections.users,
        docId: credential.user!.uid,
        fromJson: (data, id) => UserModel.fromJson(data),
      );

      switch (result) {
        case ResultSuccess<UserModel?>():
          final user = result.data;

          if (user == null) {
            return const Error(FirestoreFailure("User data not found"));
          }

          return Success(user);

        case ResultError():
          return Error(result.failure);
      }
    } on FirebaseAuthException catch (e) {
      return Error(AuthFailure(e.message ?? "Login Failed"));
    } catch (_) {
      return const Error(UnknownFailure("Something went wrong"));
    }
  }

  Future<AppResultAuth<void>> logout() async {
    try {
      await authService.logout();
      return const Success(null);
    } catch (_) {
      return const Error(UnknownFailure("Logout Failed"));
    }
  }

  Future<AppResultAuth<void>> forgotPassword(String email) async {
    try {
      await authService.sendResetPassword(email);

      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Error(AuthFailure(e.message ?? "Failed"));
    }
  }

  Future<AppResultAuth<void>> sendVerificationEmail() async {
    try {
      await authService.verifyEmail();

      return const Success(null);
    } catch (_) {
      return const Error(UnknownFailure("Failed"));
    }
  }

  Future<AppResultAuth<bool>> isEmailVerified() async {
    try {
      await authService.reloadUser();

      return Success(authService.currentUser!.emailVerified);
    } catch (_) {
      return const Error(UnknownFailure("Failed"));
    }
  }

  User? get currentUser => authService.currentUser;
}
