import 'package:jala_test/modules/shrimp_news/domain/entity/news_entity.dart';

abstract interface class ShrimpNewsRepository {
  Future<List<NewsEntity>> getShrimpNews();
}
