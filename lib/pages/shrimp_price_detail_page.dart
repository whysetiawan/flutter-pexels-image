import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/modules/shrimp_price/presentation/widgets/verified_mark.dart';
import 'package:jala_test/shared/constants/api_url.dart';
import 'package:jala_test/shared/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ShrimpPriceDetailPage extends StatelessWidget {
  final ShrimpPriceItem _shrimpPrice;

  const ShrimpPriceDetailPage({
    super.key,
    required shrimpPrice,
  }) : _shrimpPrice = shrimpPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harga Udang"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_shrimpPrice.provinceName, style: TextStyles.title3),
                  Text(_shrimpPrice.regionName, style: TextStyles.title3),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _shrimpPrice.createdAt,
                        style: TextStyles.body2,
                      ),
                      SizedBox(width: 8.w),
                      VerifiedMark(
                        isVerified: _shrimpPrice.priceCreator.isVerified,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${API_URL.STORAGE}/${_shrimpPrice.priceCreator.avatarPath}",
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _shrimpPrice.priceCreator.occupation,
                            style: TextStyles.caption2,
                          ),
                          Text(
                            _shrimpPrice.priceCreator.name,
                            style: TextStyles.title4,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kontak", style: TextStyles.body3),
                          Text(
                            _shrimpPrice.priceCreator.phoneNumber,
                            style: TextStyles.title3,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          launchUrl(
                            Uri.parse(
                              "tel:${_shrimpPrice.priceCreator.phoneNumber}",
                            ),
                          );
                        },
                        child: const Text("Hubungi"),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.w),
                  Text(
                    "Daftar Harga",
                    style: TextStyles.title3,
                  ),
                  ..._shrimpPrice.priceAsList().map(
                    (e) {
                      final formattedPrice = NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(e.value);
                      return Padding(
                        padding: EdgeInsets.only(top: 12.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                "Size ${e.key}",
                              ),
                            ),
                            Text(
                              formattedPrice,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // bool get wantKeepAlive => false;
}
