import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

final class ShrimpPriceEntity extends Equatable {
  final List<ShrimpPriceItem> _shrimpPrices;

  const ShrimpPriceEntity({required List<ShrimpPriceItem> shrimpPrices})
      : _shrimpPrices = shrimpPrices;

  List<ShrimpPriceItem> getShrimpPricesBySize(int size) {
    return _shrimpPrices
        .where((element) => element.price[size] != null)
        .toList();
  }

  @override
  List<Object?> get props => [_shrimpPrices];
}

final class ShrimpPriceItem extends Equatable {
  final int id;
  final Map<int, int?> _prices;
  final String provinceName;
  final String cityName;
  final DateTime _createdAt;
  final PriceCreatorEntity priceCreator;

  const ShrimpPriceItem({
    required this.id,
    required prices,
    required this.priceCreator,
    required this.provinceName,
    required this.cityName,
    required createdAt,
  })  : _prices = prices,
        _createdAt = createdAt;

  String get createdAt => DateFormat("d MMMM y").format(_createdAt);

  Map<int, int?> get price => _prices;

  List<int?> priceAsList() {
    return _prices.entries.map((e) => e.value).toList();
  }

  ShrimpPriceItem copyWith({
    int? id,
    Map<int, int?>? prices,
    PriceCreatorEntity? priceCreator,
    String? provinceName,
    String? cityName,
    DateTime? createdAt,
  }) {
    return ShrimpPriceItem(
      id: id ?? this.id,
      prices: prices ?? _prices,
      priceCreator: priceCreator ?? this.priceCreator,
      provinceName: provinceName ?? this.provinceName,
      cityName: cityName ?? this.cityName,
      createdAt: createdAt ?? _createdAt,
    );
  }

  @override
  List<Object?> get props => [id, provinceName, cityName, priceCreator];
}

final class PriceCreatorEntity extends Equatable {
  final int id;
  final String name;
  final bool isVerified;
  final String occupation;
  final String avatarPath;

  const PriceCreatorEntity({
    required this.id,
    required this.name,
    required this.isVerified,
    required this.occupation,
    required this.avatarPath,
  });

  PriceCreatorEntity copyWith({
    int? id,
    String? name,
    bool? isVerified,
    String? occupation,
    String? avatarPath,
  }) {
    return PriceCreatorEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      isVerified: isVerified ?? this.isVerified,
      occupation: occupation ?? this.occupation,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }

  @override
  List<Object?> get props => [id, name, isVerified, occupation, avatarPath];
}
