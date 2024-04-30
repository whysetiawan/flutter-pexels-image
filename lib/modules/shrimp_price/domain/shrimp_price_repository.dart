import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

abstract interface class ShrimpPriceRepository {
  Iterable<int> get shrimpSize;
  Future<List<ShrimpPriceEntity>> getShrimpPrices();
}
