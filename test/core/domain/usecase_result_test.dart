import 'package:flutter_test/flutter_test.dart';
import 'package:jala_test/core/domain/usecase_result.dart';

void main() {
  test("should return success", () {
    final result = Success(value: 1);
    expect(result, isA<Success<int, dynamic>>());
    expect(result.data, 1);
  });

  test("should return failure", () {
    final result = Failure(value: Exception());
    expect(result, isA<Failure<dynamic, Exception>>());
    expect(result.error, isA<Exception>());
  });

  test("should generate success from factory constructor", () {
    final result = Result.success(1);
    expect(result, isA<Success<int, dynamic>>());
    expect(result.data, 1);
  });

  test("should generate failure from factory constructor", () {
    final result = Result.failure(Exception());
    expect(result, isA<Failure<dynamic, Exception>>());
    expect(result.error, isA<Exception>());
  });
}
