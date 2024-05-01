import 'package:jala_test/modules/shrimp_news/data/api/shrimp_news_api_datasource.dart';
import 'package:jala_test/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:jala_test/modules/shrimp_news/domain/shrimp_news_repository.dart';

final class ShrimpNewsRepositoryImpl implements ShrimpNewsRepository {
  final ShrimpNewsApiDataSource _shrimpApiDatasource;

  ShrimpNewsRepositoryImpl({
    required ShrimpNewsApiDataSource shrimpApiDataSource,
  }) : _shrimpApiDatasource = shrimpApiDataSource;
  @override
  Future<List<NewsEntity>> getShrimpNews() {
    return _shrimpApiDatasource.getShrimpNews();
  }
}
