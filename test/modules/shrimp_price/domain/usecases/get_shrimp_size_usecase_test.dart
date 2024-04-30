import 'package:flutter_test/flutter_test.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_size_usecase.dart';

void main() {
  late final GetShrimpSizeUseCase usecase;

  setUp(() {
    usecase = GetShrimpSizeUseCase(
      shrimpPriceApi: ShrimpPriceLocalDataSource(),
    );
  });

  test("should return list of integer", () {
    final result = usecase.invoke(null);
    expect(result.isSuccess, true);
    expect(result.data, isA<List<int>>());
    expect(result.data.length, 20);
  });
}
