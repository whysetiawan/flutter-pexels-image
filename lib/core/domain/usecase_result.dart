sealed class Result<T, E> {
  final T? _data;
  final E? _error;

  const Result({
    T? data,
    E? error,
  })  : _data = data,
        _error = error;

  get data => _data!;
  get error => _error!;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  @override
  String toString() {
    return "Result(data: $data, error: $error)";
  }

  factory Result.success(T data) {
    Success<T, E> success = Success<T, E>(value: data);
    return success;
  }

  factory Result.failure(E error) {
    Error<T, E> failure = Error<T, E>(error: error);
    return failure;
  }

  // static Result<T, Null> success<T>(T data) => Success<T>(data: data);
  // static Error<Null, E> failure<E>(E error) => Error<Null, E>(error: error);

  when({
    required void Function(T data) onSuccess,
    required void Function(E error) onFailure,
  }) {
    if (isSuccess) {
      return onSuccess(data);
    } else {
      return onFailure(error);
    }
  }
}

final class Success<T, E> extends Result<T, E> {
  final T value;
  const Success({
    required this.value,
  }) : super(error: null as E, data: value);

  @override
  String toString() => "Success(data: $data)";
}

final class Error<T, E> extends Result<T, E> {
  const Error({
    required super.error,
  }) : super(data: null);

  @override
  String toString() => "Error(error: $error)";
}
