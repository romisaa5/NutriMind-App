import '../error/failures.dart';

sealed class AppResult<T> {
  const AppResult();
}

class Success<T> extends AppResult<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends AppResult<T> {
  final Failure failure;

  const Error(this.failure);
}
