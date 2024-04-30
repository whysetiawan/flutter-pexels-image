import 'package:flutter/material.dart';
import 'package:jala_test/main.dart';
import 'package:jala_test/pages/home_page.dart';
import 'package:jala_test/routes/routes.dart';

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
