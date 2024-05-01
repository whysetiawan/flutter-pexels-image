import 'package:dio/dio.dart';
import 'package:jala_test/modules/shrimp_price/data/dto/shrimp_prices_response_dto.dart';
import 'package:jala_test/modules/shrimp_price/data/mapper/shrimp_price_mapper.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

final class ShrimpPriceApiDataSource {
  final Dio client;

  const ShrimpPriceApiDataSource({
    required this.client,
  });
  Future<ShrimpPriceEntity> getShrimpPrices() async {
    final response = await client.get('/shrimp_prices', queryParameters: {
      'page': 1,
      'per_page': 10,
      'with': 'region,creator',
    });
    final dto = ShrimpPricesResponseDto.fromJson(response.data);
    return ShrimpPriceMapper.shrimpResponseToEntity(
      dto,
    );
  }
}
