import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class GetShrimpPricesUseCase
    extends BaseUsecase<Future<Result<ShrimpPriceEntity, Exception?>>, void> {
  final ShrimpPriceRepository _shrimpPriceRepository;

  GetShrimpPricesUseCase({
    required ShrimpPriceRepository shrimpPriceRepository,
  }) : _shrimpPriceRepository = shrimpPriceRepository;

  @override
  Future<Result<ShrimpPriceEntity, Exception>> invoke(void params) async {
    try {
      final result = await _shrimpPriceRepository.getShrimpPrices();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e as Exception);
    }
  }
}
