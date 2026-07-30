import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/common/models/user_model.dart';
import '../../../../core/config/firestore_collections.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firestore_service.dart';
import '../../../../core/utils/app_result.dart';

class AuthRepository {
  final FirebaseAuthService authService;
  final FirestoreService firestore;

  AuthRepository({required this.authService, required this.firestore});

  Future<AppResult<UserModel>> register({
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

      await firestore.set(
        collection: FirestoreCollections.users,
        documentId: user.uid,
        data: user.toJson(),
      );

      return Success(user);
    } on FirebaseAuthException catch (e) {
      return Error(AuthFailure(e.message ?? "Registration Failed"));
    } catch (_) {
      return const Error(UnknownFailure("Something went wrong"));
    }
  }

  Future<AppResult<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await authService.login(
        email: email,
        password: password,
      );

      final doc = await firestore.getDocument(
        collection: FirestoreCollections.users,
        documentId: credential.user!.uid,
      );

      final user = UserModel.fromJson(doc.data()!);

      return Success(user);
    } on FirebaseAuthException catch (e) {
      return Error(AuthFailure(e.message ?? "Login Failed"));
    } catch (_) {
      return const Error(UnknownFailure("Something went wrong"));
    }
  }

  Future<AppResult<void>> logout() async {
    try {
      await authService.logout();
      return const Success(null);
    } catch (_) {
      return const Error(UnknownFailure("Logout Failed"));
    }
  }

  Future<AppResult<void>> forgotPassword(String email) async {
    try {
      await authService.sendResetPassword(email);

      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Error(AuthFailure(e.message ?? "Failed"));
    }
  }

  Future<AppResult<void>> sendVerificationEmail() async {
    try {
      await authService.verifyEmail();

      return const Success(null);
    } catch (_) {
      return const Error(UnknownFailure("Failed"));
    }
  }

  Future<AppResult<bool>> isEmailVerified() async {
    try {
      await authService.reloadUser();

      return Success(authService.currentUser!.emailVerified);
    } catch (_) {
      return const Error(UnknownFailure("Failed"));
    }
  }

  User? get currentUser => authService.currentUser;
}
