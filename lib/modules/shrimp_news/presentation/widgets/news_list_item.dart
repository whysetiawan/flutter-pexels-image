import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pexels_image/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:pexels_image/routes/routes.dart';
import 'package:pexels_image/shared/constants/api_url.dart';
import 'package:pexels_image/shared/styles/text_styles.dart';
import 'package:share_plus/share_plus.dart';

class NewsListItem extends StatelessWidget {
  final NewsEntity _news;
  const NewsListItem({super.key, required NewsEntity news}) : _news = news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.postsDetail, arguments: _news);
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
                child: Image.network(
                  "${API_URL.STORAGE}/${_news.thumbnailPath}",
                  height: 160.w,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_news.title, style: TextStyles.display3),
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
                        InkWell(
                          onTap: () {
                            Share.share("${API_URL.HOST}/posts/${_news.id}");
                          },
                          child: const Icon(Icons.share, color: Colors.grey),
                        ),
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
