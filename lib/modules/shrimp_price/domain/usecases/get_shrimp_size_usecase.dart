import 'package:jala_test/core/domain/base_usecase.dart';
import 'package:jala_test/core/domain/usecase_result.dart';
import 'package:jala_test/modules/shrimp_price/data/datasource/shrimp_price_local_datasource.dart';

final class GetShrimpSizeUseCase
    extends BaseUsecase<Result<List<int>, Null>, void> {
  final ShrimpPriceLocalDataSource _shrimpPriceLocal;

  GetShrimpSizeUseCase({required ShrimpPriceLocalDataSource shrimpPriceApi})
      : _shrimpPriceLocal = shrimpPriceApi;

  @override
  Result<List<int>, Null> invoke(void params) {
    final shrimpSize =
        _shrimpPriceLocal.getShrimpSize(200).map((e) => e).toList();
    return Result.success(shrimpSize);
  }
}
