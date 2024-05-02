import 'package:flutter/material.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';
import 'package:jala_test/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/pages/diseases_detail_page.dart';
import 'package:jala_test/pages/home_page.dart';
import 'package:jala_test/pages/shrimp_news_detail_page.dart';
import 'package:jala_test/pages/shrimp_price_detail_page.dart';
import 'package:jala_test/routes/routes.dart';

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.postsDetail:
        return MaterialPageRoute(
          builder: (_) => ShrimpNewsDetailPage(
            news: settings.arguments as NewsEntity,
          ),
        );
      case Routes.shrimpPriceDetail:
        return MaterialPageRoute(
          builder: (_) => ShrimpPriceDetailPage(
            shrimpPrice: settings.arguments as ShrimpPriceItem,
          ),
        );
      case Routes.diseaseDetail:
        return MaterialPageRoute(
          builder: (_) => DiseasesDetailPage(
            disease: settings.arguments as DiseaseEntity,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
