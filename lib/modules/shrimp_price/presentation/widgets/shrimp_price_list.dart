import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/shrimp_price_card_item.dart';

class ShrimpPriceList extends StatefulWidget {
  const ShrimpPriceList({
    super.key,
  });

  @override
  State<ShrimpPriceList> createState() => _ShrimpPriceListState();
}

class _ShrimpPriceListState extends State<ShrimpPriceList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
      builder: (context, state) {
        final shrimpPrices = state.shrimpPrices;
        if (state.fetchShrimpPriceStatus.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shrimpPrices.length,
          shrinkWrap: true,
          itemBuilder: (_, idx) {
            final data = shrimpPrices[idx];
            return ShrimpPriceCardItem(
              data: data,
              size: state.filter.size,
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
