part of 'shrimp_news_bloc.dart';

sealed class ShrimpNewsEvent extends Equatable {
  const ShrimpNewsEvent();

  @override
  List<Object?> get props => [];
}

class GetShrimpNewsEvent extends ShrimpNewsEvent {}
