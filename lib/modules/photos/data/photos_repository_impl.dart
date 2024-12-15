import 'package:pexels_image/modules/photos/data/api/photos_api.dart';
import 'package:pexels_image/modules/photos/data/mapper/photos_mapper.dart';
import 'package:pexels_image/modules/photos/domain/photos_repository.dart';
import 'package:pexels_image/shared/utils/logger.dart';

final class PhotosRepositoryImpl implements PhotosRepository {
  final PhotosApiDataSource _photosApiDataSource;

  const PhotosRepositoryImpl({
    required PhotosApiDataSource photosApiDataSource,
  }) : _photosApiDataSource = photosApiDataSource;

  @override
  getImages({
    required int page,
    required int perPage,
  }) async {
    final photos =
        await _photosApiDataSource.getImages(page: page, perPage: perPage);
    logger.d("PHOTOS $photos");
    logger.d("MAPPING PHOTOS");
    final mappedPhotos = PhotosMapper.mapPhotosResponseToEntity(photos);
    logger.d("MAPPED PHOTOS $mappedPhotos");
    return mappedPhotos;
  }
}
