part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  const AuthSuccess(this.user);
}

class AuthLoggedOut extends AuthState {}

class PasswordResetSent extends AuthState {}

class VerificationEmailSent extends AuthState {}

class EmailVerified extends AuthState {}

class EmailNotVerified extends AuthState {}

/// بيحمل الـ Failure الخام مش نص جاهز - الترجمة بتحصل في الـ UI بس
/// (الـ Cubit نفسه معندوش BuildContext يترجم بيه)
/// في الشاشة: if (state is AuthError) Text(state.failure.localizedMessage(context))
class AuthError extends AuthState {
  final Failure failure;
  const AuthError(this.failure);
}
