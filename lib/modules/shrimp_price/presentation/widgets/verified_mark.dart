import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/shared/constants/assets_path.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class VerifiedMark extends StatelessWidget {
  final bool isVerified;
  const VerifiedMark({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    if (isVerified) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.yellow.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.all(4.w),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.ic_verified,
              width: 16,
            ),
            SizedBox(width: 4.w),
            Text("Terverifikasi", style: TextStyles.caption2),
          ],
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.all(4.w),
      child: Text("Belum Terverifikasi", style: TextStyles.caption2),
    );
  }
}
