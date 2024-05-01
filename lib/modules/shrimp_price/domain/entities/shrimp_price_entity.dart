import 'package:equatable/equatable.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/price_creator_entity.dart';

final class ShrimpPriceEntity extends Equatable {
  final int id;
  final Map<int, int?> _prices;

  final String provinceName;
  final String cityName;
  final PriceCreatorEntity priceCreator;

  const ShrimpPriceEntity({
    required this.id,
    required prices,
    required this.priceCreator,
    required this.provinceName,
    required this.cityName,
  }) : _prices = prices;

  List<int?> priceList() {
    return _prices.entries.map((e) => e.value).toList();
  }

  ShrimpPriceEntity copyWith({
    int? id,
    Map<int, int?>? prices,
    PriceCreatorEntity? priceCreator,
    String? provinceName,
    String? cityName,
  }) {
    return ShrimpPriceEntity(
      id: id ?? this.id,
      prices: prices ?? _prices,
      priceCreator: priceCreator ?? this.priceCreator,
      provinceName: provinceName ?? this.provinceName,
      cityName: cityName ?? this.cityName,
    );
  }

  @override
  List<Object?> get props => [id, provinceName, cityName, priceCreator];
}
