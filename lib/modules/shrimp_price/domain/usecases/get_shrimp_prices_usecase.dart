import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

final class GetShrimpPricesUseCase extends BaseUsecase<
    Future<Result<List<ShrimpPriceEntity>, Exception>>, void> {
  final ShrimpPriceLocalDataSource _shrimpPriceApi;

  GetShrimpPricesUseCase({
    required ShrimpPriceLocalDataSource shrimpPriceApi,
  }) : _shrimpPriceApi = shrimpPriceApi;

  @override
  Future<Result<List<ShrimpPriceEntity>, Exception>> invoke(void params) async {
    try {
      final result = await _shrimpPriceApi.getShrimpPrices();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
