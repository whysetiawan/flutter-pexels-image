import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class ShrimpPriceLocalDataSource implements ShrimpPriceRepository {
  @override
  Iterable<int> get shrimpSize sync* {
    int i = 20;
    while (i <= 200) {
      yield i;
      i = i + 10;
    }
  }

  @override
  Future<List<ShrimpPriceEntity>> getShrimpPrices() {
    throw UnimplementedError(
      "getShrimpPrices() not available in local datasource",
    );
  }
}
