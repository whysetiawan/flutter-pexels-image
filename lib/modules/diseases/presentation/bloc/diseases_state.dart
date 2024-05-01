part of 'diseases_bloc.dart';

enum FetchDiseaseListStatus { initial, loading, success, failure }

extension FetchDiseaseListStatusX on FetchDiseaseListStatus {
  bool get isInitial => this == FetchDiseaseListStatus.initial;
  bool get isLoading => this == FetchDiseaseListStatus.loading;
  bool get isSuccess => this == FetchDiseaseListStatus.success;
  bool get isFailure => this == FetchDiseaseListStatus.failure;
}

final class DiseasesState extends Equatable {
  final FetchDiseaseListStatus fetchDiseaseListStatus;
  final List<DiseaseEntity> diseases;

  const DiseasesState({
    this.fetchDiseaseListStatus = FetchDiseaseListStatus.initial,
    this.diseases = const [],
  });

  DiseasesState copyWith({
    FetchDiseaseListStatus? status,
    List<DiseaseEntity>? diseases,
  }) {
    return DiseasesState(
      fetchDiseaseListStatus: status ?? fetchDiseaseListStatus,
      diseases: diseases ?? this.diseases,
    );
  }

  @override
  List<Object?> get props => [fetchDiseaseListStatus, diseases];
}
