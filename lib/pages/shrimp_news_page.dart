import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/shrimp_news/presentation/widgets/news_list.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class ShrimpNewsPage extends StatelessWidget {
  const ShrimpNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                16.w,
              ),
              child: Text(
                "Kabar Udang",
                style: TextStyles.title3.copyWith(
                  color: Colors.blue,
                ),
              ),
            ),
            const NewsList()
          ],
        ),
      ),
    );
  }
}
