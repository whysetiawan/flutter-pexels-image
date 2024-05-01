import 'package:jala_test/modules/shrimp_price/data/dto/shrimp_prices_response_dto.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/price_creator_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

final class ShrimpPriceMapper {
  static List<ShrimpPriceEntity> shrimpResponseToEntity(
      ShrimpPricesResponseDto shrimpPricesResponse) {
    return shrimpPricesResponse.data
        .map(
          (e) => ShrimpPriceEntity(
            id: e.id,
            cityName: e.region.regencyName,
            provinceName: e.region.provinceName,
            priceCreator: PriceCreatorEntity(
              id: e.creator.id,
              name: e.creator.name,
              isVerified: e.creator.emailVerified,
              occupation: e.creator.occupation ?? "",
            ),
            prices: {
              20: e.size20,
              30: e.size30,
              40: e.size40,
              50: e.size50,
              60: e.size60,
              70: e.size70,
              80: e.size80,
              90: e.size90,
              100: e.size100,
              110: e.size110,
              120: e.size120,
              130: e.size130,
              140: e.size140,
              150: e.size150,
              160: e.size160,
              170: e.size170,
              180: e.size180,
              190: e.size190,
              200: e.size200,
            },
          ),
        )
        .toList();
  }
}
