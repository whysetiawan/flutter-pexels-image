part of 'shrimp_price_bloc.dart';

sealed class ShrimpPriceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchShrimpPrice extends ShrimpPriceEvent {}

final class ShrimpSizeChange extends ShrimpPriceEvent {
  final int size;

  ShrimpSizeChange({required this.size});
}
