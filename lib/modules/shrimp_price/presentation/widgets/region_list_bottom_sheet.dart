import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/shared/styles/text_styles.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class RegionListBottomSheet extends StatefulWidget {
  const RegionListBottomSheet({super.key});

  @override
  State<RegionListBottomSheet> createState() => _RegionListBottomSheetState();
}

class _RegionListBottomSheetState extends State<RegionListBottomSheet> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ShrimpPriceBloc>().add(FetchRegions(keyword: ''));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.875,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kota/Kabupaten",
                  style: TextStyles.title3,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Tutup",
                    style: TextStyles.title3.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      context.read<ShrimpPriceBloc>().add(
                            ChangeRegionKeyword(value),
                          );
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: "Cari",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: InkWell(
                    child: const Icon(Icons.clear_rounded),
                    onTap: () {
                      _searchController.clear();
                      context.read<ShrimpPriceBloc>().add(
                            ChangeRegionKeyword(''),
                          );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
              builder: (context, state) {
                if (state.fetchRegionStatus.isLoading &&
                    state.regionList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return LazyLoadScrollView(
                  isLoading: state.fetchRegionStatus.isLoading,
                  onEndOfPage: () {
                    context.read<ShrimpPriceBloc>().add(FetchRegions());
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final data = state.regionList[index];
                      return ListTile(
                        onTap: () {
                          context
                              .read<ShrimpPriceBloc>()
                              .add(ChangeFilterRegion(data));
                          Navigator.pop(context);
                        },
                        title: Text(
                          data.fullName,
                          style: TextStyles.body2,
                        ),
                      );
                    },
                    itemCount: state.regionList.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
