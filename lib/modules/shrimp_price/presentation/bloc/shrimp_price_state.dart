part of 'shrimp_price_bloc.dart';

enum ShrimpPriceStatus { initial, loading, success, failure }

extension ShrimpPriceStatusX on ShrimpPriceStatus {
  bool get isInitial => this == ShrimpPriceStatus.initial;
  bool get isLoading => this == ShrimpPriceStatus.loading;
  bool get isSuccess => this == ShrimpPriceStatus.success;
  bool get isFailure => this == ShrimpPriceStatus.failure;
}

final class ShrimpPriceState extends Equatable {
  final ShrimpPriceStatus status;
  final ShrimpPriceEntity shrimpPrice;
  final ShrimpPriceFilterEntity filter;

  const ShrimpPriceState({
    this.status = ShrimpPriceStatus.initial,
    this.shrimpPrice = const ShrimpPriceEntity(shrimpPrices: []),
    this.filter = const ShrimpPriceFilterEntity(),
  });

  ShrimpPriceState copyWith({
    ShrimpPriceStatus? status,
    ShrimpPriceEntity? shrimpPrice,
    ShrimpPriceFilterEntity? filter,
  }) {
    return ShrimpPriceState(
      status: status ?? this.status,
      shrimpPrice: shrimpPrice ?? this.shrimpPrice,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [status, shrimpPrice, filter];

  @override
  bool? get stringify => true;
}
