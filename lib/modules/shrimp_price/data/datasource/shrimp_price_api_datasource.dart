import 'package:dio/dio.dart';
import 'package:jala_test/modules/shrimp_price/data/dto/regions_response_dto.dart';
import 'package:jala_test/modules/shrimp_price/data/dto/shrimp_prices_response_dto.dart';
import 'package:jala_test/modules/shrimp_price/data/mapper/shrimp_price_mapper.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/region_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

final class ShrimpPriceApiDataSource {
  final Dio client;

  const ShrimpPriceApiDataSource({
    required this.client,
  });
  Future<ShrimpPriceEntity> getShrimpPrices(String regionId) async {
    final response = await client.get('/shrimp_prices', queryParameters: {
      'page': 1,
      'per_page': 10,
      'with': 'region,creator',
      'region_id': regionId,
    });
    final dto = ShrimpPricesResponseDto.fromJson(response.data);
    return ShrimpPriceMapper.shrimpResponseToEntity(
      dto,
    );
  }

  Future<PaginatedRegionEntity> getRegions({
    required int page,
    required String keyword,
  }) async {
    final response = await client.get('/regions', queryParameters: {
      'page': page,
      'per_page': 10,
      'search': keyword,
      'has': 'shrimp_prices',
    });
    final dto = RegionsResponseDto.fromJson(response.data);
    return ShrimpPriceMapper.regionResponseDtoToEntity(dto);
  }
}
