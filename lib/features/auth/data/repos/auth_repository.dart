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

  User? get currentUser => authService.currentUser;

  Stream<User?> get authStateChanges => authService.authStateChanges;

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

      final saveResult = await firestore.setDoc(
        data: user.toJson(),
        path: FirestoreCollections.users,
        docId: user.uid,
      );

      return saveResult.when(
        success: (_) => Success(user),
        error: (failure) => Err(failure),
      );
    } on FirebaseAuthException catch (e) {
      return Err(AuthFailure(_mapAuthErrorCode(e.code), e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
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
      final uid = credential.user!.uid;

      final docResult = await firestore.getDoc<UserModel>(
        path: FirestoreCollections.users,
        docId: uid,
        fromJson: UserModel.fromJson,
      );

      return docResult.when(
        success: (user) => user != null
            ? Success(user)
            : const Err(FirestoreFailure(FailureCode.userDataNotFound)),
        error: (failure) => Err(failure),
      );
    } on FirebaseAuthException catch (e) {
      return Err(AuthFailure(_mapAuthErrorCode(e.code), e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<void>> logout() async {
    try {
      await authService.logout();
      return const Success(null);
    } catch (e) {
      return Err(AuthFailure(FailureCode.logoutFailed, e.toString()));
    }
  }

  Future<AppResult<void>> forgotPassword(String email) async {
    try {
      await authService.sendResetPassword(email);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Err(AuthFailure(_mapAuthErrorCode(e.code), e.message));
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<void>> sendVerificationEmail() async {
    try {
      await authService.verifyEmail();
      return const Success(null);
    } catch (e) {
      return Err(
        AuthFailure(FailureCode.verificationEmailFailed, e.toString()),
      );
    }
  }

  Future<AppResult<bool>> isEmailVerified() async {
    try {
      await authService.reloadUser();
      return Success(authService.currentUser?.emailVerified ?? false);
    } catch (e) {
      return Err(UnknownFailure(e.toString()));
    }
  }

  Future<AppResult<void>> deleteAccount() async {
    try {
      await authService.deleteAccount();
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Err(AuthFailure(_mapAuthErrorCode(e.code), e.message));
    } catch (e) {
      return Err(AuthFailure(FailureCode.deleteAccountFailed, e.toString()));
    }
  }

  /// تحويل أكواد أخطاء Firebase التقنية لـ FailureCode
  /// الترجمة الفعلية بتحصل بعدين في الـ UI عن طريق failure.localizedMessage(context)
  FailureCode _mapAuthErrorCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return FailureCode.emailAlreadyInUse;
      case 'invalid-email':
        return FailureCode.invalidEmail;
      case 'weak-password':
        return FailureCode.weakPassword;
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return FailureCode.wrongCredentials;
      case 'user-disabled':
        return FailureCode.userDisabled;
      case 'too-many-requests':
        return FailureCode.tooManyRequests;
      case 'network-request-failed':
        return FailureCode.networkError;
      case 'requires-recent-login':
        return FailureCode.requiresRecentLogin;
      default:
        return FailureCode.unknown;
    }
  }
}
