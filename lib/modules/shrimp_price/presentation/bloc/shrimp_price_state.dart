part of 'shrimp_price_bloc.dart';

enum FetchShrimpPriceStatus { initial, loading, success, failure }

enum FetchRegionsStatus { initial, loading, success, failure }

extension FetchShrimpPriceStatusX on FetchShrimpPriceStatus {
  bool get isInitial => this == FetchShrimpPriceStatus.initial;
  bool get isLoading => this == FetchShrimpPriceStatus.loading;
  bool get isSuccess => this == FetchShrimpPriceStatus.success;
  bool get isFailure => this == FetchShrimpPriceStatus.failure;
}

extension FetchRegionsStatusX on FetchRegionsStatus {
  bool get isInitial => this == FetchRegionsStatus.initial;
  bool get isLoading => this == FetchRegionsStatus.loading;
  bool get isSuccess => this == FetchRegionsStatus.success;
  bool get isFailure => this == FetchRegionsStatus.failure;
}

final class ShrimpPriceState extends Equatable {
  final FetchShrimpPriceStatus fetchShrimpPriceStatus;
  final ShrimpPriceEntity shrimpPrice;
  final ShrimpPriceFilterEntity filter;

  final FetchRegionsStatus fetchRegionStatus;
  final PaginatedRegionEntity regions;
  final String regionKeyword;

  const ShrimpPriceState({
    this.fetchShrimpPriceStatus = FetchShrimpPriceStatus.initial,
    this.shrimpPrice = const ShrimpPriceEntity(shrimpPrices: []),
    this.filter = const ShrimpPriceFilterEntity(),
    this.fetchRegionStatus = FetchRegionsStatus.initial,
    this.regions = const PaginatedRegionEntity(
      currentPage: 0,
      lastPage: 0,
      perPage: 0,
      total: 0,
      data: [],
    ),
    this.regionKeyword = '',
  });

  List<ShrimpPriceItem> get shrimpPrices =>
      shrimpPrice.getShrimpPricesBySize(filter.size);
  List<RegionEntity> get regionList => regions.data;

  ShrimpPriceState copyWith({
    FetchShrimpPriceStatus? fetchShrimpPriceStatus,
    ShrimpPriceEntity? shrimpPrice,
    ShrimpPriceFilterEntity? filter,
    FetchRegionsStatus? fetchRegionsStatus,
    PaginatedRegionEntity? regions,
    String? regionKeyword,
  }) {
    return ShrimpPriceState(
      fetchShrimpPriceStatus:
          fetchShrimpPriceStatus ?? this.fetchShrimpPriceStatus,
      shrimpPrice: shrimpPrice ?? this.shrimpPrice,
      filter: filter ?? this.filter,
      fetchRegionStatus: fetchRegionsStatus ?? fetchRegionStatus,
      regions: regions ?? this.regions,
      regionKeyword: regionKeyword ?? this.regionKeyword,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fetchShrimpPriceStatus,
        shrimpPrice,
        filter,
        fetchRegionStatus,
        regions,
        regionKeyword,
      ];
}
