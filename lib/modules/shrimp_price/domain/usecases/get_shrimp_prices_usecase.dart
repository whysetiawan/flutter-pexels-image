import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class GetShrimpPricesUseCaseParams {
  final String? regionId;

  GetShrimpPricesUseCaseParams(this.regionId);
}

final class GetShrimpPricesUseCase extends BaseUsecase<
    Future<Result<ShrimpPriceEntity, Exception?>>,
    GetShrimpPricesUseCaseParams> {
  final ShrimpPriceRepository _shrimpPriceRepository;

  GetShrimpPricesUseCase({
    required ShrimpPriceRepository shrimpPriceRepository,
  }) : _shrimpPriceRepository = shrimpPriceRepository;

  @override
  Future<Result<ShrimpPriceEntity, Exception>> invoke(
      GetShrimpPricesUseCaseParams params) async {
    // try {
    final result = await _shrimpPriceRepository.getShrimpPrices(
      params.regionId ?? "",
    );
    return Result.success(result);
    // } catch (e) {
    //   return Result.failure(e as Exception);
    // }
  }
}
