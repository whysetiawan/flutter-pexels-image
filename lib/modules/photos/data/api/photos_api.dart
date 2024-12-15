import 'package:dio/dio.dart';
import 'package:pexels_image/core/data/dto/paginated_response_dto.dart';
import 'package:pexels_image/modules/photos/data/dto/photo_response_dto.dart';

class PhotosApiDataSource {
  final Dio client;

  const PhotosApiDataSource({required this.client});

  getImages({
    required int page,
    int perPage = 10,
  }) async {
    final response = await client.get('/curated', queryParameters: {
      'page': page,
      'per_page': perPage,
    });

    return PaginatedResponseDto<PhotoResponseDto>.fromJson(
      response.data,
      (json) {
        final photos = json["photos"] as List;
        return photos.map((photo) => PhotoResponseDto.fromJson(photo)).toList();
      },
    );
  }
}
