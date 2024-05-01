import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/verified_mark.dart';
import 'package:jala_test/shared/constants/api_url.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class ShrimpPriceCardItem extends StatelessWidget {
  const ShrimpPriceCardItem({
    super.key,
    required this.data,
    required this.size,
  });

  final ShrimpPriceItem data;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.w,
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        borderOnForeground: true,
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: .5, color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${API_URL.STORAGE}/${data.priceCreator.avatarPath}",
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.priceCreator.occupation,
                            style: TextStyles.caption2.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            data.priceCreator.name,
                            style: TextStyles.body2,
                          ),
                        ],
                      )
                    ],
                  ),
                  const VerifiedMark(isVerified: true)
                ],
              ),
              SizedBox(height: 8.w),
              Text(
                data.createdAt,
                style: TextStyles.caption2.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(
                data.provinceName,
                style: TextStyles.body3.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(data.cityName, style: TextStyles.title2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Size $size", style: TextStyles.caption2),
                      Text("IDR ${data.price[size]}",
                          style: TextStyles.display2),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Lihat Detail"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
