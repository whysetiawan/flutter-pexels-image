import 'package:jala_test/modules/shrimp_price/domain/entities/region_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

abstract interface class ShrimpPriceRepository {
  Iterable<int> getShrimpSize(int max);
  Future<ShrimpPriceEntity> getShrimpPrices(String regionId);
  Future<PaginatedRegionEntity> getRegions({
    required int page,
    required String keyword,
  });
}
