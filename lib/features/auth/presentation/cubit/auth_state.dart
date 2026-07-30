part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);
}

final class AuthLoggedOut extends AuthState {}

final class PasswordResetSent extends AuthState {}

final class VerificationEmailSent extends AuthState {}

final class EmailVerified extends AuthState {}

final class EmailNotVerified extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}
