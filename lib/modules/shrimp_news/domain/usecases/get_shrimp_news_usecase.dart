import 'package:pexels_image/core/domain/base_usecase.dart';
import 'package:pexels_image/core/domain/usecase_result.dart';
import 'package:pexels_image/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:pexels_image/modules/shrimp_news/domain/shrimp_news_repository.dart';

final class GetShrimpNewsUseCase
    extends BaseUsecase<Future<Result<List<NewsEntity>, Exception?>>, void> {
  final ShrimpNewsRepository _shrimpNewsRepository;

  GetShrimpNewsUseCase({
    required ShrimpNewsRepository shrimpNewsRepository,
  }) : _shrimpNewsRepository = shrimpNewsRepository;

  @override
  Future<Result<List<NewsEntity>, Exception>> invoke(void params) async {
    try {
      final result = await _shrimpNewsRepository.getShrimpNews();
      return Result.success(result);
    } catch (e) {
      return Result.failure(e as Exception);
    }
  }
}
