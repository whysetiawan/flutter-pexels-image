import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/core/di.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_size_usecase.dart';
import 'package:jala_test/modules/shrimp_price/presentation/bloc/shrimp_price_bloc.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class ShrimpSizeListBottomSheet extends StatelessWidget {
  ShrimpSizeListBottomSheet({super.key});

  final _shrimpSize = sl<GetShrimpSizeUseCase>().invoke(null);

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
                  "Size",
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
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final data = _shrimpSize.data[index];
                return ListTile(
                  onTap: () {
                    context
                        .read<ShrimpPriceBloc>()
                        .add(ShrimpSizeChange(size: data));
                    Navigator.pop(context);
                  },
                  title: Text(data.toString()),
                );
              },
              itemCount: _shrimpSize.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
