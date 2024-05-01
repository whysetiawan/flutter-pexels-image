import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/core/di.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/pages/home_page.dart';
import 'package:jala_test/routes/routes.dart';

class RootRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ShrimpPriceBloc>(
            create: (context) => ShrimpPriceBloc(getShrimpPricesUseCase: sl()),
            child: const HomePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
