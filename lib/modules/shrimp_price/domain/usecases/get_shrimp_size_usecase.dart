import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/domain/shrimp_price_repository.dart';

final class GetShrimpSizeUseCase
    extends BaseUsecase<Result<List<int>, Null>, void> {
  final ShrimpPriceRepository _shrimpPriceRepository;

  GetShrimpSizeUseCase({required ShrimpPriceRepository shrimpPriceRepository})
      : _shrimpPriceRepository = shrimpPriceRepository;

  @override
  Result<List<int>, Null> invoke(void params) {
    final shrimpSize =
        _shrimpPriceRepository.getShrimpSize(200).map((e) => e).toList();
    return Result.success(shrimpSize);
  }
}