import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_api_datasource.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

final class GetShrimpPricesUseCase
    extends BaseUsecase<Future<Result<List<ShrimpPriceEntity>, Null>>, void> {
  final ShrimpPriceApiDataSource _shrimpPriceApi;

  GetShrimpPricesUseCase({required ShrimpPriceApiDataSource shrimpPriceApi})
      : _shrimpPriceApi = shrimpPriceApi;

  @override
  Future<Result<List<ShrimpPriceEntity>, Null>> invoke(void params) {
    throw UnimplementedError();
  }
}
