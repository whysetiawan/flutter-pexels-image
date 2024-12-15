import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_image/modules/photos/domain/entities/photo.dart';
import 'package:pexels_image/modules/photos/domain/usecase/get_photos_usecase.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final GetPhotosUseCase _getPhotosUseCase;

  PhotosBloc(
    GetPhotosUseCase getPhotosUseCase,
  )   : _getPhotosUseCase = getPhotosUseCase,
        super(const PhotosState()) {
    on<GetPhotosEvent>(_handleGetPhotos);
  }

  _handleGetPhotos(
    GetPhotosEvent event,
    Emitter<PhotosState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FetchPhotosStatus.loading,
      ),
    );

    final result = await _getPhotosUseCase.invoke(null);

    if (result.isSuccess) {
      return emit(
        state.copyWith(
          status: FetchPhotosStatus.success,
          photos: result.data,
        ),
      );
    }

    return emit(
      state.copyWith(
        status: FetchPhotosStatus.failure,
      ),
    );
  }
}
