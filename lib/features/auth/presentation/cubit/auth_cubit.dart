import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_mind/core/utils/app_result.dart';

import '../../../../core/common/models/user_model.dart';
import '../../../../core/error/failures.dart';
import '../../data/repos/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await repository.login(email: email, password: password);

    result.when(
      success: (user) => emit(AuthSuccess(user)),
      error: (failure) => emit(AuthError(failure)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await repository.register(
      name: name,
      email: email,
      password: password,
    );

    result.when(
      success: (user) => emit(AuthSuccess(user)),
      error: (failure) => emit(AuthError(failure)),
    );

    // بنبعت رسالة التفعيل بس لو التسجيل نجح فعلًا
    if (result is Success<UserModel>) {
      await repository.sendVerificationEmail();
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());

    final result = await repository.logout();

    result.when(
      success: (_) => emit(AuthLoggedOut()),
      error: (failure) => emit(AuthError(failure)),
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());

    final result = await repository.forgotPassword(email);

    result.when(
      success: (_) => emit(PasswordResetSent()),
      error: (failure) => emit(AuthError(failure)),
    );
  }

  Future<void> sendVerificationEmail() async {
    emit(AuthLoading());

    final result = await repository.sendVerificationEmail();

    result.when(
      success: (_) => emit(VerificationEmailSent()),
      error: (failure) => emit(AuthError(failure)),
    );
  }

  Future<void> checkEmailVerification() async {
    final result = await repository.isEmailVerified();

    result.when(
      success: (verified) =>
          emit(verified ? EmailVerified() : EmailNotVerified()),
      error: (failure) => emit(AuthError(failure)),
    );
  }
}
