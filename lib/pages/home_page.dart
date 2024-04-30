import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/core/di.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/carousel.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/floating_filter.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ShrimpPriceBloc _shrimpPriceBloc = ShrimpPriceBloc(
    getShrimpPricesUseCase: sl(),
  );
  @override
  void initState() {
    super.initState();
    _shrimpPriceBloc.add(ShrimpPriceFetched());
  }

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
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
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
          ),
          child: const FloatingFilter(),
        ),
        appBar: AppBar(
          toolbarHeight: 56.w,
          title: const Text("Jala Media"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52.w),
            child: Material(
              color: Colors.white,
              child: tabBar,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                16.w,
              ),
              child: Text(
                "Coba Fitur Lainnya",
                style: TextStyles.title3,
              ),
            ),
            const Carousel(),
            SizedBox(
              height: 16.w,
            ),
            BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
              bloc: _shrimpPriceBloc,
              builder: (context, state) {
                print(
                  "STATEE ${state.shrimpPrices.toString()}",
                );
                print("STATUS ${state.status.toString()}");
                return Divider(
                  color: Colors.grey.shade300,
                  thickness: 4,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
