import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/core/di.dart';
import 'package:jala_test/modules/diseases/presentation/bloc/diseases_bloc.dart';
import 'package:jala_test/modules/shrimp_news/presentation/bloc/shrimp_news_bloc.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/pages/diseases_page.dart';
import 'package:jala_test/pages/shrimp_news_page.dart';
import 'package:jala_test/pages/shrimp_price_page.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56.w,
          title: const Text("Jala Media"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52.w),
            child: Material(
              color: Colors.white,
              child: TabBar(
                automaticIndicatorColorAdjustment: true,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey.shade500,
                dividerColor: Colors.transparent,
                labelStyle: TextStyles.title4,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4.0,
                tabs: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.w,
                    ),
                    child: const Text("Harga Udang"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.w,
                    ),
                    child: const Text("Kabar Udang"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.w,
                    ),
                    child: const Text("Penyakit"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BlocProvider(
              create: (context) => ShrimpPriceBloc(
                getShrimpPricesUseCase: sl(),
                getRegionsUseCase: sl(),
              ),
              child: const ShrimpPricePage(),
            ),
            BlocProvider(
              create: (context) => ShrimpNewsBloc(
                getShrimpNewsUseCase: sl(),
              ),
              child: const ShrimpNewsPage(),
            ),
            BlocProvider(
              create: (context) => DiseasesBloc(
                getDiseaseListUseCase: sl(),
              ),
              child: const DiseasesPage(),
            ),
          ],
        ),
      ),
    );
  }
}
