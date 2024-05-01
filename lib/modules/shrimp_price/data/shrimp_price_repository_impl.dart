import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_api_datasource.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class ShrimpPriceRepositoryImpl implements ShrimpPriceRepository {
  final ShrimpPriceApiDataSource _shrimpPriceApi;
  final ShrimpPriceLocalDataSource _shrimpPriceLocal;

  const ShrimpPriceRepositoryImpl({
    required ShrimpPriceApiDataSource shrimpPriceApi,
    required ShrimpPriceLocalDataSource shrimpPriceLocal,
  })  : _shrimpPriceApi = shrimpPriceApi,
        _shrimpPriceLocal = shrimpPriceLocal;

  @override
  Future<ShrimpPriceEntity> getShrimpPrices() {
    return _shrimpPriceApi.getShrimpPrices();
  }

  @override
  Iterable<int> getShrimpSize(int max) {
    return _shrimpPriceLocal.getShrimpSize(max);
  }
}
