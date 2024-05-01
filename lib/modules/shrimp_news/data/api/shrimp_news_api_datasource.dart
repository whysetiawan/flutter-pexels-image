import 'package:dio/dio.dart';
import 'package:jala_test/modules/shrimp_news/data/dto/shrimp_news_response_dto.dart';
import 'package:jala_test/modules/shrimp_news/data/mapper/shrimp_news_mapper.dart';
import 'package:jala_test/modules/shrimp_news/domain/entity/news_entity.dart';

class ShrimpNewsApiDataSource {
  final Dio client;

  const ShrimpNewsApiDataSource({required this.client});

  Future<List<NewsEntity>> getShrimpNews() async {
    final response = await client.get('/posts', queryParameters: {
      'page': 1,
      'limit': 15,
      'with': 'creator',
    });
    return ShrimpNewsMapper.mapResponseToEntity(
      ShrimpNewsResponseDto.fromJson(response.data),
    );
  }
}
