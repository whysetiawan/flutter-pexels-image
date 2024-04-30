sealed class Result<T, E> {
  final T data;
  final E error;

  const Result({
    required this.data,
    required this.error,
  });

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  @override
  String toString() {
    return "Result(data: $data, error: $error)";
  }

  factory Result.success(T data) {
    Success<T> success = Success(data: data);
    return success as Result<T, E>;
  }

  factory Result.failure(E error) {
    Error<T, E> failure = Error(error: error);
    return failure as Result<T, E>;
  }
  // static Success<T, Null> success<T>(T data) => Success<T, Null>(data: data);
  // static Error<Null, E> failure<E>(E error) => Error<Null, E>(error: error);
}

final class Success<T> extends Result<T, Null> {
  const Success({
    required super.data,
  }) : super(error: null);

  @override
  String toString() => "Success(data: $data)";
}

final class Error<T, E> extends Result<Null, E> {
  const Error({
    required super.error,
  }) : super(data: null);

  @override
  String toString() => "Error(error: $error)";
}
