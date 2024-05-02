import 'package:jala_test/modules/shrimp_news/data/dto/shrimp_news_response_dto.dart';
import 'package:jala_test/modules/shrimp_news/domain/entity/news_entity.dart';

final class ShrimpNewsMapper {
  static List<NewsEntity> mapResponseToEntity(ShrimpNewsResponseDto dto) {
    return dto.data
        .map(
          (e) => NewsEntity(
            title: e.title,
            id: e.id,
            createdAt: DateTime.parse(e.createdAt),
            thumbnailPath: e.image,
            description: e.metaDescription,
          ),
        )
        .toList();
  }
}
