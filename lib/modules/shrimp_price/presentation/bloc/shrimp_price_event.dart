part of 'shrimp_price_bloc.dart';

sealed class ShrimpPriceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchShrimpPrice extends ShrimpPriceEvent {
  final ShrimpPriceFilterEntity filter;

  FetchShrimpPrice({
    this.filter = const ShrimpPriceFilterEntity(),
  });
}

final class ShrimpSizeChange extends ShrimpPriceEvent {
  final int size;

  ShrimpSizeChange({required this.size});
}

final class FetchRegions extends ShrimpPriceEvent {
  final String keyword;
  final ShrimpPriceFilterEntity filter;

  FetchRegions({
    this.keyword = '',
    this.filter = const ShrimpPriceFilterEntity(),
  });
}

final class ChangeRegionKeyword extends ShrimpPriceEvent {
  final String keyword;

  ChangeRegionKeyword(this.keyword);
}

final class ChangeFilterRegion extends ShrimpPriceEvent {
  final RegionEntity region;

  ChangeFilterRegion(this.region);
}
