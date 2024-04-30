import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/core/di.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_size_usecase.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class ShrimpSizeList extends StatelessWidget {
  const ShrimpSizeList({super.key});

  @override
  Widget build(BuildContext context) {
    final shrimpSize = sl<GetShrimpSizeUseCase>().invoke(null);
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
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(shrimpSize.data[index].toString()),
                );
              },
              itemCount: shrimpSize.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
