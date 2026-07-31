import '../error/failures.dart';

sealed class AppResult<T> {
  const AppResult();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Err<T>;

  T? get dataOrNull => switch (this) {
    Success<T>(data: final d) => d,
    Err<T>() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success<T>() => null,
    Err<T>(failure: final f) => f,
  };

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      Success<T>(data: final d) => success(d),
      Err<T>(failure: final f) => error(f),
    };
  }
}

final class Success<T> extends AppResult<T> {
  final T data;
  const Success(this.data);
}

final class Err<T> extends AppResult<T> {
  final Failure failure;
  const Err(this.failure);
}
