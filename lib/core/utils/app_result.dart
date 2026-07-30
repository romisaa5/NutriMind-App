import '../error/failures.dart';

sealed class AppResult<T> {
  const AppResult();

  bool get isSuccess => this is ResultSuccess<T>;
  bool get isError => this is ResultError<T>;

  T? get dataOrNull => switch (this) {
    ResultSuccess<T>(data: final d) => d,
    ResultError<T>() => null,
  };

  Failure? get failureOrNull => switch (this) {
    ResultSuccess<T>() => null,
    ResultError<T>(failure: final f) => f,
  };

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      ResultSuccess<T>(data: final d) => success(d),
      ResultError<T>(failure: final f) => error(f),
    };
  }
}

final class ResultSuccess<T> extends AppResult<T> {
  final T data;
  const ResultSuccess(this.data);
}

final class ResultError<T> extends AppResult<T> {
  final Failure failure;
  const ResultError(this.failure);
}
