import 'package:pexels_image/modules/photos/domain/entities/photo.dart';

abstract interface class PhotosRepository {
  Future<List<Photo>> getImages({
    required int page,
    required int perPage,
  });
}
