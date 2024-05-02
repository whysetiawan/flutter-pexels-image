import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/region_list_bottom_sheet.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/shrimp_size_list_bottom_sheet.dart';
import 'package:jala_test/shared/constants/assets_path.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class FloatingFilter extends StatelessWidget {
  const FloatingFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(60.w),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isScrollControlled: true,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<ShrimpPriceBloc>(context),
                  child: ShrimpSizeListBottomSheet(),
                );
              },
            );
          },
          child: Container(
            width: 168.w,
            height: 56.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(60.w),
              ),
              color: const Color(0xff004492),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsPath.ic_biomass,
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Size",
                      style: TextStyles.body3.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
                      buildWhen: ((previous, current) {
                        return true;
                      }),
                      builder: (context, state) {
                        if (state.fetchShrimpPriceStatus.isLoading) {
                          return const SizedBox();
                        }
                        return Text(
                          state.filter.size.toString(),
                          style: TextStyles.title4.copyWith(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isScrollControlled: true,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<ShrimpPriceBloc>(context),
                  child: const RegionListBottomSheet(),
                );
              },
            ).then(
              (value) => context.read<ShrimpPriceBloc>().add(
                    ChangeRegionKeyword(''),
                  ),
            );
          },
          child: Container(
            width: 168.w,
            height: 56.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(60.w),
              ),
              color: const Color(0xff1B77DF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsPath.ic_location,
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(
                  width: 6.w,
                ),
                BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
                  builder: (context, state) {
                    return Text(
                      state.filter.region.name,
                      style: TextStyles.btnPrimary.copyWith(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
