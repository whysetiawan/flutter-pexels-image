import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/carousel.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/floating_filter.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/shrimp_price_list.dart';
import 'package:jala_test/shared/styles/text_styles.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ShrimpPricePage extends StatefulWidget {
  const ShrimpPricePage({super.key});

  @override
  State<ShrimpPricePage> createState() => _ShrimpPricePageState();
}

class _ShrimpPricePageState extends State<ShrimpPricePage> {
  @override
  void initState() {
    super.initState();
    context.read<ShrimpPriceBloc>().add(FetchShrimpPrice());
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
        ),
        child: BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
          builder: (context, state) {
            return const FloatingFilter();
          },
        ),
      ),
      body: LazyLoadScrollView(
        onEndOfPage: () {},
        child: SingleChildScrollView(
          child: Column(
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
              Divider(
                color: Colors.grey.shade300,
                thickness: 4,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16.w,
                  16.w,
                  16.w,
                  8.w,
                ),
                child: Text(
                  "Harga Terbaru",
                  style: TextStyles.title2.copyWith(
                    color: Colors.blue,
                  ),
                ),
              ),
              const ShrimpPriceList(),
              SizedBox(
                height: 72.w,
              )
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // bool get wantKeepAlive => false;
}
