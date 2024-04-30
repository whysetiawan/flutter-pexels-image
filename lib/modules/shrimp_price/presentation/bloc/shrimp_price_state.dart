part of 'shrimp_price_bloc.dart';

enum ShrimpPriceStatus { initial, loading, success, failure }

final class ShrimpPriceState extends Equatable {
  final ShrimpPriceStatus status;
  final List<ShrimpPriceEntity> shrimpPrices;

  const ShrimpPriceState({
    this.status = ShrimpPriceStatus.initial,
    this.shrimpPrices = const <ShrimpPriceEntity>[],
  });

  @override
  List<Object?> get props => [status, shrimpPrices];

  ShrimpPriceState copyWith({
    ShrimpPriceStatus? status,
    List<ShrimpPriceEntity>? shrimpPrices,
  }) {
    return ShrimpPriceState(
      status: status ?? this.status,
      shrimpPrices: shrimpPrices ?? this.shrimpPrices,
    );
  }

  @override
  String toString() {
    return 'ShrimpPriceState(status: $status, shrimpPrices: $shrimpPrices)';
  }
}
