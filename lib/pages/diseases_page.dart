import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/diseases/presentation/widgets/diseases_list.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class DiseasesPage extends StatelessWidget {
  const DiseasesPage({super.key});

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
                "Daftar Penyakit",
                style: TextStyles.title3.copyWith(
                  color: Colors.blue,
                ),
              ),
            ),
            const DiseaseList()
          ],
        ),
      ),
    );
  }
}
