part of 'photos_bloc.dart';

enum FetchPhotosStatus { initial, loading, success, failure }

extension FetchPhotosStatusX on FetchPhotosStatus {
  bool get isInitial => this == FetchPhotosStatus.initial;
  bool get isLoading => this == FetchPhotosStatus.loading;
  bool get isSuccess => this == FetchPhotosStatus.success;
  bool get isFailure => this == FetchPhotosStatus.failure;
}

final class PhotosState extends Equatable {
  final FetchPhotosStatus status;
  final List<Photo> photos;
  final int page;

  const PhotosState({
    this.status = FetchPhotosStatus.initial,
    this.photos = const [],
    this.page = 1,
  });

  PhotosState copyWith({
    FetchPhotosStatus? status,
    List<Photo>? photos,
    int? page,
  }) {
    return PhotosState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [
        status,
        photos,
        page,
      ];
}
