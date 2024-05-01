sealed class Result<T, E> {
  const Result();

  bool get isSuccess => this is Success<T, E>;
  bool get isFailure => this is Failure<T, E>;

  factory Result.success(T value) => Success<T, E>(value: value);
  factory Result.failure(E value) => Failure<T, E>(value: value);

  T get data => when<T>(
        onSuccess: (s) => s._value,
        onFailure: (f) => throw Exception('Cannot get value from failure'),
      );

  E get error => when<E>(
        onSuccess: (s) => throw Exception('Cannot get error from success'),
        onFailure: (f) => f._error,
      );

  R when<R>({
    required R Function(Success<T, E> success) onSuccess,
    required R Function(Failure<T, E> failure) onFailure,
  }) {
    if (this is Success<T, E>) {
      return onSuccess(this as Success<T, E>);
    } else if (this is Failure<T, E>) {
      return onFailure(this as Failure<T, E>);
    }
    throw Exception('Invalid type of Result');
  }

  @override
  String toString() => when<String>(
        onSuccess: (s) => 'Success{_value: $s}',
        onFailure: (f) => 'Failure{_value: $f}',
      );
}

final class Success<T, E> extends Result<T, E> {
  final T _value;

  Success({required T value}) : _value = value;

  @override
  T get data => _value;

  @override
  String toString() => 'Success{_value: $_value}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}

final class Failure<T, E> extends Result<T, E> {
  final E _error;

  Failure({required E value}) : _error = value;

  @override
  E get error => _error;

  @override
  String toString() => 'Failure{_value: $_error}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          _error == other._error;

  @override
  int get hashCode => _error.hashCode;
}
