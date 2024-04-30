import 'dart:convert';
import 'dart:io';

import 'package:jala_test/modules/shrimp_price/data/dto/shrimp_prices_response_dto.dart';
import 'package:jala_test/modules/shrimp_price/data/mapper/shrimp_price_mapper.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class ShrimpPriceLocalDataSource implements ShrimpPriceRepository {
  @override
  Iterable<int> getShrimpSize(int max) sync* {
    int i = 20;
    while (i <= max) {
      yield i;
      i = i + 10;
    }
  }

  @override
  Future<List<ShrimpPriceEntity>> getShrimpPrices() async {
    final json = await File('./test.json').readAsString();
    final map = jsonDecode(json)(json) as Map<String, dynamic>;
    return ShrimpPriceMapper.shrimpResponseToEntity(
      ShrimpPricesResponseDto.fromJson(map),
    );
  }
}
