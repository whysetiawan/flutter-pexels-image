part of 'shrimp_news_bloc.dart';

enum FetchShrimpNewsStatus { initial, loading, success, failure }

extension FetchShrimpNewsStatusX on FetchShrimpNewsStatus {
  bool get isInitial => this == FetchShrimpNewsStatus.initial;
  bool get isLoading => this == FetchShrimpNewsStatus.loading;
  bool get isSuccess => this == FetchShrimpNewsStatus.success;
  bool get isFailure => this == FetchShrimpNewsStatus.failure;
}

final class ShrimpNewsState extends Equatable {
  final FetchShrimpNewsStatus fetchShrimpNewsStatus;
  final List<NewsEntity> news;

  const ShrimpNewsState({
    this.fetchShrimpNewsStatus = FetchShrimpNewsStatus.initial,
    this.news = const [],
  });

  ShrimpNewsState copyWith({
    FetchShrimpNewsStatus? status,
    List<NewsEntity>? news,
  }) {
    return ShrimpNewsState(
      fetchShrimpNewsStatus: status ?? fetchShrimpNewsStatus,
      news: news ?? this.news,
    );
  }

  @override
  List<Object?> get props => [fetchShrimpNewsStatus, news];
}
