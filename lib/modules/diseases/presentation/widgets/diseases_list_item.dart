import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';
import 'package:jala_test/routes/routes.dart';
import 'package:jala_test/shared/constants/api_url.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

class DiseaseListItem extends StatelessWidget {
  final DiseaseEntity _news;
  const DiseaseListItem({super.key, required DiseaseEntity news})
      : _news = news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(Routes.diseaseDetail, arguments: _news);
        },
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: _news.thumbnailPath == "No Image"
                    ? SizedBox(
                        height: 160.w,
                        child: const Center(
                          child: Text("No Image Provided"),
                        ),
                      )
                    : Image.network(
                        "${API_URL.STORAGE}/${_news.thumbnailPath}",
                        height: 160.w,
                        fit: BoxFit.cover,
                      ),
                // child:
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_news.fullName, style: TextStyles.display3),
                    Text(
                      _news.description,
                      style: TextStyles.body2.copyWith(
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _news.createdAt,
                          style: TextStyles.body2.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const Icon(Icons.share, color: Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
