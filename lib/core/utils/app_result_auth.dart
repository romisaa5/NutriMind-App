import '../error/failures.dart';

sealed class AppResultAuth<T> {
  const AppResultAuth();
}

class Success<T> extends AppResultAuth<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends AppResultAuth<T> {
  final Failure failure;

  const Error(this.failure);
}
