part of 'shrimp_price_bloc.dart';

sealed class ShrimpPriceEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class ShrimpPriceFetched extends ShrimpPriceEvent {}
