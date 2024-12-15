import 'package:pexels_image/core/data/dto/paginated_response_dto.dart';
import 'package:pexels_image/modules/photos/data/dto/photo_response_dto.dart';
import 'package:pexels_image/modules/photos/domain/entities/photo.dart';

final class PhotosMapper {
  static List<Photo> mapPhotosResponseToEntity(
    PaginatedResponseDto<PhotoResponseDto> photos,
  ) {
    return photos.data
        .map(
          (photo) => Photo(
            id: photo.id,
            url: photo.src.original,
            width: photo.width,
            height: photo.height,
          ),
        )
        .toList();
  }
}
