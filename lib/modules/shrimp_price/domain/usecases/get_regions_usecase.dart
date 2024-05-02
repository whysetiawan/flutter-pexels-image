import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/region_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class GetRegionsUseCaseParams {
  final int page;
  final String keyword;

  const GetRegionsUseCaseParams({
    this.page = 1,
    this.keyword = '',
  });
}

final class GetRegionsUseCase extends BaseUsecase<
    Future<Result<PaginatedRegionEntity, Null>>, GetRegionsUseCaseParams> {
  final ShrimpPriceRepository _shrimpPriceRepository;

  GetRegionsUseCase({
    required ShrimpPriceRepository shrimpPriceRepository,
  }) : _shrimpPriceRepository = shrimpPriceRepository;

  @override
  Future<Result<PaginatedRegionEntity, Null>> invoke(
      GetRegionsUseCaseParams params) async {
    final res = await _shrimpPriceRepository.getRegions(
      page: params.page,
      keyword: params.keyword,
    );
    return Result.success(res);
  }
}
