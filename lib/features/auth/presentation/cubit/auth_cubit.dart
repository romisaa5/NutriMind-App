import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_mind/core/common/models/user_model.dart';
import 'package:nutri_mind/features/auth/data/repos/auth_repository.dart';
import '../../../../core/utils/app_result.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final result = await repository.login(email: email, password: password);

    switch (result) {
      case Success():
        emit(AuthSuccess(result.data));

      case Error():
        emit(AuthError(result.failure.message));
    }
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

    switch (result) {
      case Success():
        await repository.sendVerificationEmail();
        emit(AuthSuccess(result.data));

      case Error():
        emit(AuthError(result.failure.message));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());

    final result = await repository.logout();

    switch (result) {
      case Success():
        emit(AuthLoggedOut());

      case Error():
        emit(AuthError(result.failure.message));
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());

    final result = await repository.forgotPassword(email);

    switch (result) {
      case Success():
        emit(PasswordResetSent());

      case Error():
        emit(AuthError(result.failure.message));
    }
  }

  Future<void> sendVerificationEmail() async {
    emit(AuthLoading());

    final result = await repository.sendVerificationEmail();

    switch (result) {
      case Success():
        emit(VerificationEmailSent());

      case Error():
        emit(AuthError(result.failure.message));
    }
  }

  Future<void> checkEmailVerification() async {
    final result = await repository.isEmailVerified();

    switch (result) {
      case Success():
        if (result.data) {
          emit(EmailVerified());
        } else {
          emit(EmailNotVerified());
        }

      case Error():
        emit(AuthError(result.failure.message));
    }
  }
}
