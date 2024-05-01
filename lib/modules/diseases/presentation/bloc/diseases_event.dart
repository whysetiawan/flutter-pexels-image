part of 'diseases_bloc.dart';

sealed class DiseasesEvent extends Equatable {
  const DiseasesEvent();

  @override
  List<Object?> get props => [];
}

class GetDiseaseListEvent extends DiseasesEvent {}
