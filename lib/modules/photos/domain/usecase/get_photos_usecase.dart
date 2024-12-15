import 'package:pexels_image/core/domain/base_usecase.dart';
import 'package:pexels_image/core/domain/usecase_result.dart';
import 'package:pexels_image/modules/photos/domain/entities/photo.dart';
import 'package:pexels_image/modules/photos/domain/photos_repository.dart';

final class GetPhotosUseCase
    extends BaseUsecase<Future<Result<List<Photo>, Exception?>>, void> {
  final PhotosRepository _photosRepository;

  GetPhotosUseCase({
    required PhotosRepository photosRepository,
  }) : _photosRepository = photosRepository;

  @override
  Future<Result<List<Photo>, Exception>> invoke(void params) async {
    try {
      final result = await _photosRepository.getImages(
        page: 1,
        perPage: 10,
      );
      return Result.success(result);
    } catch (e) {
      return Result.failure(e as dynamic);
    }
  }
}
