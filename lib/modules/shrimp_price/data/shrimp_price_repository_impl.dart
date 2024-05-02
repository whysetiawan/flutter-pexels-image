import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_api_datasource.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/region_entity.dart';
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
  Future<ShrimpPriceEntity> getShrimpPrices(String regionId) {
    return _shrimpPriceApi.getShrimpPrices(regionId);
  }

  @override
  Iterable<int> getShrimpSize(int max) {
    return _shrimpPriceLocal.getShrimpSize(max);
  }

  @override
  Future<PaginatedRegionEntity> getRegions({
    required int page,
    required String keyword,
  }) {
    return _shrimpPriceApi.getRegions(
      page: page,
      keyword: keyword,
    );
  }
}
