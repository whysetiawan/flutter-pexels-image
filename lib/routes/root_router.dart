import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_image/core/di.dart';
import 'package:pexels_image/modules/photos/presentation/bloc/photos_bloc.dart';
import 'package:pexels_image/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:pexels_image/pages/home_page.dart';
import 'package:pexels_image/pages/shrimp_news_detail_page.dart';
import 'package:pexels_image/routes/routes.dart';

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PhotosBloc(sl()),
            child: const HomePage(),
          ),
        );
      case Routes.postsDetail:
        return MaterialPageRoute(
          builder: (_) => ShrimpNewsDetailPage(
            news: settings.arguments as NewsEntity,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
