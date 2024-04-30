import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class ShrimpPriceApiDataSource implements ShrimpPriceRepository {
  @override
  Future<List<ShrimpPriceEntity>> getShrimpPrices() {
    throw UnimplementedError();
  }

  @override
  Iterable<int> getShrimpSize(int max) {
    throw UnimplementedError("getShrimpSize() not available in api datasource");
  }
}
